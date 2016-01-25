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
    }
}