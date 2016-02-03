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
        private TeacherCourseManager teacherCourseManager;
        private DepartmentManager departmentManager;
        private TeacherManager teacherManager;
        private CourseManager courseManager;
        public ActionResult CourseAssign()
        {
            departmentManager = new DepartmentManager();
            List<Department> allDepartments = departmentManager.GetAllDepartments();
            return View(allDepartments);
        }

        [HttpPost]
        public ActionResult CourseAssign(CourseAssignView courseAssignView)
        {
            teacherCourseManager = new TeacherCourseManager();
            //ViewBag.Message= teacherCourseManager.AssignCourse(courseAssignView);
            ViewBag.CourseId = courseAssignView.CourseId;
            ViewBag.TeacherId = courseAssignView.TeacherId;




            departmentManager = new DepartmentManager();
            List<Department> allDepartments = departmentManager.GetAllDepartments();
            return View(allDepartments);
        }

        public ActionResult ViewCourseStatics()
        {
            departmentManager = new DepartmentManager();
            List<Department> allDepartments = departmentManager.GetAllDepartments();
            ViewBag.Departments = allDepartments;
            return View();
        }

        public JsonResult GetCourseInformationByDepartmentId(int departmentId)
        {
            CourseManager aCourseManager = new CourseManager();
            List<ViewCourseStatics> allViewCourseStaticses = new List<ViewCourseStatics>();

            allViewCourseStaticses = aCourseManager.GetCourseInformationByDepartmentId(departmentId);


            return Json(allViewCourseStaticses, JsonRequestBehavior.AllowGet);
        }




        public JsonResult GetTeacherCourseByDepartmentId(int departmentId)
        {
            teacherCourseManager = new TeacherCourseManager();
            teacherManager = new TeacherManager();
            courseManager = new CourseManager();

            List<Teacher> allTeachers = teacherManager.GetAllTeachersByDepartmentId(departmentId);
            List<Course> allCourses = courseManager.GetAllCoursesByDepartmentId(departmentId);
            TeacherCourse newTeacherCourse = new TeacherCourse();
            newTeacherCourse.Teacher = allTeachers;
            newTeacherCourse.Course = allCourses;

            return Json(newTeacherCourse, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetTeacherInfoById(int teacherId)
        {
            teacherManager = new TeacherManager();
            double teacherCredit = teacherManager.GetTeacherCreditById(teacherId);
            double remainingCredit = teacherManager.GetTeacherRemainingCreditById(teacherId);
            List<double> credits = new List<double>();
            credits.Add(teacherCredit);
            credits.Add(remainingCredit);
            return Json(credits, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetCourseByCourseId(int courseId)
        {
            courseManager = new CourseManager();
            Course aCourse = courseManager.GetCourseByCourseId(courseId);

            return Json(aCourse, JsonRequestBehavior.AllowGet);
        }
    }
}