using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagementApp.Models
{
    public class ViewCourseStatics
    {
        public int DepartmentId { get; set; }
        public int CourseId { get; set; }

        public string CourseName { get; set; }

        public string CourseCode { get; set; }

        public bool? IsCurrent { get; set; }
        
        //public int? TeacherId { get; set; }
        public string TeacherName { get; set; }
        
        public int SemesterId { get; set; }
        public string SemesterName { get; set; }

    }
}