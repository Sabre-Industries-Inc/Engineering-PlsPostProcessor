using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace PLS_Post_Processor.Helpers
{
    public enum MyEnvironment
    {
        dev,
        test,
        prod
    }

    internal class EnvironmentHelper
    {
        public static MyEnvironment GetEnvironment()
        {
#if DEBUG
            return MyEnvironment.dev;
#else
            string assemblyDirectory = GetExePath();
            if (assemblyDirectory.IndexOf("dev", StringComparison.OrdinalIgnoreCase) > 0)
            {
                return MyEnvironment.dev;
            }
            else if (assemblyDirectory.IndexOf("test", StringComparison.OrdinalIgnoreCase) > 0)
            {
                return MyEnvironment.test;
            }
            else
            {
                return MyEnvironment.prod;
            }
#endif
        }

        private static string GetExePath()
        {
            string assemblyPath = Assembly.GetExecutingAssembly().Location;
            string assemblyDirectory = Path.GetDirectoryName(assemblyPath);

            return assemblyDirectory;
        }

        public static SqlConnection GetQuoteSqlConnection()
        {
            SqlConnection conn = new SqlConnection(GetQuoteConnectionString());
            return conn;
        }


        internal static string GetQuoteConnectionString()
        {
            var environ = GetEnvironment();

            switch (environ)
            {
                case MyEnvironment.dev:
                    return @"Data Source=txke-sql-dev;Initial Catalog=Quote;Trusted_Connection=True;";

                case MyEnvironment.test:
                    return @"Data Source=txke-sql-test;Initial Catalog=Quote;Trusted_Connection=True;";

                case MyEnvironment.prod:
                    return @"Data Source=txke-sql-sueet;Initial Catalog=Quote;Trusted_Connection=True;";

                default:
                    return string.Empty;
            }
        }
    }
}
