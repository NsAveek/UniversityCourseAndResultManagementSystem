using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Gateway
{
    public class CourseGateway
    {
        private SqlConnection sqlConnection;

        public List<ViewCourseStatics> GetViewCourseStaticsByDeparmtentId(int departmentId)
        {
            List<ViewCourseStatics> newViewCourseStatics = new List<ViewCourseStatics>();

            sqlConnection = Connection.MakeConnection(Connection.connectionString);
            string query = "SELECT * FROM ViewCourseStats WHERE DepartmentId="+departmentId;
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            while (sqlDataReader.Read())
            {
                ViewCourseStatics aStatics = new ViewCourseStatics();
                aStatics.DepartmentId = Convert.ToInt32(sqlDataReader["DepartmentId"]);
                aStatics.CourseId = Convert.ToInt32(sqlDataReader["CourseId"]);
                aStatics.CourseCode = sqlDataReader["CourseCode"].ToString();
                aStatics.CourseName = sqlDataReader["CourseName"].ToString();
                aStatics.SemesterId = Convert.ToInt32(sqlDataReader["SemesterId"]);
                aStatics.SemesterName = sqlDataReader["SemesterName"].ToString();
                aStatics.IsCurrent = (bool)sqlDataReader["IsCurrent"];
                //aStatics.TeacherId = Convert.ToInt32(sqlDataReader["TeacherId"]);
                aStatics.TeacherName = sqlDataReader["TeacherName"].ToString();

                newViewCourseStatics.Add(aStatics);
            }

            return newViewCourseStatics;

        }


        public List<Course> GetAllCoursesByDepartmentId(int departmentId)
        {
            List<Course> courses = new List<Course>();
            sqlConnection = Connection.MakeConnection(Connection.connectionString);
            string query = "SELECT * FROM Courses WHERE DepartmentId=" + departmentId;
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            while (sqlDataReader.Read())
            {
                Course newCourse = new Course();

                newCourse.CourseId = Convert.ToInt32(sqlDataReader["CourseId"]);

                newCourse.CourseCode = sqlDataReader["CourseCode"].ToString();


                courses.Add(newCourse);
            }
            sqlConnection.Close();
            sqlDataReader.Close();


            return courses;
        }

        public Course GetCourseByCourseId(int courseId)
        {
            Course newCourse = new Course();

            
            sqlConnection = Connection.MakeConnection(Connection.connectionString);
            string query = "SELECT * FROM Courses WHERE CourseId=" + courseId;
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();

           if (sqlDataReader.Read())
            {
                

                newCourse.CourseId = Convert.ToInt32(sqlDataReader["CourseId"]);

                newCourse.CourseName = sqlDataReader["CourseName"].ToString();

                newCourse.CourseCredit = Convert.ToDouble(sqlDataReader["CourseCredit"]);


            }
            sqlConnection.Close();
            sqlDataReader.Close();


            return newCourse;
        }

        public double GetCourseCreditByCourseId(int courseId)
        {

            double courseCredit = 0;

            sqlConnection = Connection.MakeConnection(Connection.connectionString);
            string query = "SELECT * FROM Courses WHERE CourseId=" + courseId;
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();

            if (sqlDataReader.Read())
            {

                courseCredit = Convert.ToDouble(sqlDataReader["CourseCredit"]);


            }
            sqlConnection.Close();
            sqlDataReader.Close();


            return courseCredit;
        }
    }
}