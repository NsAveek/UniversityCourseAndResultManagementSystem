using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.BusinessLogic
{
    public class TeacherManager
    {
        TeacherGateway teacherGateway = new TeacherGateway();
        DepartmentGateway departmentGateway =new DepartmentGateway();
        public string Save(Teacher teacher)
        {
            bool alreadyExists= teacherGateway.SearchByEmail(teacher.TeacherEmail);
            if (alreadyExists)
            {
                return "Email already exists in the database";
            }
            else
            {
                int dataSaved = teacherGateway.Save(teacher);
                if (dataSaved>0)
                {
                    return "Data inserted into the database";
                }
                else
                {
                    return "Could not insert data into the database";
                }
            }
        }

        public List<Department> GetAllDepartments()
        {
                List<Department> allDepartments = new List<Department>();
                allDepartments=departmentGateway.GetAllDepartments();
                return allDepartments;
        }

        public List<Designation> GetAllDesignations()
        {
            return teacherGateway.GetAllDesignations();
        }

        public List<Teacher> GetAllTeachersByDepartmentId(int departmentId)
        {
            return teacherGateway.GetAllTeachersByDepartmentId(departmentId);
        }

        public double GetTeacherCreditById(int teacherId)
        {
            return teacherGateway.GetTeacherCreditById(teacherId);
        }

        public double GetTeacherRemainingCreditById(int teacherId)
        {
            double teacherCredit = GetTeacherCreditById(teacherId);
            double assignedCredit = teacherGateway.GetTeacherAssignedCredit(teacherId);

            return teacherCredit - assignedCredit;
        }
    }
}