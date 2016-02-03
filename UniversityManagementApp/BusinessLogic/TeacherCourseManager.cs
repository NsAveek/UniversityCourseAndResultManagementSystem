using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Ajax.Utilities;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.BusinessLogic
{
    public class TeacherCourseManager
    {
        TeacherCourseGateway teacherCourseGateway = new TeacherCourseGateway();

        public string AssignCourse(CourseAssignView courseAssignView)
        {
            bool alreadyAssigned = teacherCourseGateway.CheckAlreadyAssigned(courseAssignView.CourseId,courseAssignView.TeacherId);
            if (alreadyAssigned)
            {
                return "Already Assigned";
            }
            else
            {
                return "not assigned";
            }
        }
    }
}