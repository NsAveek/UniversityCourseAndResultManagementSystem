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
            ViewBag.message = teacherManager.Save(teacher);
            return View(teacher);
        }

        [HttpGet]
        public ActionResult SaveTeacher()
        {
            return View();
        }
    }
}