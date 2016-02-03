using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagementApp.Models
{
    public class TeacherCourse
    {
        public List<Teacher> Teacher { get; set; }

        public List<Course> Course { get; set; }
    }
}