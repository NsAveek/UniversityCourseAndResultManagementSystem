using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Gateway
{
    public class TeacherGateway
    {
        private string connectionString =
            WebConfigurationManager.ConnectionStrings["UniversityManagementDBConnectionString"].ConnectionString;
        SqlConnection sqlConnection = new SqlConnection();

        public int Save(Teacher teacher)
        {
            sqlConnection.ConnectionString = connectionString;
            string query = "INSERT INTO Teachers " +
                           "(TeacherName,TeacherAddress,TeacherEmail,TeacherContactNo,CreditTaken,DesignationId,DepartmentId) " +
                           "VALUES ('" + teacher.TeacherName + "','" + teacher.TeacherAddress + "','" + teacher.TeacherEmail + "','" + teacher.TeacherContactNo + "','" + teacher.TeacherCreditTaken + 
                           "','"+teacher.TeacherDesignation + "','"+teacher.TeacherDepartment+"')";
            SqlCommand sqlCommand=new SqlCommand(query,sqlConnection);
            sqlConnection.Open();
            int result= sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
            return result;
        }

        public bool SearchByEmail(string teacherEmail)
        {
            sqlConnection.ConnectionString = connectionString;
            string query = "SELECT * FROM Teachers WHERE TeacherEmail='"+teacherEmail+"'";
            SqlCommand sqlCommand = new SqlCommand(query,sqlConnection);
            sqlConnection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            if (sqlDataReader.HasRows)
            {
                
                sqlConnection.Close();
                return true;
            }
            sqlConnection.Close();
            return false;
        }
    }
}