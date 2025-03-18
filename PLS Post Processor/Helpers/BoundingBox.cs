using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PLS_Post_Processor.Helpers
{
    public class BoundingBox
    {
        /// <summary>
        /// Define a text bounding box which is then used to identify
        /// overlapping text entities.
        /// </summary>
        /// <param name="text">The text being investigated</param>
        /// <param name="x1">X coordinate of lower left-hand corner of bounding box</param>
        /// <param name="y1">Y coordinate of lower left-hand corner of bounding box</param>
        /// <param name="x2">X coordinate of upper right-hand corner of bounding box</param>
        /// <param name="y2">Y coordinate of upper right-hand corner of bounding box</param>
        /// <param name="boxWidth">The DxfText Box WIdth</param>
        /// <param name="boxHeight">The DxfText Box Height</param>
        public BoundingBox(string text, double x1, double y1, double x2, double y2,
            double boxWidth, double boxHeight)
        {
            Text = text;
            IsVisible = true;

            X1 = x1;
            Y1 = y1;
            X2 = x2;
            Y2 = y2;

            BoxCorners = (x1, y1, x2, y2);
            BoxWidth = boxWidth;
            BoxHeight = boxHeight;

            OverlappingBoxes = new Dictionary<string, int>();
        }

        public string Text { get; set; }

        public bool IsVisible { get; set; }

        public double X1 { get; set; }
        public double Y1 { get; set; }

        public double X2 { get; set; }
        public double Y2 { get; set; }

        public (double X1, double Y1, double X2, double Y2) BoxCorners { get; set; }

        public double BoxWidth { get; set; }
        public double BoxHeight { get; set; }

        public Dictionary<string, int> OverlappingBoxes { get; set; }

        public override string ToString()
        {
            return $"Text: {Text}, ({X1:f2}, {Y1:f2}) ({X2:f2}, {Y2:f2}), {BoxWidth:f2} X {BoxHeight:f2} > Overlap: {OverlappingBoxes.Count}";
        }
    }
}