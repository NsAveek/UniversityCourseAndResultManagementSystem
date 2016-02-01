using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementApp.BusinessLogic;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Controllers
{
    public class CourseController : Controller
    {
        public ActionResult CourseAssign()
        {
            DepartmentManager departmentManager = new DepartmentManager();
            List<Department> allDepartments = departmentManager.GetAllDepartments();
            return View(allDepartments);
        }

        [HttpPost]
        public ActionResult CourseAssign(CourseAssignView courseAssignView)
        {
            return View();
        }
        [HttpPost]
        public ActionResult GetTeacherCourse(string departmentId)
        {
            int newDepartmentId = Convert.ToInt32(departmentId);
            List<TeacherCourse> allTeacherCourse =TeacherCourseManager.GetAllTeacherCourse(newDepartmentId);

            return Content(allTeacherCourse);
        }
    }
}