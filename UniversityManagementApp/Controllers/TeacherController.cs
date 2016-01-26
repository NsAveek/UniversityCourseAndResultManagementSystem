using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementApp.BusinessLogic;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.Controllers
{
    public class TeacherController : Controller
    {
        //
        // GET: /Teacher/
        //public ActionResult Index()
        //{
        //    return View();
        //}
        TeacherManager teacherManager = new TeacherManager();

        [HttpPost]
        public ActionResult SaveTeacher(Teacher teacher)
        {
            ViewBag.Message = teacherManager.Save(teacher);
            ViewBag.Departments = teacherManager.GetAllDepartments();
            ViewBag.Designations = teacherManager.GetAllDesignations();
            return View(teacher);
        }

        [HttpGet]
        public ActionResult SaveTeacher()
        {
            ViewBag.Departments = teacherManager.GetAllDepartments();
            ViewBag.Designations = teacherManager.GetAllDesignations();
            return View();
        }
    }
}