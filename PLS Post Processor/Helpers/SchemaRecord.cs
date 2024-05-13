using System;
using System.Collections.Generic;
using System.Linq;

namespace PLS_Post_Processor.Helpers
{
    internal class SchemaRecord
    {
        public SchemaRecord() { }

        public string BlockString { get; set; }

        public string SearchString { get; set; }

        public int ValidBaseIdx { get; set; }

        public int UserBaseIdx { get; set; }

        public int ValidIdx { get; set; }

        public int UserIdx { get; set; }

        public string ValidRecord { get; set; }

        public string UserRecord { get; set; }

        /// <summary>
        /// Does ValidRecord = UserRecord?
        /// </summary>
        public bool IsEqual {
            get {
                return UserRecord.Equals(ValidRecord, StringComparison.OrdinalIgnoreCase);
            }
        }

        public void AssignRecord(List<string> schema, bool user)
        {
            if (SearchString.Contains("\n"))
            {
                SearchString = SearchString.Replace("\n", "\\n");
            }
            var indexes = schema.Select((s, i) => new { Index = i, Value = s })
                .Where(item => item.Value.Contains(SearchString))
                .Select(item => item.Index)
                .ToList();

            if (user)
            {
                UserBaseIdx = schema.FindIndex(p => p.Contains(BlockString));
                UserIdx = indexes.Where(i => i > UserBaseIdx).FirstOrDefault();
                UserRecord = schema[UserIdx];
            } else
            {
                ValidBaseIdx = schema.FindIndex(p => p.Contains(BlockString));
                ValidIdx= indexes.Where(i => i > ValidBaseIdx).FirstOrDefault();
                ValidRecord = schema[ValidIdx];
            }
        }

        public override string ToString()
        {
            string msg = (IsEqual ? "EQUAL" : "NOT equal");
            return $"For '{SearchString}' valid and user records are {msg}";
        }
    }
}
