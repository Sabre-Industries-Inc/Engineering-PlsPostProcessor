using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PLS_Post_Processor.Helpers
{
    internal class DbReader
    {
        public static (decimal supportedVersion, bool isSupported) GetSupportedPlsVersion(decimal plsVersion)
        {
            string fieldName = "SupportedPLSVersion";
            decimal supportedVersion = 0;
            bool plsVersionIsSupported = false;
            try
            {
                using (SqlConnection conn = EnvironmentHelper.GetQuoteSqlConnection())
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.CommandText = buildSql();
                    cmd.Connection = conn;
                    conn.Open();

                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        supportedVersion = (decimal)reader[fieldName];
                    }
                    // *** Get result from second query.
                    reader.NextResult();
                    while (reader.Read())
                    {
                        int isSupported = (int)reader["isSupportedVersion"];
                        plsVersionIsSupported = (isSupported == 1);
                    }
                }

                return (supportedVersion, plsVersionIsSupported);
            }
            catch (Exception ex)
            {
                throw new Exception($"Error executing DbReader.GetQuoteList--{ex.Message}", ex);
            }

            string buildSql()
            {
                string sql = $@"
                    SELECT TOP 1 SupportedPLSVersion
                      FROM PLSProperties
                      WHERE CONVERT(DATE, GETDATE()) >= CONVERT(DATE, EffectiveStartDate)
	                    AND (CONVERT(DATE, GETDATE()) < CONVERT(DATE, EffectiveEndDate)
	                    OR ISNULL(EffectiveEndDate, 0) = 0)
	                    ORDER BY SupportedPLSVersion

                    SELECT
	                    CASE
		                    WHEN CONVERT(DATE, GETDATE()) >= CONVERT(DATE, EffectiveStartDate)
			                    AND (CONVERT(DATE, GETDATE()) < CONVERT(DATE, EffectiveEndDate) OR EffectiveEndDate IS NULL)
			                    THEN 1
                        ELSE 0
	                    END AS isSupportedVersion
	                    FROM PLSProperties
	                    WHERE SupportedPLSVersion = {plsVersion:f2};
                ";

                return sql;
            }
        }
    }
}