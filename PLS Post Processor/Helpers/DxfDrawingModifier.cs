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
using System.Numerics;

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
        private readonly DxfModel _dxfModel;

        /// <summary>
        /// New text color for the DXF drawing.
        /// </summary>
        /// <remarks>
        /// Color Options:
        ///     Sky Blue: RGB(135, 206, 235)
        ///     Light Blue: RGB(173, 216, 230)
        ///     Powder Blue: RGB(176, 224, 230)
        ///     Baby Blue: RGB(137, 207, 240)
        ///     Pale Blue: RGB(175, 238, 238)
        ///     Light Green: RGB(144, 238, 144)
        /// </remarks>
        private readonly EntityColor _newTextColor = EntityColor.CreateFromRgb(0, 255, 255); // Cyan

        /// <summary>
        /// Font reduction factor.  Used to reduce the size of the font
        /// by dividing by the factor.
        /// A factor of 2.0 will reduce the font size by half.
        /// </summary>
        private readonly double _fontReduce = 2.0;

        private readonly double _paperHeight = 8.5;
        private readonly double _paperWidth = 11.0;

        /// <summary>
        /// The drawing scale for the DXF drawing.
        /// Drawing scale will be calculated for the DXF drawing.
        /// </summary>
        private readonly double _drawingScale = 1.0;

        /// <summary>
        /// The text height for the DXF drawing.
        /// textHt will be calculated for the DXF drawing using
        /// the drawing scale.
        /// Default text height = 0.125, which will be adjusted based on the drawing scale.
        /// </summary>
        private readonly double _textHt = 0.125;

        private readonly List<PlsDimension> _plsDimensions = new List<PlsDimension>();
        private List<DxfText> _orphanedText = new List<DxfText>();
        private List<DxfText> _newOrphanedText = new List<DxfText>();
        private List<DxfLine> _orphanedLine = new List<DxfLine>();

        private readonly string _annotationLayer = "Annotation";
        private List<DxfEntity> _annotationEntities;

        private readonly string _layerOne = "1";
        private List<DxfText> _plsLabels = new List<DxfText>();
        private List<DxfText> _plsNewLabels = new List<DxfText>();

        private readonly Dictionary<string, (Point3D tip, Point3D butt)> _poleOrigin = new Dictionary<string, (Point3D tip, Point3D butt)>();

        public DxfDrawingModifier(DxfModel model)
        {
            _dxfModel = model;
            // Get all entities from the document
            List<DxfEntity> allEntities = _dxfModel.Entities.ToList();

            // Group entities by layer to help identify related dimension components
            var entitiesByLayer = allEntities.GroupBy(e => e.Layer).ToDictionary(
                                                                        group => group.Key.Name,    // Layer name as key
                                                                        group => group.ToList());   // List of entities as value

            // Get 'Annotation' layer entities.
            _annotationEntities = entitiesByLayer[_annotationLayer];

            // *** Find all PLS labels on _layerOne = '1'
            _plsLabels = entitiesByLayer[_layerOne].OfType<DxfText>().ToList();

            // *** Calculate the text scale for the DXF drawing.
            // *** assuming a drawing size of _paperWidth = 11" and _paperHeight = 8.5"
            _drawingScale = DetermineScaleFromExistingText();
            _textHt /= _drawingScale;

            // *** Find the approximate coordinate of the pole Tip and Butt.
            FindPoleTipButt();

            //ReplaceAllPlsLabels();
            ReplaceDxfText(_plsLabels, savePlsLabels: true);

            // *** Find overlapping text entities
            TextOverlapDetector textOverlapDetector = new TextOverlapDetector(_dxfModel, _plsNewLabels, _poleOrigin.Keys.ToList());
            textOverlapDetector.ProcessOverlappingText();

            // *** Identify all PLS Dimensions on the Annotation layer
            IdentifyPlsDimensions();

            ReplacePlsDimension();

            // *** Find all orphaned text (not associated with Pls Dimension)
            FindAllOrphanText();

            ReplaceDxfText(_orphanedText);

            // *** Find Ground Line (orphaned line - not associated with Pls Dimension)
            FindAllOrphanLines();

            ReplaceOrphanedLine();

            // *** Remove all annotation entities
            RemoveAllOriginalEntities(_annotationEntities);

            RemoveAllOriginalEntities(_plsLabels.Cast<DxfEntity>().ToList());
        }

        private void RemoveAllOriginalEntities(List<DxfEntity> entities)
        {
            foreach (var entity in entities)
            {
                // Remove old PLS dimension & PLS Labels entities
                _dxfModel.Entities.Remove(entity);
            }
        }

        /// <summary>
        /// Find the approximate coordinates for the Pole Tip and Butt
        /// for all poles defined by [pole label]:g.
        /// </summary>
        private void FindPoleTipButt()
        {
            if (_plsLabels.Count == 0)
            {
                return;
            }

            var gPoleAll = _plsLabels.Where(p => p.Text.EndsWith(":g", StringComparison.OrdinalIgnoreCase)).ToList();
            foreach (var gPole in gPoleAll)
            {
                Point3D approxPoleButt = ComputePointFromDxfText(gPole, poleTip: false);
                var poleLabel = gPole.Text.GetPoleLabel();

                DxfText tPole = _plsLabels.Where(p => p.Text.EndsWith($"{poleLabel}:t", StringComparison.OrdinalIgnoreCase)).FirstOrDefault();
                Point3D approxPoleTip = ComputePointFromDxfText(tPole, poleTip: true);

                _poleOrigin.Add(poleLabel, (approxPoleTip, approxPoleButt));
            }
        }

        /// <summary>
        /// Compute the approximate center point of the DxfText.
        /// </summary>
        /// <param name="dxfText"></param>
        /// <param name="poleTip"></param>
        /// <returns></returns>
        private Point3D ComputePointFromDxfText(DxfText dxfText, bool poleTip = false)
        {
            var txtHt = dxfText.Height;
            var avgX = (dxfText.AlignmentPoint1.X + dxfText.AlignmentPoint2.Value.X) / 2;
            var dist = (poleTip ? -txtHt : txtHt);

            var newY = dxfText.AlignmentPoint1.Y + dist;

            return new Point3D(avgX, newY, dxfText.AlignmentPoint1.Z);
        }

        // 1a. Identify PLS Dimensions
        public List<PlsDimension> IdentifyPlsDimensions()
        {
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

            return _plsDimensions;
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
                    IsPointNearText(midPoint, lineIsVertical, text));
        }

        /// <summary>
        /// Checks if a point is between two other points within a specified tolerance
        ///
        /// IsPointBetween uses the "sum of distances" approach:
        ///     *) If a point is between two endpoints, then the sum of the distances from that point to each
        ///        endpoint should equal the distance between the endpoints.
        ///     *) This works within a specified tolerance(default 0.01) to account for floating-point precision
        ///
        /// The exception is when a DxfText entity contains 'xx.xx Embedment' where xx.xx is the embedment value,
        /// which must be identified as a valid PLS Dimension.
        /// If the DxfText entity contains 'Embedment' and is close to the X-Axis, it is not an embedded pole
        /// and is therefore an invalid PLS Dimension.
        /// </summary>
        /// <returns>True if pt1 is between txt1 and txt2 within the tolerance</returns>
        public bool IsPointNearText(DxfPoint point, bool lineIsVertical, DxfText text, double tolerance = 1.0)
        {
            var pt1 = point.Position;
            var txt1 = text.AlignmentPoint1;
            var txt2 = (text.AlignmentPoint2 ?? new Point3D());

            // Calculate the full distance between the two endpoints
            double fullDistance = CalculateDistance(txt1, txt2);

            // Calculate distances from point to each endpoint
            double distToTxt1 = CalculateDistance(pt1, txt1);
            double distToTxt2 = CalculateDistance(pt1, txt2);

            // Sum of distances from point to each endpoint
            double sumOfDistances = distToTxt1 + distToTxt2;

            // ** Find Embedment label using distToTxt2
            var txtTol = tolerance + (text.Height / 2.0);

            // If pt1 is between txt1 and txt2, the sum of distances should be
            // approximately equal to the full distance between txt1 and txt2
            return (Math.Abs(sumOfDistances - fullDistance) <= tolerance) ||
                    (distToTxt2 < txtTol && text.Text.EndsWith("Embedment", StringComparison.OrdinalIgnoreCase));
        }

        /// <summary>
        /// Helper method to find associated arrow heads
        /// </summary>
        /// <param name="dimensionLine"></param>
        /// <param name="faceEntites"></param>
        /// <returns></returns>
        private List<Dxf3DFace> FindAssociatedArrowHeads(DxfLine dimensionLine, List<Dxf3DFace> faceEntites) // List<DxfEntity> annotationEntities)
        {
            return faceEntites
                .OfType<Dxf3DFace>()
                .Where(face => IsArrowHeadNearLine(face, dimensionLine))
                .ToList();
        }

        /// <summary>
        /// Helper method to check if arrow head is near dimension line
        /// </summary>
        /// <param name="arrowHead"></param>
        /// <param name="dimensionLine"></param>
        /// <returns></returns>
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
        public void ReplacePlsDimension()
        {
            foreach (var plsDimension in _plsDimensions)
            {
                if (!plsDimension.IsValid) continue;

                var arrowHeadHt = (plsDimension.ArrowHeadHt == 0 ? 3 : plsDimension.ArrowHeadHt);

                var startPt = plsDimension.DimensionLine.Start;
                var endPt = plsDimension.DimensionLine.End;
                var midPt = new Point3D((startPt.X + endPt.X) / 2,
                                        (startPt.Y + endPt.Y) / 2,
                                        plsDimension.DimensionLine.Start.Z
                );

                // Create a concrete dimension entity
                // This is a generic approach - you may need to adjust based on exact CadLib4.0 dimension types
                var newDimension = new Aligned(_dxfModel.CurrentDimensionStyle)
                {
                    Layer = plsDimension.DimensionLine.Layer,
                    //Color = EntityColor.CreateFromRgb(255, 255, 0), // Yellow // plsDimension.DimensionLine.Color,
                    Color = _newTextColor,

                    // Set dimension points
                    ExtensionLine1StartPoint = plsDimension.DimensionLine.Start,
                    ExtensionLine2StartPoint = plsDimension.DimensionLine.End,

                    // DimensionLineLocation determines the position of the dimension line
                    //  *) This point specifies how far away from the object the dimension line will be placed
                    //  *) It's typically a point offset from the measured object that establishes both:
                    //      -) The distance of the dimension line from the object
                    //      -) The side of the object where the dimension appears
                    DimensionLineLocation = midPt,

                    // Set text rotation for vertical and horizontal dimensions
                    TextRotation = -Math.PI,    //  Using 1 displayed the text at 303 deg ?!?!?

                    // Set text content (if needed)
                    Text = plsDimension.DimensionText.Text
                };

                newDimension.DimensionStyleOverrides.TextStyle = _dxfModel.TextStyles["PLS_Graphics"];

                newDimension.DimensionStyleOverrides.TextHeight = _textHt;
                newDimension.DimensionStyleOverrides.ArrowSize = _textHt;

                newDimension.DimensionStyle.TextInsideExtensions = true;
                newDimension.DimensionStyle.TextVerticalAlignment = DimensionTextVerticalAlignment.Centered;

                newDimension.DimensionStyleOverrides.SuppressFirstExtensionLine = true;
                newDimension.DimensionStyleOverrides.SuppressSecondExtensionLine = true;

                // Add new dimension to the document
                _dxfModel.Entities.Add(newDimension);

                // *** Regenerate the dimension block
                newDimension.GenerateBlock();
            }
        }

        /// <summary>
        /// Find all DxfText NOT associated with a PLS Dimension.
        /// Such as GL, CL, 0, 180 etc.
        /// </summary>
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

                    if (!found && !IsEmbeddedPole(dxfText))
                    {
                        _orphanedText.Add(dxfText);
                    }
                }
            }
        }

        public void ReplaceDxfText(List<DxfText> textList, bool savePlsLabels = false)
        {
            foreach (var dxfText in textList)
            {
                if (!dxfText.AlignmentPoint2.HasValue)
                {
                    continue;
                }

                var text = dxfText.Text;
                //var txtHt = dxfText.Height / _fontReduce;

                var txtHt = _textHt;
                var plsTxtHt = dxfText.Height;
                var deltaHt = plsTxtHt - txtHt;

                var align1 = dxfText.AlignmentPoint1;
                var al2 = dxfText.AlignmentPoint2;

                Point3D align2 = new Point3D(al2.Value.X, al2.Value.Y, al2.Value.Z);

                // Check for specific suffixes
                if (text.EndsWith(":t"))
                {
                    align1.Y += txtHt + deltaHt;
                    align2.Y += txtHt + deltaHt;
                }
                else if (text.EndsWith(":g") || text.EndsWith(":f"))
                {
                    align1.Y -= txtHt * 0.5;
                    align2.Y -= txtHt * 0.5;
                }
                else if (text.EndsWith("GL") || text.EndsWith("CL") || text.EndsWith("0") || text.EndsWith("180"))
                {
                    align1.Y += deltaHt * 0.5;
                    align2.Y += deltaHt * 0.5;
                }
                else
                {
                    align1.Y += txtHt * 0.5;
                    align2.Y += txtHt * 0.5;
                }

                DxfText newText = new DxfText();
                newText.Style = _dxfModel.TextStyles["PLS_Graphics"];
                newText.Layer = dxfText.Layer;
                //newText.Color = EntityColor.CreateFromRgb(255, 255, 0);
                newText.Color = _newTextColor;
                newText.AlignmentPoint1 = align1;
                newText.AlignmentPoint2 = align2;
                newText.Text = dxfText.Text;
                newText.Height = txtHt;

                if (savePlsLabels)
                {
                    _plsNewLabels.Add(newText);
                }
                else
                {
                    _newOrphanedText.Add(newText);
                }

                _dxfModel.Entities.Add(newText);
            }

            if (!savePlsLabels)
            {
                AdjustTextLocation(!savePlsLabels);
            }
        }

        private void AdjustTextLocation(bool orphanedText)
        {
            TextOverlapDetector textOverlapDetector = new TextOverlapDetector(_dxfModel, _newOrphanedText, _poleOrigin.Keys.ToList());
            _ = textOverlapDetector.DoTextsOverlap();

            foreach (var dxfText in _newOrphanedText)
            {
                AdjustTextAlignment(dxfText);

                if (textOverlapDetector == null || !textOverlapDetector.IsOverlappingText || !dxfText.AlignmentPoint2.HasValue)
                {
                    continue;
                }

                AdjustOverlappingText(dxfText, textOverlapDetector);
            }
        }

        private void AdjustTextAlignment(DxfText dxfText)
        {
            var al1 = new Point3D(dxfText.AlignmentPoint1);
            var al2 = new Point3D(dxfText.AlignmentPoint2.Value);

            if (dxfText.Text.Equals("CL", StringComparison.OrdinalIgnoreCase))
            {
                dxfText.HorizontalAlignment = TextHorizontalAlignment.Right;
                al1.X = -dxfText.BoxWidth / 2;
                al2.X = dxfText.BoxWidth / 2;
                dxfText.AlignmentPoint1 = al1;
                dxfText.AlignmentPoint2 = al2;
            }
        }

        private void AdjustOverlappingText(DxfText dxfText, TextOverlapDetector textOverlapDetector)
        {
            var boundingBoxes = textOverlapDetector.BoundingBoxes;
            var oBox = boundingBoxes.Find(t => t.Text.Equals(dxfText.Text));

            if (oBox == null || oBox.OverlappingBoxes.Count == 0)
            {
                return;
            }

            var oTxtIdx = oBox.OverlappingBoxes.ElementAt(0).Value;
            var bBox = boundingBoxes[oTxtIdx];
            var oDxfText = _newOrphanedText[oTxtIdx];

            AdjustTextPosition(dxfText, oDxfText); //, oAl1, oAl2);
        }

        private void AdjustTextPosition(DxfText dxfText, DxfText oDxfText)
        {
            var al1 = new Point3D(dxfText.AlignmentPoint1);
            var al2 = new Point3D(dxfText.AlignmentPoint2.Value);
            var oAl1 = new Point3D(oDxfText.AlignmentPoint1);
            var oAl2 = new Point3D(oDxfText.AlignmentPoint2.Value);

            double sign = GetSign(dxfText.Text, oDxfText.Text);
            double oSign = GetSign(oDxfText.Text, dxfText.Text);

            al1.X += _textHt * sign;
            al2.X += _textHt * sign;
            oAl1.X += _textHt * oSign;
            oAl2.X += _textHt * oSign;

            dxfText.AlignmentPoint1 = al1;
            dxfText.AlignmentPoint2 = al2;
            oDxfText.AlignmentPoint1 = oAl1;
            oDxfText.AlignmentPoint2 = oAl2;
        }

        private double GetSign(string text1, string text2)
        {
            if ((text1.Equals("0", StringComparison.OrdinalIgnoreCase) && text2.Equals("GL", StringComparison.OrdinalIgnoreCase)) ||
                (text1.Equals("GL", StringComparison.OrdinalIgnoreCase) && text2.Equals("180", StringComparison.OrdinalIgnoreCase)))
            {
                return -1;
            }
            return 1;
        }

        /// <summary>
        /// Is this text entity close to the ground line, if so the pole is not embedded.
        /// </summary>
        /// <param name="dxfText"></param>
        /// <returns>True = 'Embedment' is close to X-Axis</returns>
        private bool IsEmbeddedPole(DxfText dxfText)
        {
            return dxfText.Text.Trim().Equals("Embedment", StringComparison.OrdinalIgnoreCase) &&
                    IsPointNearGroundLine(dxfText);
        }

        private bool IsPointNearGroundLine(DxfText dxfText)
        {
            if (!dxfText.AlignmentPoint2.HasValue)
            {
                return false;
            }

            var txtHt = dxfText.BoxHeight / _fontReduce;
            var al2 = dxfText.AlignmentPoint2.Value;
            var avgY = (dxfText.AlignmentPoint1.Y + al2.Y) / 2.0;

            return avgY <= txtHt && avgY >= -txtHt;
        }

        private void FindAllOrphanLines()
        {
            foreach (var entity in _annotationEntities)
            {
                if (entity is DxfLine dxfLine)
                {
                    bool found = false;
                    foreach (var dim in _plsDimensions)
                    {
                        if (dim.DimensionLine.Start == dxfLine.Start && dim.DimensionLine.End == dxfLine.End)
                        {
                            found = true;
                            break;
                        }
                    }

                    // *** Only save the ground line
                    var groundLine = IsGroundLine(dxfLine);
                    if (!found && IsGroundLine(dxfLine))
                    {
                        _orphanedLine.Add(dxfLine);
                    }
                }
            }
        }

        /// <summary>
        /// Replace the orphaned lines with new lines
        /// </summary>
        public void ReplaceOrphanedLine()
        {
            foreach (var dxfLine in _orphanedLine)
            {
                DxfLine newLine = new DxfLine();
                newLine.Layer = dxfLine.Layer;
                //newLine.Color = EntityColor.CreateFromRgb(255, 255, 0);
                newLine.Color = _newTextColor;
                newLine.Start = new Point3D(dxfLine.Start);
                newLine.End = new Point3D(dxfLine.End);

                _dxfModel.Entities.Add(newLine);
            }
        }

        /// <summary>
        /// Is this the ground line?
        /// </summary>
        /// <param name="dxfLine"></param>
        /// <returns>True = it is the ground line</returns>
        private bool IsGroundLine(DxfLine dxfLine)
        {
            double xTol = 0.05;
            var deltaX = Math.Abs(dxfLine.Start.X + dxfLine.End.X);
            var stY = dxfLine.Start.Y;
            var stZ = dxfLine.Start.Z;
            var edY = dxfLine.End.Y;
            var edZ = dxfLine.End.Z;

            return (stY == 0.0 && stZ == 0.0 && edY == 0.0 && edZ == 0.0 && deltaX < xTol);
        }

        /// <summary>
        /// Caculate the distance between two 3D points
        /// </summary>
        /// <param name="point1"></param>
        /// <param name="point2"></param>
        /// <returns></returns>
        private double CalculateDistance(Point3D point1, Point3D point2)
        {
            return Math.Sqrt(
                Math.Pow(point2.X - point1.X, 2) +
                Math.Pow(point2.Y - point1.Y, 2) +
                Math.Pow(point2.Z - point1.Z, 2)
            );
        }

        /// <summary>
        /// Compute the scale for the DXF drawing based on paper size
        /// _paperWidth = 11.0 and _paperHeight = 8.5.
        /// </summary>
        /// <returns>Return the text scale.</returns>
        public double DetermineScaleFromExistingText()
        {
            // Calculate the bounds by iterating through all entities
            double minX = double.MaxValue;
            double minY = double.MaxValue;
            double maxX = double.MinValue;
            double maxY = double.MinValue;

            // Check all entity types that have geometric properties
            // Text entities
            foreach (var entity in _dxfModel.Entities)
            {
                if (entity is DxfText dxfText)
                {
                    minX = Math.Min(minX, dxfText.AlignmentPoint1.X);
                    minY = Math.Min(minY, dxfText.AlignmentPoint1.Y);
                    maxX = Math.Max(maxX, dxfText.AlignmentPoint2.Value.X);
                    maxY = Math.Max(maxY, dxfText.AlignmentPoint2.Value.Y);
                }
                else if (entity is DxfLine dxfLine)
                {
                    minX = Math.Min(minX, Math.Min(dxfLine.Start.X, dxfLine.End.X));
                    minY = Math.Min(minY, Math.Min(dxfLine.Start.Y, dxfLine.End.Y));
                    maxX = Math.Max(maxX, Math.Max(dxfLine.Start.X, dxfLine.End.X));
                    maxY = Math.Max(maxY, Math.Max(dxfLine.Start.Y, dxfLine.End.Y));
                }
                else if (entity is DxfCircle dxfCircle)
                {
                    minX = Math.Min(minX, dxfCircle.Center.X - dxfCircle.Radius);
                    minY = Math.Min(minY, dxfCircle.Center.Y - dxfCircle.Radius);
                    maxX = Math.Max(maxX, dxfCircle.Center.X + dxfCircle.Radius);
                    maxY = Math.Max(maxY, dxfCircle.Center.Y + dxfCircle.Radius);
                }
            }

            // Calculate drawing dimensions
            double drawingWidth = maxX - minX;
            double drawingHeight = maxY - minY;

            if (drawingHeight > 0)
            {
                var scaleX = _paperWidth / drawingWidth;
                var scaleY = _paperHeight / drawingHeight;

                var scale = Math.Min(scaleX, scaleY);

                return scale;
            }

            return 1.0; // Default if we can't determine from existing text
        }
    }
}