using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Security.Principal;
using System.ServiceModel.Channels;
using WW.Cad.Drawing;
using WW.Cad.Drawing.Surface;
using WW.Cad.IO;
using WW.Cad.Model;
using WW.Cad.Model.Entities;
using WW.Math;
using static WW.Cad.Model.DxfExtendedData;
using static WW.Cad.Model.DxfValueFormat;
using static WW.Cad.Model.Entities.DxfDimension;
using static WW.Cad.Model.Objects.Annotations.DxfDimensionObjectContextData;
using WW.Windows.Ole;
using System.Xml.Linq;
using Point3D = WW.Math.Point3D;
using static WW.Cad.Model.Entities.DxfPattern;
using WW.Cad.Model.Tables;

namespace PLS_Post_Processor.Helpers
{

    /// <summary>
    /// <para>
    /// To convert PLS-Pole dimensions (consisting of line, 3D Face, and text entities) into proper DXF dimension entities
    /// using C# and CadLib 4.0, you'll need to analyze the PLS-generated entities and reconstruct them as native DXF dimension
    /// objects. This requires identifying dimension patterns in the DXF file and converting them.
    /// </para>
    /// <para>
    /// This implementation provides a framework for converting PLS-Pole dimensions (constructed from line, 3D Face, and
    /// text entities) to native DXF dimension entities.
    /// Here's how it works:
    ///     1. Entity Identification: The code analyzes the DXF file looking for patterns of entities(lines, text, 3D faces)
    ///        that together form a dimension.
    ///     2. Pattern Recognition: It identifies dimension components by:
    ///         *) Grouping entities by layer(PLS often uses specific dimension layers)
    ///         *) Finding text entities that likely contain dimension values
    ///         *) Identifying nearby lines that could be extension and dimension lines
    ///         *) Detecting 3D faces that might represent arrows or other dimension components
    ///     3. Dimension Creation: Once a pattern is identified, it creates the appropriate DXF dimension entity:
    ///         *) Linear dimensions(most common in structural drawings)
    ///         *) Angular dimensions(for angle measurements)
    ///         *) Radius and diameter dimensions(for circular elements)
    ///     4. Geometry Analysis: The code includes helper methods to:
    ///         *) Detect parallel and perpendicular lines
    ///         *) Calculate distances between entities
    ///         *) Identify extension and dimension lines
    /// </para>
    /// <para>
    /// This approach requires some fine-tuning for your specific PLS-generated drawings, as PLS-Pole may have
    /// consistent patterns in how it generates dimension entities.
    /// You might need to:
    ///     1. Examine your specific DXF files to identify pattern characteristics
    ///     2. Adjust the proximity thresholds based on your drawing scale
    ///     3. Complete the implementation for specific dimension types(angular, radius, diameter)
    /// </para>
    /// </summary>
    public class PlsToDxfDimensionConverter
    {
        private readonly DxfModel _dxfModel;
        private readonly DxfLayer _dxfLayer;
        //private readonly DxfDocument _dxfDoc;
        private readonly List<DxfEntity> _entitiesToRemove = new List<DxfEntity>();
        private readonly List<DxfDimension> _dimensionsToAdd = new List<DxfDimension>();

        public PlsToDxfDimensionConverter(DxfModel model)
        {
            _dxfModel = model;
            _dxfLayer = new DxfLayer {
                Color = Color.CreateFromRgb(128, 0, 128),
                Name = "Replace_Dimensions"
            };
        }

        //public PlsToDxfDimensionConverter(string inputFilePath)
        //{
        //    // Load the DXF file
        //    _dxfDoc =  new DXFDocument();
        //    _dxfDoc.Load(inputFilePath);
        //}

        public void ConvertPlsDimensionsToNativeDimensions()
        {
            // Get all entities from the document
            //List<DxfEntity> allEntities = _dxfDoc.GetEntities();
            List<DxfEntity> allEntities = _dxfModel.Entities.ToList();

            // Group entities by layer to help identify related dimension components
            var entitiesByLayer = allEntities.GroupBy(e => e.Layer).ToDictionary(
                                                                        group => group.Key.Name,    // Layer name as key
                                                                        group => group.ToList());   // List of entities as value

            foreach (var layerGroup in entitiesByLayer)
            {
                // PLS typically puts dimension components on specific layers
                if (layerGroup.Key.StartsWith("Annotation")) // || layerGroup.Key.Contains("DIMENSION"))
                {
                    List<DxfEntity> layerEntities = layerGroup.Value.ToList();
                    IdentifyAndConvertDimensions(layerEntities);
                }
            }

            // Remove the original PLS dimension entities
            foreach (var entity in _entitiesToRemove)
            {
                _dxfModel.Entities.Remove(entity);
                //_dxfDoc.RemoveEntity(entity);
            }

            // Add the new dimension entities
            foreach (var dimension in _dimensionsToAdd)
            {
                _dxfModel.Entities.Add(dimension);
                //_dxfDoc.AddEntity(dimension);
            }
        }

        /// <summary>
        /// Identify the PLS dimension and convert to DXF dimension.
        /// </summary>
        /// <param name="layerEntities"></param>
        private void IdentifyAndConvertDimensions(List<DxfEntity> layerEntities)
        {
            // Get lines, text entities, and 3D faces separately
            var lines = layerEntities.OfType<DxfLine>().ToList();
            var textEntities = layerEntities.OfType<DxfText>().ToList();
            var faces = layerEntities.OfType<Dxf3DFace>().ToList();

            // PLS dimension are made up of 2 = Dxf3DFace entities and 1 - line with
            // a Dxf3DFace on each end of the line.
            // !!! PLS dimension do NOT have extension lines !!!
            // Process each 'lines' entity to find the two matching 'faces' entities of the dimension.
            foreach (var line in lines)
            {
                // Find two attached 3DFaces
                var attachedFaces = FindAttached3DFaces(line, faces);

                const double proximityThreshold = 0.01;    // Adjust based on your drawing scale
                foreach (var face in attachedFaces)
                {
                    var dist0 = CalculateDistance(line.Start, face.Points[0]) < proximityThreshold;
                    var dist1 = CalculateDistance(line.Start, face.Points[1]) < proximityThreshold;
                    var dist2 = CalculateDistance(line.Start, face.Points[2]) < proximityThreshold;
                    var dist3 = CalculateDistance(line.Start, face.Points[3]) < proximityThreshold;
                    var dist4 = CalculateDistance(line.End, face.Points[0]) < proximityThreshold;
                    var dist5 = CalculateDistance(line.End, face.Points[1]) < proximityThreshold;
                    var dist6 = CalculateDistance(line.End, face.Points[2]) < proximityThreshold;
                    var dist7 = CalculateDistance(line.End, face.Points[3]) < proximityThreshold;
                }

                if (attachedFaces.Count == 2)
                {
                    var text = FindNearbyText(line, textEntities);

                    //try
                    //{
                    //    // Create dimension based on identified components
                    //    DxfDimension newDimension = CreateDimensionFromComponents(textEntity, nearbyLines);

                    //    if (newDimension != null)
                    //    {
                    //        _dimensionsToAdd.Add(newDimension);

                    //        // Mark original entities for removal
                    //        _entitiesToRemove.Add(textEntity);
                    //        foreach (var line in nearbyLines)
                    //        {
                    //            _entitiesToRemove.Add(line);
                    //        }

                    //        // Find and mark any arrows or other dimension components for removal
                    //        var relatedFaces = FindRelatedFaces(textEntity, nearbyLines, faces);
                    //        foreach (var face in relatedFaces)
                    //        {
                    //            _entitiesToRemove.Add(face);
                    //        }
                    //    }
                    //}
                    //catch (Exception ex)
                    //{
                    //    Console.WriteLine($"Error converting dimension: {ex.Message}");
                    //}
                }
            }

            //// Process each text entity as a potential dimension value
            //foreach (var textEntity in textEntities)
            //{
            //    // Find lines that could be extension lines or dimension lines near the text
            //    var nearbyLines = FindNearbyLines(textEntity, lines);

            //    if (nearbyLines.Count >= 3) // Minimum needed for a dimension (2 extension lines + 1 dimension line)
            //    {
            //        try
            //        {
            //            // Create dimension based on identified components
            //            DxfDimension newDimension = CreateDimensionFromComponents(textEntity, nearbyLines);

            //            if (newDimension != null)
            //            {
            //                _dimensionsToAdd.Add(newDimension);

            //                // Mark original entities for removal
            //                _entitiesToRemove.Add(textEntity);
            //                foreach (var line in nearbyLines)
            //                {
            //                    _entitiesToRemove.Add(line);
            //                }

            //                // Find and mark any arrows or other dimension components for removal
            //                var relatedFaces = FindRelatedFaces(textEntity, nearbyLines, faces);
            //                foreach (var face in relatedFaces)
            //                {
            //                    _entitiesToRemove.Add(face);
            //                }
            //            }
            //        }
            //        catch (Exception ex)
            //        {
            //            Console.WriteLine($"Error converting dimension: {ex.Message}");
            //        }
            //    }
            //}
        }

        /// <summary>
        /// Find text near the dimension line.
        /// </summary>
        /// <param name="line">The dimension line</param>
        /// <param name="textEntities">all text entities on a layer</param>
        /// <returns></returns>
        private object FindNearbyText(DxfLine line, List<DxfText> textEntities)
        {
            // Define proximity threshold for considering lines part of the same dimension
            double proximityThreshold = 2.5; // 5.0; // Adjust based on your drawing scale

            return textEntities
                .Where(text =>
                    CalculateDistance(text.AlignmentPoint1, line.Start) < proximityThreshold ||
                    CalculateDistance(text.AlignmentPoint1, line.End) < proximityThreshold)
            .ToList();
        }

        private List<Dxf3DFace> FindAttached3DFaces(DxfLine line, List<Dxf3DFace> allFaces)
        {
            // Define proximity threshold for considering lines part of the same dimension
            const double proximityThreshold = 0.01;    // Adjust based on your drawing scale

            if (IsVerticalLine(line.Start, line.End))   // X start ~= X end
            {
                return allFaces
                    .Where(face =>
                        CalculateDistance(line.Start, face.Points[0]) < proximityThreshold ||
                        CalculateDistance(line.Start, face.Points[1]) < proximityThreshold ||
                        CalculateDistance(line.Start, face.Points[2]) < proximityThreshold ||
                        CalculateDistance(line.Start, face.Points[3]) < proximityThreshold ||
                        CalculateDistance(line.End, face.Points[0]) < proximityThreshold ||
                        CalculateDistance(line.End, face.Points[1]) < proximityThreshold ||
                        CalculateDistance(line.End, face.Points[2]) < proximityThreshold ||
                        CalculateDistance(line.End, face.Points[3]) < proximityThreshold)
                    .ToList();
            }
            else   // The line is horizontal: Y start ~= Y end.
            {
                return allFaces
                    .Where(face =>
                        CalculateDistance(line.Start, face.Points[0]) < proximityThreshold ||
                        CalculateDistance(line.Start, face.Points[1]) < proximityThreshold ||
                        CalculateDistance(line.Start, face.Points[2]) < proximityThreshold ||
                        CalculateDistance(line.Start, face.Points[3]) < proximityThreshold ||
                        CalculateDistance(line.End, face.Points[0]) < proximityThreshold ||
                        CalculateDistance(line.End, face.Points[1]) < proximityThreshold ||
                        CalculateDistance(line.End, face.Points[2]) < proximityThreshold ||
                        CalculateDistance(line.End, face.Points[3]) < proximityThreshold)
                    .ToList();
            }

            return new List<Dxf3DFace>();
        }

        private List<DxfLine> FindNearbyLines(DxfText textEntity, List<DxfLine> allLines)
        {
            // Define proximity threshold for considering lines part of the same dimension
            double proximityThreshold = 2.5; // 5.0; // Adjust based on your drawing scale

            return allLines
                .Where(line =>
                    CalculateDistance(textEntity.AlignmentPoint1, line.Start) < proximityThreshold ||
                    CalculateDistance(textEntity.AlignmentPoint1, line.End) < proximityThreshold)
            .ToList();
        }

        private List<Dxf3DFace> FindRelatedFaces(DxfText textEntity, List<DxfLine> dimensionLines, List<Dxf3DFace> allFaces)
        {
            // Define proximity threshold for identifying related faces (arrows, etc.)
            double proximityThreshold = 5.0; // 10.0; // Adjust based on your drawing scale

            // Get all endpoints from dimension lines
            List<Point3D> lineEndpoints = new List<Point3D>();
            foreach (var line in dimensionLines)
            {
                lineEndpoints.Add(line.Start);
                lineEndpoints.Add(line.End);
            }

            // Find faces near any line endpoint or text insertion point
            return allFaces
                .Where(face =>
                    lineEndpoints.Any(point => CalculateDistance(point, face.Points[0]) < proximityThreshold) ||
                    lineEndpoints.Any(point => CalculateDistance(point, face.Points[1]) < proximityThreshold) ||
                    lineEndpoints.Any(point => CalculateDistance(point, face.Points[2]) < proximityThreshold) ||
                    CalculateDistance(textEntity.AlignmentPoint1, face.Points[0]) < proximityThreshold)
            .ToList();
            //return allFaces
            //    .Where(face =>
            //        lineEndpoints.Any(point => CalculateDistance(point, face.Vertex1) < proximityThreshold) ||
            //        lineEndpoints.Any(point => CalculateDistance(point, face.Vertex2) < proximityThreshold) ||
            //        lineEndpoints.Any(point => CalculateDistance(point, face.Vertex3) < proximityThreshold) ||
            //        CalculateDistance(textEntity.AlignmentPoint1, face.Vertex1) < proximityThreshold)
            //.ToList();
        }

        private DxfDimension CreateDimensionFromComponents(DxfText textEntity, List<DxfLine> dimensionLines)
        {
            // Analyze lines to determine dimension type
            if (IsLinearDimension(dimensionLines))
            {
                return CreateLinearDimension(textEntity, dimensionLines);
            }
            else if (IsAngularDimension(dimensionLines))
            {
                return CreateAngularDimension(textEntity, dimensionLines);
            }
            else if (IsRadiusDimension(dimensionLines))
            {
                return CreateRadiusDimension(textEntity, dimensionLines);
            }
            else if (IsDiameterDimension(dimensionLines))
            {
                return CreateDiameterDimension(textEntity, dimensionLines);
            }

            return null;
        }

        private bool IsLinearDimension(List<DxfLine> lines)
        {
            // Implement logic to detect if lines form a linear dimension
            // Typically: 2 parallel extension lines + 1 perpendicular dimension line
            // This is a simplified detection algorithm - would need refinement for real-world use

            if (lines.Count < 3) return false;

            // Try to find parallel lines (potential extension lines)
            var parallelPairs = FindParallelLinePairs(lines);
            if (parallelPairs.Count > 0)
            {
                // Check if we can find a perpendicular line to these (potential dimension line)
                foreach (var pair in parallelPairs)
                {
                    var otherLines = lines.Except(pair).ToList();
                    foreach (var line in otherLines)
                    {
                        if (IsPerpendicularTo(line, pair[0]))
                        {
                            return true;
                        }
                    }
                }
            }

            return false;
        }

        // Other dimension type detection methods would be implemented similarly
        private bool IsAngularDimension(List<DxfLine> lines)
        {
            // Implementation for angular dimension detection
            return false;
        }

        private bool IsRadiusDimension(List<DxfLine> lines)
        {
            // Implementation for radius dimension detection
            return false;
        }

        private bool IsDiameterDimension(List<DxfLine> lines)
        {
            // Implementation for diameter dimension detection
            return false;
        }

        private DxfDimension CreateLinearDimension(DxfText textEntity, List<DxfLine> dimensionLines)
        {
            // Analyze lines to determine extension lines and dimension line
            var extensionLines = IdentifyExtensionLines(dimensionLines);
            var dimensionLine = IdentifyDimensionLine(dimensionLines, extensionLines);

            if (extensionLines.Count >= 2 && dimensionLine != null)
            {
                //// Create new linear dimension
                //DxfDimension newDimension = new DxfDimension();

                //// Set dimension type
                //newDimension.DimensionType = DxfDimensionType.Linear;

                //// Set extension line points
                //newDimension.ExtLine1Point = extensionLines[0].StartPoint;
                //newDimension.ExtLine2Point = extensionLines[1].StartPoint;

                //// Set dimension line location
                //newDimension.DimLinePoint = dimensionLine.MidPoint();

                //// Set text properties
                //newDimension.Text = textEntity.Value;
                //newDimension.TextHeight = textEntity.Height;
                //newDimension.TextRotation = textEntity.Rotation;

                //// Set style properties
                //newDimension.Layer = textEntity.Layer;
                //newDimension.Color = textEntity.Color;

                Point3D midPoint = new Point3D {
                    X = (dimensionLine.Start.X + dimensionLine.End.X) / 2,
                    Y = (dimensionLine.Start.Y + dimensionLine.End.Y) / 2,
                    Z = (dimensionLine.Start.Z + dimensionLine.End.Z) / 2
                };

                var txtHt = _dxfModel.CurrentDimensionStyle.TextHeight;

                // Create new linear dimension
                DxfDimension.Aligned newDimension = new DxfDimension.Aligned(_dxfModel.CurrentDimensionStyle)
                {
                    Layer = _dxfLayer,
                    //DimensionStyle = DxfDimensionStyle.Linear,
                    ExtensionLine1StartPoint = extensionLines[0].Start,
                    ExtensionLine2StartPoint = extensionLines[1].Start,
                    InsertionPoint = midPoint,
                    //DimLinePoint = dimensionLine.MidPoint(),
                    //DimensionLineLocation = dimensionLine.,
                    Text = textEntity.Text,
                };

                return newDimension;
            }

            return null;
        }

        // Methods for creating other dimension types would follow a similar pattern
        private DxfDimension CreateAngularDimension(DxfText textEntity, List<DxfLine> dimensionLines)
        {
            // Implementation for creating an angular dimension
            return null;
        }

        private DxfDimension CreateRadiusDimension(DxfText textEntity, List<DxfLine> dimensionLines)
        {
            // Implementation for creating a radius dimension
            return null;
        }

        private DxfDimension CreateDiameterDimension(DxfText textEntity, List<DxfLine> dimensionLines)
        {
            // Implementation for creating a diameter dimension
            return null;
        }

        // Helper methods
        private List<DxfLine[]> FindParallelLinePairs(List<DxfLine> lines)
        {
            // Find pairs of lines that are parallel to each other
            List<DxfLine[]> parallelPairs = new List<DxfLine[]>();

            for (int i = 0; i < lines.Count; i++)
            {
                for (int j = i + 1; j < lines.Count; j++)
                {
                    if (AreParallel(lines[i], lines[j]))
                    {
                        parallelPairs.Add(new[] { lines[i], lines[j] });
                    }
                }
            }
            return parallelPairs;
        }

        private bool AreParallel(DxfLine line1, DxfLine line2)
        {
            // Calculate direction vectors
            Vector3 dir1 = new Vector3(
                (float)(line1.End.X - line1.Start.X),
                (float)(line1.End.Y - line1.Start.Y),
                (float)(line1.End.Z - line1.Start.Z)
            );

            Vector3 dir2 = new Vector3(
                (float)(line2.End.X - line2.Start.X),
                (float)(line2.End.Y - line2.Start.Y),
                (float)(line2.End.Z - line2.Start.Z)
            );

            // Normalize
            dir1 = Vector3.Normalize(dir1);
            dir2 = Vector3.Normalize(dir2);

            // Check if vectors are parallel (or antiparallel)
            float dotProduct = Vector3.Dot(dir1, dir2);
            return Math.Abs(Math.Abs(dotProduct) - 1.0f) < 0.01f;
        }

        private bool IsPerpendicularTo(DxfLine line1, DxfLine line2)
        {
            // Calculate direction vectors
            Vector3 dir1 = new Vector3(
                (float)(line1.End.X - line1.Start.X),
                (float)(line1.End.Y - line1.Start.Y),
                (float)(line1.End.Z - line1.Start.Z)
            );

            Vector3 dir2 = new Vector3(
                (float)(line2.End.X - line2.Start.X),
                (float)(line2.End.Y - line2.Start.Y),
                (float)(line2.End.Z - line2.Start.Z)
            );

            // Normalize
            dir1 = Vector3.Normalize(dir1);
            dir2 = Vector3.Normalize(dir2);

            // Check if vectors are perpendicular
            float dotProduct = Vector3.Dot(dir1, dir2);
            return Math.Abs(dotProduct) < 0.01f;
        }

        private List<DxfLine> IdentifyExtensionLines(List<DxfLine> lines)
        {
            // Logic to identify extension lines from a set of lines
            // Typically looking for parallel lines with similar length
            var parallelPairs = FindParallelLinePairs(lines);

            if (parallelPairs.Count > 0)
            {
                // Return the first pair found (simplified approach)
                return parallelPairs[0].ToList();
            }
            return new List<DxfLine>();
        }

        private DxfLine IdentifyDimensionLine(List<DxfLine> allLines, List<DxfLine> extensionLines)
        {
            // Find a line that is perpendicular to the extension lines
            var remainingLines = allLines.Except(extensionLines).ToList();

            foreach (var line in remainingLines)
            {
                if (extensionLines.Count > 0 && IsPerpendicularTo(line, extensionLines[0]))
                {
                    return line;
                }
            }

            return null;
        }

        private double CalculateDistance(Point3D point1, Point3D point2)
        {
            return Math.Sqrt(
                Math.Pow(point2.X - point1.X, 2) +
                Math.Pow(point2.Y - point1.Y, 2) +
                Math.Pow(point2.Z - point1.Z, 2)
            );
        }

        /// <summary>
        /// Is the line vertical, that is, X start = Y end?
        /// </summary>
        /// <param name="pt1"></param>
        /// <param name="pt2"></param>
        /// <returns></returns>
        private bool IsVerticalLine(Point3D pt1, Point3D pt2)
        {
            // Check if line is vertical by comparing x-coordinates of points
            return Math.Abs(pt1.X - pt2.X) < 0.001;
        }

        /// <summary>
        /// Determine the height of a Dxf3DFace entity either
        /// in the X direction or the Y direction.
        /// </summary>
        /// <param name="face"></param>
        /// <returns></returns>
        private double HtOf3DFace(Dxf3DFace face)
        {
            var xCoords = face.Points.Select(p => p.X).ToList();
            var yCoords = face.Points.Select(p => p.Y).ToList();

            var htX = xCoords.Max() - xCoords.Min();
            var htY = yCoords.Max() - yCoords.Min();

            return Math.Max(htX, htY);
        }

        //public void SaveConvertedFile(string outputFilePath)
        //{
        //    _dxfDoc.Save(outputFilePath);
        //}
    }

    // Example usage
    //public class Program
    //{
    //    public static void Main(string[] args)
    //    {
    //        string inputFilePath = @"C:\path\to\pls-pole-drawing.dxf";
    //        string outputFilePath = @"C:\path\to\converted-drawing.dxf";

    //        try
    //        {
    //            var converter = new PlsToDxfDimensionConverter(inputFilePath);
    //            converter.ConvertPlsDimensionsToNativeDimensions();
    //            converter.SaveConvertedFile(outputFilePath);

    //            Console.WriteLine("PLS dimensions successfully converted to native DXF dimensions.");
    //        }
    //        catch (Exception ex)
    //        {
    //            Console.WriteLine($"Error during conversion: {ex.Message}");
    //        }
    //    }
    //}
}
