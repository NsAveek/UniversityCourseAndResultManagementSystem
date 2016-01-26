using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace UniversityManagementApp.Gateway
{
    public static class Connection
    {
        public static string connectionString =
            WebConfigurationManager.ConnectionStrings["UniversityManagementDBConnectionString"].ConnectionString;

        public static SqlConnection MakeConnection(string connectionString)
        {
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            return sqlConnection;
        }
       


    }
}