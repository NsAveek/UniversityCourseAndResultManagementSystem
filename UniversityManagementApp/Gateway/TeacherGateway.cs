﻿using System;
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
        private SqlConnection sqlConnection;
        

        public int Save(Teacher teacher)
        {
            sqlConnection= Connection.MakeConnection(Connection.connectionString);
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
            sqlConnection = Connection.MakeConnection(Connection.connectionString);
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

        public List<Designation> GetAllDesignations()
        {
            List<Designation> allDesignations = new List<Designation>();
            sqlConnection = Connection.MakeConnection(Connection.connectionString);
            sqlConnection.Open();
            string query = "SELECT * FROM Designations";
            SqlCommand sqlCommand = new SqlCommand(query,sqlConnection);
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            while (sqlDataReader.Read())
            {
                Designation newDesignation = new Designation();
                newDesignation.DesignationId = sqlDataReader["DesignationId"].ToString();
                newDesignation.DesignationName = sqlDataReader["DesignationName"].ToString();
                allDesignations.Add(newDesignation);
            }
            sqlConnection.Close();
            sqlDataReader.Close();
            return allDesignations;
        }
    }
}