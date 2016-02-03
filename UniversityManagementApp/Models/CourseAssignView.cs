using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagementApp.Models
{
    public class CourseAssignView
    {
        public string DepartmentName { get; set; }
        //public string TeacherName { get; set; }
        
        public float CreditToBeTaken { get; set; }
        public string RemainingCredit { get; set; }
        //public string CourseCode { get; set; }
        public string CourseName { get; set; }
        public double CourseCredit { get; set; }

        public int TeacherId { get; set; }
        public int CourseId { get; set; }
    }
}