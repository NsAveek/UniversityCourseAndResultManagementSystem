using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementApp.Gateway;
using UniversityManagementApp.Models;

namespace UniversityManagementApp.BusinessLogic
{
    public class DepartmentManager
    {
        DepartmentGateway departmentGateway = new DepartmentGateway();
        public List<Department> GetAllDepartments()
        {
            List<Department> allDepartments = new List<Department>();
            allDepartments = departmentGateway.GetAllDepartments();
            return allDepartments;
        }
    }
}