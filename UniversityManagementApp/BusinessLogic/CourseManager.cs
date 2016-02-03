using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.BusinessLogic
{
    public class CourseManager
    {
        CourseGateway courseGateway = new CourseGateway();

        public List<Course> GetAllCoursesByDepartmentId(int departmentId)
        {
            return courseGateway.GetAllCoursesByDepartmentId(departmentId);
        }

        public Course GetCourseByCourseId(int courseId)
        {
            return courseGateway.GetCourseByCourseId(courseId);
        }


        public List<ViewCourseStatics> GetCourseInformationByDepartmentId(int departmentId)
        {
            return courseGateway.GetViewCourseStaticsByDeparmtentId(departmentId);
        }
    }
}