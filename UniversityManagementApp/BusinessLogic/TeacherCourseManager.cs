using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.BusinessLogic
{
    public class TeacherCourseManager
    {
        TeacherCourseGateway teacherCourseGateway = new TeacherCourseGateway();
        public static List<TeacherCourse> GetAllTeacherCourse(int departmentId)
        {
            return teacherCourseGateway.GetAllTeacherCourse(departmentId);
        }
    }
}