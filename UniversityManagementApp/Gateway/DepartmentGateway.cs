using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Gateway
{
    public class DepartmentGateway
    {
        SqlConnection sqlConnection = Connection.MakeConnection(Connection.connectionString);

        public List<Department> GetAllDepartments()
        {
            string query = "SELECT * FROM Departments";
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand(query,sqlConnection);
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            List<Department> allDepartments = new List<Department>();
            while (sqlDataReader.Read())
            {
                Department newDepartment = new Department();

                newDepartment.DepartmentName = sqlDataReader["DepartmentName"].ToString();
                newDepartment.DepartmentCode = sqlDataReader["DepartmentCode"].ToString();
                newDepartment.DepartmentId = sqlDataReader["DepartmentId"].ToString();
               
                allDepartments.Add(newDepartment);
            }
            sqlConnection.Close();
            sqlDataReader.Close();
            return allDepartments;
        }
    }
}