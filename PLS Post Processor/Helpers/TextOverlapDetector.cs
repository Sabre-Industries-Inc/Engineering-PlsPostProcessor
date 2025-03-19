using System;
using System.Collections.Generic;
using System.Linq;
using WW.Cad.Model;
using WW.Cad.Model.Entities;

namespace PLS_Post_Processor.Helpers
{
    /// <summary>
    /// To determine if several DxfText entities overlap in the X-Y viewing plane using C# and CadLib4.0,
    /// you'll need to calculate the bounding box for each text entity and then check for intersections
    /// between these bounding boxes. The DxfText entity contains Text Height and BoxHeight, we can use
    /// these values along with the text position to calculate the bounding box.
    /// </summary>
    /// <remarks>
    /// Important considerations about this solution:
    ///     1. Approximation of text width: The code uses a rough approximation for text width based on character
    ///     count and text height.In practice, text width varies based on the font, character spacing, and the
    ///     specific characters used.
    ///     2. Text rotation handling: The simplified rotation handling expands the bounding box to account for
    ///     rotation, but for more precise detection with rotated text, you would need to transform all four
    ///     corners of the text box.
    ///     3. Text justification: The code assumes a standard text justification(typically bottom-left origin).
    ///     If your text uses different justification settings(center, right, etc.), you'll need to adjust the
    ///     bounding box calculation accordingly.
    ///     4. Special DxfText properties: If CadLib4.0's DxfText has more specific properties for determining
    ///     the text boundaries, you should use those instead of the approximations in this code.
    ///
    /// To use this code with greater accuracy, you might need to adjust the CalculateTextBoundingBox method based
    /// on the exact properties available in the CadLib4.0 DxfText class and the specific font metrics in your application.
    /// </remarks>
    public class TextOverlapDetector
    {
        private readonly List<BoundingBox> _boundingBoxes = new List<BoundingBox>();

        public TextOverlapDetector(DxfModel model, List<DxfText> dxfTexts, List<string> poleLabels)
        {
            MyModel = model;
            PoleLabels = poleLabels;
            TextEntities = dxfTexts;
        }

        public DxfModel MyModel { get; set; }

        public List<string> PoleLabels { get; set; }

        public List<DxfText> TextEntities { get; set; }

        public List<BoundingBox> BoundingBoxes { get => _boundingBoxes; }

        public bool IsOverlappingText { get; set; }

        /// <summary>
        /// Look for overlapping text in the provided list of DxfText entities.
        /// Overlapping text with the pole label will be given priority, that is,
        /// any other text entity overlapping the pole label will be made invisible.
        /// </summary>
        public void ProcessOverlappingText()
        {
            if (TextEntities.Count == 0)
            {
                return;
            }

            if (DoTextsOverlap())
            {
                foreach (var box in _boundingBoxes)
                {
                    //bool boxHasPoleLabel = PoleLabels.Any(lbl => lbl.Equals(box.Text));
                    foreach (var overlap in box.OverlappingBoxes)
                    {
                        // *** Make the overlapping text invisible if box contains 
                        //if (boxHasPoleLabel)
                        //{
                        TextEntities[overlap.Value].Visible = false;
                        _boundingBoxes[overlap.Value].IsVisible = false;
                        //}
                    }
                }
            }
        }

        public bool DoTextsOverlap()
        {
            List<DxfText> textEntities = TextEntities;

            if (textEntities == null || textEntities.Count < 2)
                return false;

            // Calculate bounding box for each text entity
            foreach (var text in textEntities)
            {
                var box = CalculateTextBoundingBox(text);
                _boundingBoxes.Add(new BoundingBox(text.Text, box.X1, box.Y1, box.X2, box.Y2, text.BoxWidth, text.BoxHeight));
            }

            // Check for intersections between all pairs of bounding boxes
            bool overlap = false;
            for (int i = 0; i < _boundingBoxes.Count; i++)
            {
                for (int j = i + 1; j < _boundingBoxes.Count; j++)
                {
                    if (DoBoxesIntersect(_boundingBoxes[i].BoxCorners, _boundingBoxes[j].BoxCorners))
                    {
                        _boundingBoxes[i].OverlappingBoxes.Add(_boundingBoxes[j].Text, j);
                        overlap = true;
                    }
                }
            }

            IsOverlappingText = overlap;

            return overlap;
        }

        public (double X1, double Y1, double X2, double Y2) CalculateTextBoundingBox(DxfText text)
        {
            // Get text position (usually represents the bottom-left corner)
            double x = text.AlignmentPoint1.X;
            double y = text.AlignmentPoint1.Y;

            // Calculate width based on text content and textHeight
            // This is an approximation - actual width depends on font and character spacing
            // For more accurate calculation, you may need additional font metrics
            //double approximateWidthFactor = 0.6; // This is a rough estimate
            //double width = text.Value.Length * text.Height * approximateWidthFactor;
            double width = text.BoxWidth * text.Height * text.WidthFactor;

            // Use BoxHeight if available, otherwise fall back to TextHeight
            double height = text.BoxHeight > 0 ? text.BoxHeight : text.Height;

            // Adjust bounding box based on text alignment/justification
            // This is a simplified approach - you may need to adjust based on actual alignment settings
            double x1 = x;
            double y1 = y;
            double x2 = x + width;
            double y2 = y + height;

            // If text has rotation, this needs to be factored in (simplified version)
            if (text.Rotation != 0)
            {
                // This is a simplified approach for rotation
                // For accurate rotation handling, you'd need to transform all four corners
                double angle = text.Rotation * Math.PI / 180.0;
                double cos = Math.Cos(angle);
                double sin = Math.Sin(angle);

                // Expand the bounding box a bit to account for rotation
                double expandFactor = 1.2;
                double centerX = (x1 + x2) / 2;
                double centerY = (y1 + y2) / 2;
                double halfWidth = (x2 - x1) * expandFactor / 2;
                double halfHeight = (y2 - y1) * expandFactor / 2;

                x1 = centerX - halfWidth;
                y1 = centerY - halfHeight;
                x2 = centerX + halfWidth;
                y2 = centerY + halfHeight;
            }

            return (x1, y1, x2, y2);
        }

        /// <summary>
        /// Check if two bounding boxes intersect in the X-Y plane
        /// </summary>
        /// <param name="box1"></param>
        /// <param name="box2"></param>
        /// <returns>True if the boxes overlap, otherwise false</returns>
        public bool DoBoxesIntersect((double X1, double Y1, double X2, double Y2) box1,
                                            (double X1, double Y1, double X2, double Y2) box2)
        {
            return box1.X2 >= box2.X1 && box1.X1 <= box2.X2 &&
                   box1.Y2 >= box2.Y1 && box1.Y1 <= box2.Y2;
        }

        // Method to identify all overlapping text pairs
        public List<(DxfText Text1, DxfText Text2)> FindAllOverlappingPairs(List<DxfText> textEntities)
        {
            var overlappingPairs = new List<(DxfText, DxfText)>();

            if (textEntities == null || textEntities.Count < 2)
                return overlappingPairs;

            var textWithBoundingBoxes = textEntities.Select(text =>
                (Text: text, BoundingBox: CalculateTextBoundingBox(text))).ToList();

            for (int i = 0; i < textWithBoundingBoxes.Count; i++)
            {
                for (int j = i + 1; j < textWithBoundingBoxes.Count; j++)
                {
                    if (DoBoxesIntersect(textWithBoundingBoxes[i].BoundingBox,
                                         textWithBoundingBoxes[j].BoundingBox))
                    {
                        overlappingPairs.Add((textWithBoundingBoxes[i].Text, textWithBoundingBoxes[j].Text));
                    }
                }
            }

            return overlappingPairs;
        }
    }
}