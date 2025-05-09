using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
    public class Connection
    {
        public static SqlConnection Connect()
        {
            var connectionStringBuilder = new SqlConnectionStringBuilder
            {
                DataSource = "localhost\\ZUZZ_INSTANCE",
                InitialCatalog = "BD401",
                UserID = "notzuzz",
                Password = "zuzz1212@_"
            };

            string sqlConnectionString = connectionStringBuilder.ConnectionString;
            SqlConnection connection = new SqlConnection(sqlConnectionString);

            return connection;
        }
    }
}
