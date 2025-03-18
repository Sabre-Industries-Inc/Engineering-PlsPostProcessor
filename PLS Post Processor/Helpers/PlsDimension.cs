using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WW.Cad.Model.Entities;
using WW.Math;

namespace PLS_Post_Processor.Helpers
{
    public enum DimensionDirection
    {
        None,
        Horizontal,
        Vertical
    }

    // Nested class to represent a PLS Dimension
    public class PlsDimension
    {
        public DxfLine DimensionLine { get; set; }
        public DxfText DimensionText { get; set; }
        public List<Dxf3DFace> ArrowHeads { get; set; }

        public DimensionDirection DimensionDirection 
        { 
            get {
                if (DimensionLine != null)
                {
                    var start = DimensionLine.Start;
                    var end = DimensionLine.End;
                    if (Math.Abs(start.X - end.X) > Math.Abs(start.Y - end.Y))
                    {
                        return DimensionDirection.Horizontal;
                    }
                    else
                    {
                        return DimensionDirection.Vertical;
                    }
                }
                return DimensionDirection.None;
            } 
        }

        public double ArrowHeadHt
        {
            get
            {
                double ht = 0;
                if (ArrowHeads.Count > 0)
                {
                    var pts = ArrowHeads[0].Points;
                    if (DimensionDirection == DimensionDirection.Vertical)
                    {
                        ht = Math.Abs(pts[0].Y - pts[1].Y);
                    }
                    else
                    {
                        ht = Math.Abs(pts[0].X - pts[1].X);
                    }
                }

                return ht;
            }
        }

        /// <summary>
        /// Is a valid PLS Dimension line: DxfLine, DxfText, & Dxf3DFace?
        ///
        /// Dimensions with only 1 arrow head are invalid
        /// Dimension where the dimension text is not within the tolerance of 1.0 is invalid
        /// </summary>
        public bool IsValid
        {
            get
            {
                return DimensionLine != null &&
                       DimensionText != null &&
                       ArrowHeads?.Count > 1 &&
                       ArrowHeadHt > 0 &&
                       IsLengthCloseToTextValue();
            }
        }

        /// <summary>
        /// Checks if the dimension line length is close to the text value
        /// </summary>
        /// <param name="tolerance">Allowed difference between line length and text value (default: 1.0)</param>
        /// <returns>True if the dimension line length is within tolerance of the text value</returns>
        private bool IsLengthCloseToTextValue(double tolerance = 1.0)
        {
            // *** Extract the numeric value of the embedment if it exists.
            var txt = DimensionText.Text.ExtractEmbedmentValue();

            // Calculate the length of the dimension line
            double lineLength = CalculateDistance(DimensionLine.Start, DimensionLine.End);

            // Try to parse the text value
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
}