using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Gateway
{
    public class TeacherCourseGateway
    {
        SqlConnection sqlConnection = Connection.MakeConnection(Connection.connectionString);


        public bool CheckAlreadyAssigned(int courseId,int teacherId)
        {
            string query = "SELECT * FROM CourseAssign";
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            
            if (sqlDataReader.Read())
            {
                return (bool)sqlDataReader["IsCurrent"];
            }
            sqlConnection.Close();
            sqlDataReader.Close();
            

            return false;
        }
    }
}