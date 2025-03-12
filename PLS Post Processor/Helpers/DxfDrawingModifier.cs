using System;
using System.Buffers.Text;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Net;
using System.Xml.Linq;
using WW.Cad.Model;
using WW.Cad.Model.Entities;
using WW.Cad.Model.Tables;
using static WW.Cad.Model.Entities.DxfPattern;
using static WW.Cad.Model.ProxyGraphics;
using Point3D = WW.Math.Point3D;
using static System.Net.Mime.MediaTypeNames;
using static WW.Cad.Model.Entities.DxfDimension;
using static WW.Cad.Model.Entities.DxfEntityCollection.Actions;
using static WW.Cad.Model.Entities.DxfHatch.BoundaryPath;
using System.ComponentModel;
using System.Configuration;
using WW.Cad.Drawing.Surface;
using static PLS_Post_Processor.Helpers.DxfDrawingModifier;
using NLog.LayoutRenderers;


namespace PLS_Post_Processor.Helpers
{

    /// <summary>
    /// DxfDrawingModifier is a comprehensive C# class DxfDrawingModifier to modify
    /// a DXF drawing to replace PLS dimensions and PLS Text with DXF Dimensions and DXF Text.
    ///
    /// A break down the key components:
    ///     1. PLS Dimensions Handling:
    ///         *) IdentifyPlsDimensions() method finds PLS dimensions
    ///         *) Checks for vertical or horizontal lines
    ///         *) Finds associated text and arrow heads
    ///         *) ReplacePlsDimension() method replaces PLS dimension with a standard DXF dimension
    ///
    ///     2. PLS Text Handling:
    ///         *) IdentifyOverlappingText() detects overlapping text entities
    ///         *) ModifyPlsText() adjusts text height and potentially position
    ///
    /// Key Notes and Placeholders:
    ///     *) Some methods contain placeholder logic(e.g., IsPointNearText(), AreTextsOverlapping()) that
    ///        you'll need to implement with precise geometric calculations
    ///     *) The code assumes the use of CadLib4.0 classes like DxfDocument, DxfLine, DxfText, Dxf3DFace
    ///     *) Error handling and edge cases are minimally implemented and should be expanded
    ///
    /// Suggested Improvements:
    ///     1. Implement precise geometric overlap and proximity detection algorithms
    ///     2. Add more robust error handling
    ///     3. Create configuration options for tolerance levels
    ///     4. Add logging for tracking modifications
    ///
    /// </summary>
    public class DxfDrawingModifier
    {
        //private DxfDocument _document;
        private readonly DxfModel _dxfModel;
        private readonly DxfLayer _dxfLayer;

        private readonly List<PlsDimension> _plsDimensions = new List<PlsDimension>();
        private List<DxfEntity> _annotationEntities;
        private List<DxfText> _orphanedText = new List<DxfText>();

        private readonly string annotationLayer = "Annotation";

        // Nested class to represent a PLS Dimension
        public class PlsDimension
        {
            public DxfLine DimensionLine { get; set; }
            public DxfText DimensionText { get; set; }
            public List<Dxf3DFace> ArrowHeads { get; set; }

            public double ArrowHeadHt {
                get
                {
                    double ht = 0;
                    if (ArrowHeads.Count > 0)
                    {
                        var pts = ArrowHeads[0].Points;
                        ht = Math.Abs(pts[0].Y - pts[1].Y);
                    }

                    return ht;
                }
            }

            /// <summary>
            /// Checks if the dimension line length is close to the text value
            /// </summary>
            /// <param name="tolerance">Allowed difference between line length and text value (default: 1.0)</param>
            /// <returns>True if the dimension line length is within tolerance of the text value</returns>
            private bool IsLengthCloseToTextValue(double tolerance = 1.0)
            {
                // Calculate the length of the dimension line
                double lineLength = CalculateDistance(DimensionLine.Start, DimensionLine.End);

                // Try to parse the text value
                var txt = DimensionText.Text;
                if (double.TryParse(txt, out double numericValue))
                {
                    // Check if the line length is close to the numeric value
                    return Math.Abs(lineLength - numericValue) <= tolerance;
                }

                // If text value is not numeric, return false
                return false;
            }

            /// <summary>
            /// Calculates the Euclidean distance between two 3D points
            /// </summary>
            private static double CalculateDistance(Point3D point1, Point3D point2)
            {
                double dx = point2.X - point1.X;
                double dy = point2.Y - point1.Y;
                double dz = point2.Z - point1.Z;

                return Math.Sqrt((dx * dx) + (dy * dy) + (dz * dz));
            }

            /// <summary>
            /// Is a valid PLS Dimension line: DxfLine, DxfText, & Dxf3DFace?
            ///
            /// Dimensions with only 1 arrow head are invalid
            /// Dimension where the dimension text is not within the tolerance of 1.0 is invalid
            /// </summary>
            public bool IsValid {
                get
                {
                    return DimensionLine != null &&
                           DimensionText != null &&
                           ArrowHeads?.Count > 1 &&
                           ArrowHeadHt > 0 &&
                           IsLengthCloseToTextValue();
                }
            }

            ///// <summary>
            ///// Is a valid PLS Dimension line: DxfLine, DxfText, & Dxf3DFace?
            /////
            ///// Dimensions with only 1 arrow head are invalid
            ///// </summary>
            ///// <returns></returns>
            //public bool IsValid()
            //{
            //    return DimensionLine != null &&
            //           DimensionText != null &&
            //           ArrowHeads?.Count > 1 &&
            //           ArrowHeadHt > 0 &&
            //           IsLengthCloseToTextValue();
            //}


            public override string ToString()
            {
                var test = DimensionText.AlignmentPoint1.ToString();
                string msg = $"'{DimensionText.Text}' @ ({DimensionText.AlignmentPoint1.X:f2}, " +
                              $"{DimensionText.AlignmentPoint1.Y:f2}, {DimensionText.AlignmentPoint1.Z:f2})" +
                              $" Arrow Ht: {ArrowHeadHt:f3}";

                return msg;
            }
        }

        public DxfDrawingModifier(DxfModel model)
        {
            _dxfModel = model;
            //_document = document ?? throw new ArgumentNullException(nameof(document));

            IdentifyPlsDimensions();

            foreach (var dimension in _plsDimensions)
            {
                ReplacePlsDimension(dimension);
            }

            FindAllOrphanText();

            ReplaceOrphanedText();

            // *** Remove all annotation entities
            foreach (var entity in _annotationEntities)
            {
                // Remove old PLS dimension entities
                _dxfModel.Entities.Remove(entity);
            }
        }

        private void FindAllOrphanText()
        {
            foreach (var entity in _annotationEntities)
            {
                if (entity is DxfText dxfText)
                {
                    bool found = false;
                    foreach (var dim in _plsDimensions)
                    {
                        if (dim.DimensionText.Text.Equals(dxfText.Text) && dim.IsValid)
                        {
                            found = true;
                            break;
                        }
                    }

                    if (!found)
                    {
                        _orphanedText.Add(dxfText);
                    }
                }
            }
        }

        // 1a. Identify PLS Dimensions
        public List<PlsDimension> IdentifyPlsDimensions()
        {
            // Get all entities from the document
            //List<DxfEntity> allEntities = _dxfDoc.GetEntities();
            List<DxfEntity> allEntities = _dxfModel.Entities.ToList();

            // Group entities by layer to help identify related dimension components
            var entitiesByLayer = allEntities.GroupBy(e => e.Layer).ToDictionary(
                                                                        group => group.Key.Name,    // Layer name as key
                                                                        group => group.ToList());   // List of entities as value

            // Get 'Annotation' layer entities.
            _annotationEntities = entitiesByLayer[annotationLayer];

            // Get lines, text entities, and 3D faces separately
            var lines = _annotationEntities.OfType<DxfLine>().ToList();
            var textEntities = _annotationEntities.OfType<DxfText>().ToList();
            var faces = _annotationEntities.OfType<Dxf3DFace>().ToList();

            double _dimProximity = 0.001;

            foreach (var line in lines)
            {
                // Check if line is vertical or horizontal
                bool isVertical = Math.Abs(line.Start.X - line.End.X) < _dimProximity;
                bool isHorizontal = Math.Abs(line.Start.Y - line.End.Y) < _dimProximity;

                if (!isVertical && !isHorizontal) continue;

                // Find associated text and 3DFaces
                var associatedText = FindAssociatedText(line, isVertical, textEntities); // _annotationEntities);
                var associatedArrowHeads = FindAssociatedArrowHeads(line, faces); // _annotationEntities);

                if (associatedText != null && associatedArrowHeads.Any())
                {
                    _plsDimensions.Add(new PlsDimension
                    {
                        DimensionLine = line,
                        DimensionText = associatedText,
                        ArrowHeads = associatedArrowHeads
                    });
                }
            }

            // *** Remove duplicate PLS Dimension:
            // ***  Where Text & line coordinates are identical
            //RemoveDuplicatePlsDimensions();


            //// Iterate through all entities
            //for (int i = 0; i < _dxfModel.Entities.Count; i++)
            //{
            //    var potentialDimensionLine = _dxfModel.Entities[i] as DxfLine;
            //    if (potentialDimensionLine == null) continue;

            //    // Check if line is vertical or horizontal
            //    bool isVertical = Math.Abs(potentialDimensionLine.Start.X - potentialDimensionLine.End.X) < _dimProximity;
            //    bool isHorizontal = Math.Abs(potentialDimensionLine.Start.Y - potentialDimensionLine.End.Y) < _dimProximity;

            //    if (!isVertical && !isHorizontal) continue;

            //    // Find associated text and 3DFaces
            //    var associatedText = FindAssociatedText(potentialDimensionLine);
            //    var associatedArrowHeads = FindAssociatedArrowHeads(potentialDimensionLine);

            //    if (associatedText != null && associatedArrowHeads.Any())
            //    {
            //        plsDimensions.Add(new PlsDimension
            //        {
            //            DimensionLine = potentialDimensionLine,
            //            DimensionText = associatedText,
            //            ArrowHeads = associatedArrowHeads
            //        });
            //    }
            //}

            return _plsDimensions;
        }

        private void RemoveDuplicatePlsDimensions()
        {
            var distinctDimensions = _plsDimensions
                .GroupBy(d => new { d.DimensionText, d.DimensionLine.Start.X, d.DimensionLine.Start.Y, d.DimensionLine.Start.Z })
                .Select(g => g.First())
                .ToList();
        }

        // Helper method to find associated text
        private DxfText FindAssociatedText(DxfLine dimensionLine, bool lineIsVertical, List<DxfText> txtEntities) // List<DxfEntity> annotationEntities)
        {
            // Logic to find text near the center of the dimension line
            var midPoint = new DxfPoint(
                (dimensionLine.Start.X + dimensionLine.End.X) / 2,
                (dimensionLine.Start.Y + dimensionLine.End.Y) / 2,
                dimensionLine.Start.Z
            );

            return txtEntities
                .OfType<DxfText>()
                .FirstOrDefault(text =>
                    IsPointNearText(midPoint, lineIsVertical, text)); // &&
                    //IsTextOrientationAligned(dimensionLine, text));
        }

        /// <summary>
        /// Checks if a point is between two other points within a specified tolerance
        ///
        /// This method IsPointBetween uses the "sum of distances" approach:
        ///     *) If a point is between two endpoints, then the sum of the distances from that point to each
        ///     endpoint should equal the distance between the endpoints.
        ///     *) This works within a specified tolerance(default 0.01) to account for floating-point precision
        /// </summary>
        /// <returns>True if pt1 is between txt1 and txt2 within the tolerance</returns>
        public bool IsPointNearText(DxfPoint point, bool lineIsVertical, DxfText text, double tolerance = 1.0)
        {
            var pt1 = point.Position;
            var txt1 = text.AlignmentPoint1;
            var txt2 = (text.AlignmentPoint2.HasValue ? text.AlignmentPoint2.Value : new Point3D());

            // Calculate the full distance between the two endpoints
            double fullDistance = CalculateDistance(txt1, txt2);

            // Calculate distances from point to each endpoint
            double distToTxt1 = CalculateDistance(pt1, txt1);
            double distToTxt2 = CalculateDistance(pt1, txt2);

            // Sum of distances from point to each endpoint
            double sumOfDistances = distToTxt1 + distToTxt2;

            // If pt1 is between txt1 and txt2, the sum of distances should be
            // approximately equal to the full distance between txt1 and txt2
            return Math.Abs(sumOfDistances - fullDistance) <= tolerance;
        }

        //// Helper method to check if a point is near text
        //private bool IsPointNearText(DxfPoint point, bool lineIsVertical, DxfText text, double tolerance = 1.0)
        //{
        //    // Implement proximity check logic
        //    //double distance = Math.Sqrt(
        //    //    Math.Pow(point.Position.X - text.AlignmentPoint1.X, 2) +
        //    //    Math.Pow(point.Position.Y - text.AlignmentPoint1.Y, 2)
        //    //);

        //    var proximity = tolerance / 2.0;

        //    if (lineIsVertical)
        //    {
        //        return (Math.Abs(point.Position.Y - text.AlignmentPoint1.Y) <= proximity);
        //    }
        //    else
        //    {
        //        return (Math.Abs(point.Position.X - text.AlignmentPoint1.X) <= proximity);
        //    }
        //    //return distance <= tolerance;
        //}

        //// Helper method to check text orientation
        //private bool IsTextOrientationAligned(DxfLine dimensionLine, DxfText text)
        //{
        //    // Implement text orientation alignment check
        //    // Consider text rotation and dimension line direction
        //    return true; // Placeholder
        //}

        // Helper method to find associated arrow heads
        private List<Dxf3DFace> FindAssociatedArrowHeads(DxfLine dimensionLine, List<Dxf3DFace> faceEntites) // List<DxfEntity> annotationEntities)
        {
            return faceEntites
                .OfType<Dxf3DFace>()
                .Where(face => IsArrowHeadNearLine(face, dimensionLine))
                .ToList();
            //return _dxfModel.Entities
            //    .OfType<Dxf3DFace>()
            //    .Where(face => IsArrowHeadNearLine(face, dimensionLine))
            //    .ToList();
        }

        // Helper method to check if arrow head is near dimension line
        private bool IsArrowHeadNearLine(Dxf3DFace arrowHead, DxfLine dimensionLine)
        {
            // Implement proximity and direction check logic
            var validStartPt = arrowHead.Points.Any(p =>
                CalculateDistance(p, dimensionLine.Start) < 0.01
            );

            var validEndPt = arrowHead.Points.Any(p =>
                CalculateDistance(p, dimensionLine.End) < 0.01
            );

            return validStartPt || validEndPt;
        }

        /// <summary>
        /// Replace PLS Dimension with DXF Dimension
        /// The key changes are:
        ///     1. Using DxfAlignedDimension(a typical concrete dimension type)
        ///     2. Explicitly setting dimension points
        ///     3. Setting a measurement point at the midpoint of the original line
        ///     4. Preserving the original text position
        ///     5. Optionally preserving the original text content
        ///
        /// Notes:
        ///     *) The exact dimension class (DxfAlignedDimension) may vary depending on the specific CadLib4.0 implementation
        ///     *) You might need to adjust the properties based on the exact dimension class available in your version of CadLib4.0
        ///     *) The method maintains the original goal of replacing the PLS dimension with a standard DXF dimension
        /// </summary>
        /// <remarks>
        /// Ignore PLS Dimension with only one arrow.
        /// </remarks>
        /// <param name="plsDimension"></param>
        public void ReplacePlsDimension(PlsDimension plsDimension)
        {
            if (!plsDimension.IsValid) return;
            //if (!plsDimension.IsValid()) return;

            var arrowHeadHt = (plsDimension.ArrowHeadHt == 0 ? 3 : plsDimension.ArrowHeadHt);

            var startPt = plsDimension.DimensionLine.Start;
            var endPt = plsDimension.DimensionLine.End;
            var midPt = new Point3D((startPt.X + endPt.X) / 2,
                                    (startPt.Y + endPt.Y) / 2,
                                    plsDimension.DimensionLine.Start.Z
            );


            // !!! 3/11/25: Dimensions looking much better.  Need to find the right angle for the dimension text
            // !!!          Need to resolve the GL and Angle which are not associated with a PLS Dimension.

            // Create a concrete dimension entity
            // This is a generic approach - you may need to adjust based on exact CadLib4.0 dimension types
            var newDimension = new Aligned(_dxfModel.CurrentDimensionStyle)
            {
                Layer = plsDimension.DimensionLine.Layer,
                Color = EntityColor.CreateFromRgb(255, 255, 0), // Yellow // plsDimension.DimensionLine.Color,

                // Set dimension points
                ExtensionLine1StartPoint = plsDimension.DimensionLine.Start,
                ExtensionLine2StartPoint = plsDimension.DimensionLine.End,

                // DimensionLineLocation determines the position of the dimension line
                //  *) This point specifies how far away from the object the dimension line will be placed
                //  *) It's typically a point offset from the measured object that establishes both:
                //      -) The distance of the dimension line from the object
                //      -) The side of the object where the dimension appears
                DimensionLineLocation = midPt,

                //// Specifies how the dimension text is positioned relative to the dimension line
                //AttachmentPoint = AttachmentPoint.MiddleCenter,

                //// The actual point where the dimension text is placed
                //InsertionPoint = midPt,

                //// Set measurement point (typically midpoint)
                //TextMiddlePoint = midPt,

                // Set text rotation for vertical and horizontal dimensions
                TextRotation = -Math.PI,    //  Using 1 displayed the text at 303 deg ?!?!?

                // Set text content (if needed)
                Text = plsDimension.DimensionText.Text
            };

            newDimension.DimensionStyleOverrides.TextStyle = _dxfModel.TextStyles["PLS_Graphics"];
            newDimension.DimensionStyleOverrides.TextHeight = plsDimension.DimensionText.Height / 2.0;
            newDimension.DimensionStyleOverrides.ArrowSize = arrowHeadHt / 2.0;
            //newDimension.DimensionStyleOverrides.OverrideTextInsideExtensions = true;
            newDimension.DimensionStyle.TextInsideExtensions = true;

            newDimension.DimensionStyleOverrides.SuppressFirstExtensionLine = true;
            newDimension.DimensionStyleOverrides.SuppressSecondExtensionLine = true;

            // Add text to the generated Block in the DxfDimension.
            //newDimension.GenerateBlock();
            //newDimension.Block.E

            //// Remove old PLS dimension entities
            //_dxfModel.Entities.Remove(plsDimension.DimensionLine);
            //_dxfModel.Entities.Remove(plsDimension.DimensionText);
            //plsDimension.ArrowHeads.ForEach(head => _dxfModel.Entities.Remove(head));

            // Add new dimension to the document
            _dxfModel.Entities.Add(newDimension);

            // *** Regenerate the dimension block
            newDimension.GenerateBlock();
        }

        public void ReplaceOrphanedText()
        {
            foreach (var dxfText in _orphanedText)
            {
                var txtHt = dxfText.Height / 2.0;
                var align1 = dxfText.AlignmentPoint1;
                var align2 = dxfText.AlignmentPoint2;

                DxfText newText = new DxfText(dxfText);
                newText.Layer = dxfText.Layer;
                newText.Color = EntityColor.CreateFromRgb(255, 255, 0);
                newText.AlignmentPoint1 = align1;
                newText.AlignmentPoint2 = align2;
                newText.Text = dxfText.Text;
                newText.Height = txtHt;

                _dxfModel.Entities.Add(newText);
            }
        }

        // 2a. Identify Overlapping PLS Text
        public List<DxfText> IdentifyOverlappingText()
        {
            var texts = _dxfModel.Entities.OfType<DxfText>().ToList();
            var overlappingTexts = new List<DxfText>();

            for (int i = 0; i < texts.Count; i++)
            {
                for (int j = i + 1; j < texts.Count; j++)
                {
                    if (AreTextsOverlapping(texts[i], texts[j]))
                    {
                        overlappingTexts.Add(texts[i]);
                        overlappingTexts.Add(texts[j]);
                    }
                }
            }

            return overlappingTexts.Distinct().ToList();
        }

        // Helper method to check text overlap
        private bool AreTextsOverlapping(DxfText text1, DxfText text2)
        {
            // Implement overlap detection logic
            // Consider text bounding boxes, XY plane projection
            return false; // Placeholder
        }

        // 2c. Adjust Text Height and Position
        public void ModifyPlsText(DxfText originalText)
        {
            // Create new text with adjusted height and position
            var newText = new DxfText
            {
                AlignmentPoint1 = originalText.AlignmentPoint1,
                AlignmentPoint2 = originalText.AlignmentPoint2,
                Height = 0.5 * originalText.Height,
                Text = originalText.Text,
                //InsertPoint = AdjustTextPosition(originalText)
            };

            // Replace original text
            _dxfModel.Entities.Remove(originalText);
            _dxfModel.Entities.Add(newText);
        }

        //// Helper method to adjust text position
        //private DxfPoint AdjustTextPosition(DxfText originalText)
        //{
        //    // Implement logic to adjust text position
        //    // Consider overlapping texts, drawing layout
        //    return originalText.AlignmentPoint1
        //    //return originalText.InsertPoint;
        //}

        private double CalculateDistance(Point3D point1, Point3D point2)
        {
            return Math.Sqrt(
                Math.Pow(point2.X - point1.X, 2) +
                Math.Pow(point2.Y - point1.Y, 2) +
                Math.Pow(point2.Z - point1.Z, 2)
            );
        }

    }
}
