USE [master]
GO
/****** Object:  Database [UniversityManagementDB]    Script Date: 2/10/2016 9:39:45 PM ******/
CREATE DATABASE [UniversityManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityManagementDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityManagementDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityManagementDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityManagementDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityManagementDB]
GO
/****** Object:  Table [dbo].[CourseAssign]    Script Date: 2/10/2016 9:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssign](
	[AssignId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[IsCurrent] [bit] NOT NULL,
 CONSTRAINT [PK_CourseAssign] PRIMARY KEY CLUSTERED 
(
	[AssignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2/10/2016 9:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [nvarchar](50) NOT NULL,
	[CourseName] [nvarchar](200) NOT NULL,
	[CourseCredit] [decimal](2, 1) NOT NULL,
	[CourseDescription] [nvarchar](max) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Days]    Script Date: 2/10/2016 9:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Days](
	[DayId] [int] IDENTITY(1,1) NOT NULL,
	[DayName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Days] PRIMARY KEY CLUSTERED 
(
	[DayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 2/10/2016 9:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentCode] [nvarchar](50) NOT NULL,
	[DepartmentName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Designations]    Script Date: 2/10/2016 9:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designations](
	[DesignationId] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Designations] PRIMARY KEY CLUSTERED 
(
	[DesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 2/10/2016 9:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollments](
	[EnrollmentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[EnrollmentDate] [date] NOT NULL,
	[IsCurrent] [bit] NOT NULL,
 CONSTRAINT [PK_Enrollments] PRIMARY KEY CLUSTERED 
(
	[EnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grades]    Script Date: 2/10/2016 9:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[GradeId] [int] IDENTITY(1,1) NOT NULL,
	[GradeLetter] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Grades] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomAllocation]    Script Date: 2/10/2016 9:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomAllocation](
	[AllocationId] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[IsCurrent] [bit] NOT NULL,
 CONSTRAINT [PK_RoomAllocation] PRIMARY KEY CLUSTERED 
(
	[AllocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 2/10/2016 9:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Semesters]    Script Date: 2/10/2016 9:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semesters](
	[SemesterId] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Semesters] PRIMARY KEY CLUSTERED 
(
	[SemesterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentResults]    Script Date: 2/10/2016 9:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResults](
	[ResultId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[GradeId] [int] NOT NULL,
	[IsCurrent] [bit] NOT NULL,
 CONSTRAINT [PK_StudentResults] PRIMARY KEY CLUSTERED 
(
	[ResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 2/10/2016 9:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[RegNo] [nvarchar](50) NOT NULL,
	[StudentName] [nvarchar](200) NOT NULL,
	[StudentEmail] [nvarchar](75) NOT NULL,
	[StudentContactNo] [nvarchar](50) NOT NULL,
	[StudentAddress] [nvarchar](500) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[RegDate] [date] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 2/10/2016 9:39:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [nvarchar](200) NOT NULL,
	[TeacherAddress] [nvarchar](500) NOT NULL,
	[TeacherEmail] [nvarchar](70) NOT NULL,
	[TeacherContactNo] [nvarchar](50) NOT NULL,
	[CreditTaken] [float] NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Teachers2] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CourseAssign] ON 

INSERT [dbo].[CourseAssign] ([AssignId], [TeacherId], [CourseId], [IsCurrent]) VALUES (1, 1, 1, 0)
INSERT [dbo].[CourseAssign] ([AssignId], [TeacherId], [CourseId], [IsCurrent]) VALUES (2, 2, 3, 0)
INSERT [dbo].[CourseAssign] ([AssignId], [TeacherId], [CourseId], [IsCurrent]) VALUES (3, 2, 2, 0)
INSERT [dbo].[CourseAssign] ([AssignId], [TeacherId], [CourseId], [IsCurrent]) VALUES (4, 1, 1, 0)
INSERT [dbo].[CourseAssign] ([AssignId], [TeacherId], [CourseId], [IsCurrent]) VALUES (5, 1, 1, 0)
INSERT [dbo].[CourseAssign] ([AssignId], [TeacherId], [CourseId], [IsCurrent]) VALUES (6, 3, 5, 0)
SET IDENTITY_INSERT [dbo].[CourseAssign] OFF
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (1, N'BAN 101', N'Ancient Bangla Literature', CAST(3.0 AS Decimal(2, 1)), N'The first works in Bengali, written in Old Bengali,[1] appeared between 10th and 12th centuries C.E. The collection of these words is generally known as the Charyapada. There are as many as 50 to 51 songs. But we got only 46 and a tore one of them(23). These are mystic songs composed by various Buddhist seer-poets: Luipada, Kanhapada, Kukkuripada, Chatilpada, Bhusukupada, Kamlipada, Dhendhanpada, Shantipada, Shabarapada, Arcjhanpada, Bhadehpada, Dharmapada, Dhombipada, Mohidharpada, Khonkonpada, Binapada,Birupada, Thantrikpada etc. Among them Kanhapada composed highest number of songs,13. And the second position goes to Bhusukupada,8.We haven''t got any songs composed by Thantrikpada. The first song is composed by Luipada. The famous Bengali linguist Haraprasad Shastri discovered the palm leaf Charyapada manuscript in the Nepal Royal Court Library in 1907.

There is no Dark Age in Bengali literature."Sekh Subhadaya" collection of poems on some Muslim Fakir''s biography which was founded by Bangladesh.They think that those poems were written in 12th century.', 7, 1)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (2, N'BAN 102', N'Middle Age Literature', CAST(3.5 AS Decimal(2, 1)), N'A torn manuscript of the Sreekrishna Kirtana Kabya was discovered by Basanta Ranjan Roy Biddyadwallav in 1909 from the house of Debendranath Chatterjee at a village named Kakinla in the district of Bankura, West Bengal. Shreekrishna Kirtana Kabya was composed by Boru Chandidas. It was first published under the composition made by Basontoh Ranjan Roy in 1916. While Charyapada shows us the most ancient example of Bengali language, Shreekrishna Kirtana depicts a new kind of speech style very clearly. Shreekrishna Kirtana have as many as 13 parts. It depicted the romantic relationship of Radha and Krishna. According to Suniti Kumar Chatterji, "The Grammar of the speech of the Shreekrishna Kirtana gives a clue to many of the forms of New Bengali".', 7, 1)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (3, N'BAN 203', N'West Bengal literature', CAST(5.0 AS Decimal(2, 1)), N'Rajshekhar Basu (1880–1960) was the best-known writer of satiric short story in Bengali literature.[9] He mocked the charlatanism and vileness of various classes of the Bengali society in his stories written under the pseudonym "Parashuram".[9] His major works include: Gaddalika (1924), Kajjwali (1927), Hanumaner Swapna (1937), Gamanush Jatir Katha (1945), Dhusturimaya Ityadi Galpa (1952), Krishnakali Ittadi Galpa (1953), Niltara Ittadi Galpa (1956), Anandibai Ittadi Galpa (1958) and Chamatkumari Ittadi Galpa (1959). He received the Rabindra Puraskar, the highest literary award of Paschimbanga in 1955 for Krishnakali Ityadi Galpa.[10] Rajsheskhar was also a noted lexicographer, translator and essayist. His Chalantika (1937) is one of the most popular concise Bengali dictionaries, while his Bengali-language translations of Meghaduta (1943), the Ramayana (1946), the Mahabharata (1949) and the Bhagavat Gita (1961) are also acclaimed.[9] His major essays are included in Laghuguru (1939) and Bichinta (1955).[9]', 7, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (4, N'BBA 102', N'Financial Accounting', CAST(4.5 AS Decimal(2, 1)), N'BBA program will be a four year program, where teaching and examination of allocated courses for specific semester would be finished within six months. Students will be automatically transferred to the next semester after examination pending the results.', 3, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (5, N'BBA 204', N'Business Mathematics', CAST(0.5 AS Decimal(2, 1)), N'The structure of the BBA Program is presented in the table below: ... Each subject area is divided into two parts i.e. compulsory and elective. The compulsory', 3, 4)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (6, N'BBA 304', N'Business Communication', CAST(2.5 AS Decimal(2, 1)), N'At present Bachelor of Business Administration (BBA) is one of the valuable and demandable subjects in Bangladesh, as well as in global', 3, 4)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (7, N'CHE 205', N'Fundamentals of Chemistry', CAST(5.0 AS Decimal(2, 1)), N'A course is a degree, such a Bachelor of Science, and a subject is a unit of study, usually taken over a semester, within a course. Chemistry subjects are sorted and described by the year of study during which they are taken.', 4, 3)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (8, N'CHE 302', N'Advanced Chemistry for BioSciences', CAST(4.0 AS Decimal(2, 1)), N'The Learning Management System (LMS) is centrally supported by the University of Melbourne. It provides students with an online presence for subjects, managed by subject coordinators, tutors and support staff.', 4, 4)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (9, N'CHE 402', N'Advanced Practical Chemistry', CAST(5.0 AS Decimal(2, 1)), N'For all information and resources, such as lectures notes, subject notices and links to other websites, students should login to the LMS, using their university username', 4, 5)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (10, N'EEE 102', N'Control Systems and Simulation', CAST(4.0 AS Decimal(2, 1)), N'To Educate and prepare women to contribute as engineers and citizens through integration, application and transfer of engineering knowledge. - See more at: http://www.srideviengg.com/departments/electrical-electronics-engineering-eee#sthash.iORzFESM.dpuf', 2, 1)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (11, N'EEE 202', N'Electrical Circuits  and Simulation', CAST(4.0 AS Decimal(2, 1)), N'Attracting the finest students by creating an overall intellectual atmosphere to train and empower our women professionals with global skills - See more at: http://www.srideviengg.com/departments/electrical-electronics-engineering-eee#sthash.iORzFESM.dpuf', 2, 6)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (12, N'EEE 302', N'Electrical Systems  and Simulation', CAST(3.5 AS Decimal(2, 1)), N'To provide graduates with a good foundation in mathematics, sciences and engineering fundamentals required to solve engineering problems that will facilitate them to find employment in industry and / or to pursue postgraduate studies with an appreciation for lifelong learning. - See more at: http://www.srideviengg.com/departments/electrical-electronics-engineering-eee#sthash.iORzFESM.dpuf', 2, 7)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (13, N'MAT 204', N'Calculus', CAST(4.5 AS Decimal(2, 1)), N'Math 1a/b is the standard first-year calculus sequence. If you are thinking about majoring in math and have not taken calculus before, take Math 1 as soon as possible! If you have had a year of calculus in high school, and if you have passed the Advanced Placement examination in BC Calculus with a score of 4 or better, then you may be advised to begin with Math 21 a/b, the second-year calculus sequence. ', 6, 3)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (14, N'MAT 404', N'Differential Equations', CAST(3.5 AS Decimal(2, 1)), N'The programs listed below should not be followed literally - they may not be balanced in workload between the fall and the spring semesters, nor are all the courses listed necessarily offered every year. They are examples designed to demonstrate the range of possibilities. You should determine your own program in consultation with your math faculty advisor or the Director of Undergraduate Studies. ', 6, 4)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (15, N'MAT 304', N'Linear Algebra', CAST(3.8 AS Decimal(2, 1)), N'Students may cross-register to take a course at M.I.T. This may be a useful option in years when a particular course is not offered at Harvard. Logic and Combinatorics offerings at M.I.T. have proven especially popular with Harvard students. Generally, classes at M.I.T. start a week before Harvard''s in the fall, and contemporaneously with Harvard''s in the spring. You may get concentration credit for M.I.T. courses, but consult the Director of Undergraduate Studies before registering. Cross-registration petitions can be obtained at the Registrar''s office or from your House''s Senior Tutor. ', 6, 3)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (16, N'PHY 102', N'Quantum Physics', CAST(3.5 AS Decimal(2, 1)), N'We’re partnered with the National Physical Laboratory (NPL) and are home to wonderful teaching and superb facilities at Surrey. If you join us, you’ll have chance to explore particle physics, quantum mechanics, relativity and astrophysics – and discover how physics shapes our understanding of the entire universe.', 5, 6)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (17, N'PHY 202', N'Physics of Energy', CAST(5.0 AS Decimal(2, 1)), N'Physics underpins so many of today’s scientific advances. Everything from space exploration to fibre-optic communication, and even the Human Genome Project, could not have happened without physics. Its influence touches a surprising range of areas – for example, providing new ways to improve the environment, develop new technologies and treat cancer.', 5, 4)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (18, N'PHY 302', N'Nuclear and Particle Physics', CAST(4.5 AS Decimal(2, 1)), N'Studying on our general Physics programme will give you a thorough understanding of all the core elements of traditional physics, including key topics like particle physics, atoms and molecules, quantum mechanics and astrophysics.', 5, 5)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (19, N'CSE 220', N'Data Structures', CAST(3.5 AS Decimal(2, 1)), N'Introduction to widely used and effective methods of data organisation, focussing on data structures, their algorithms and the performance of these algorithms. Concepts and examples, elementary data objects, elementary data structures, arrays, lists, stacks, queues, graphs, trees, compound structures, data abstraction and primitive operations on these structures. memory management; sorting and searching; hash techniques; Introduction to the fundamental algorithms and data structures: recursion, backtrack search, lists, stacks, queues, trees, operation on sets, priority queues, graph dictionary. Introduction to the analysis of algorithms to process the basic structures. A brief introduction to database systems and the analysis of data structure performance and use in these systems. The course includes a compulsory 3 hour laboratory work alternate week. - See more at: http://www.bracu.ac.bd/academics/departments/computer-science-and-engineering/bachelor-science-computer-science-and/cse-0#sthash.uyrMpne0.dpuf', 1, 4)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (20, N'CSE 221', N'Algorithms', CAST(4.5 AS Decimal(2, 1)), N'The study of efficient algorithms and effective algorithm design techniques. Techniques for analysis of algorithms, Methods for the design of efficient algorithms :Divide and Conquer paradigm, Greedy method, Dynamic programming, Backtracking, Basic search and traversal techniques, Graph algorithms, Elementary parallel algorithms, Algebraic simplification and transformations, Lower bound theory, NP-hard and NP-complete problems. Techniques for the design and analysis of efficient algorithms, Emphasising methods useful in practice. - See more at: http://www.bracu.ac.bd/academics/departments/computer-science-and-engineering/bachelor-science-computer-science-and/cse-0#sthash.uyrMpne0.dpuf', 1, 5)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId]) VALUES (21, N'CSE 310', N'Object Oriented Programming', CAST(3.5 AS Decimal(2, 1)), N'An introduction to object oriented programming using. Java is the language typically used to illustrate the concepts, but another suitable language may be substituted by the instructor. Topics covered include object instances, classes, inheritance, polymorphism and abstraction mechanism. Problem domain analysis and system design using object oriented approach. Object oriented database and object persistency. Software principles for object oriented approach. Advantages and problems with using object oriented approach to developing systems. - See more at: http://www.bracu.ac.bd/academics/departments/computer-science-and-engineering/bachelor-science-computer-science-and/cse-0#sthash.uyrMpne0.dpuf', 1, 4)
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Days] ON 

INSERT [dbo].[Days] ([DayId], [DayName]) VALUES (1, N'Saturday')
INSERT [dbo].[Days] ([DayId], [DayName]) VALUES (2, N'Sunday')
INSERT [dbo].[Days] ([DayId], [DayName]) VALUES (3, N'Monday')
INSERT [dbo].[Days] ([DayId], [DayName]) VALUES (4, N'Tuesday')
INSERT [dbo].[Days] ([DayId], [DayName]) VALUES (5, N'Wednesday')
INSERT [dbo].[Days] ([DayId], [DayName]) VALUES (6, N'Thursday')
INSERT [dbo].[Days] ([DayId], [DayName]) VALUES (7, N'Friday')
SET IDENTITY_INSERT [dbo].[Days] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (1, N'CSE', N'Computer Science & Engineering')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (2, N'EEE', N'Electrical & Electronic Engineering')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (3, N'BBA', N'Business Studies')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (4, N'CHE', N'Chemistry')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (5, N'PHY', N'Physics')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (6, N'MAT', N'Mathematics')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentCode], [DepartmentName]) VALUES (7, N'BAN', N'Bangla')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Designations] ON 

INSERT [dbo].[Designations] ([DesignationId], [DesignationName]) VALUES (1, N'Lecture')
INSERT [dbo].[Designations] ([DesignationId], [DesignationName]) VALUES (2, N'Assistant Professor')
INSERT [dbo].[Designations] ([DesignationId], [DesignationName]) VALUES (3, N'Associate Professor')
INSERT [dbo].[Designations] ([DesignationId], [DesignationName]) VALUES (4, N'Professor')
SET IDENTITY_INSERT [dbo].[Designations] OFF
SET IDENTITY_INSERT [dbo].[Enrollments] ON 

INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [CourseId], [EnrollmentDate], [IsCurrent]) VALUES (1, 1026, 1, CAST(0xFB3A0B00 AS Date), 0)
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [CourseId], [EnrollmentDate], [IsCurrent]) VALUES (2, 1026, 3, CAST(0xFB3A0B00 AS Date), 0)
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [CourseId], [EnrollmentDate], [IsCurrent]) VALUES (3, 1026, 1, CAST(0xFF3A0B00 AS Date), 0)
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [CourseId], [EnrollmentDate], [IsCurrent]) VALUES (4, 1026, 2, CAST(0xFF3A0B00 AS Date), 0)
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [CourseId], [EnrollmentDate], [IsCurrent]) VALUES (5, 1026, 3, CAST(0xFF3A0B00 AS Date), 0)
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [CourseId], [EnrollmentDate], [IsCurrent]) VALUES (6, 1026, 1, CAST(0xFF3A0B00 AS Date), 0)
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [CourseId], [EnrollmentDate], [IsCurrent]) VALUES (7, 1026, 3, CAST(0xFF3A0B00 AS Date), 0)
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [CourseId], [EnrollmentDate], [IsCurrent]) VALUES (8, 1026, 2, CAST(0xFF3A0B00 AS Date), 0)
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [CourseId], [EnrollmentDate], [IsCurrent]) VALUES (9, 1030, 19, CAST(0x003B0B00 AS Date), 0)
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [CourseId], [EnrollmentDate], [IsCurrent]) VALUES (10, 1030, 21, CAST(0x003B0B00 AS Date), 0)
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [CourseId], [EnrollmentDate], [IsCurrent]) VALUES (11, 1026, 1, CAST(0x013B0B00 AS Date), 1)
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [CourseId], [EnrollmentDate], [IsCurrent]) VALUES (12, 1026, 3, CAST(0x013B0B00 AS Date), 1)
INSERT [dbo].[Enrollments] ([EnrollmentId], [StudentId], [CourseId], [EnrollmentDate], [IsCurrent]) VALUES (13, 1026, 2, CAST(0x013B0B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[Enrollments] OFF
SET IDENTITY_INSERT [dbo].[Grades] ON 

INSERT [dbo].[Grades] ([GradeId], [GradeLetter]) VALUES (1, N'A+')
INSERT [dbo].[Grades] ([GradeId], [GradeLetter]) VALUES (2, N'A')
INSERT [dbo].[Grades] ([GradeId], [GradeLetter]) VALUES (3, N'A-')
INSERT [dbo].[Grades] ([GradeId], [GradeLetter]) VALUES (4, N'B+')
INSERT [dbo].[Grades] ([GradeId], [GradeLetter]) VALUES (5, N'B')
INSERT [dbo].[Grades] ([GradeId], [GradeLetter]) VALUES (6, N'B-')
INSERT [dbo].[Grades] ([GradeId], [GradeLetter]) VALUES (7, N'C+')
INSERT [dbo].[Grades] ([GradeId], [GradeLetter]) VALUES (8, N'C')
INSERT [dbo].[Grades] ([GradeId], [GradeLetter]) VALUES (9, N'C-')
INSERT [dbo].[Grades] ([GradeId], [GradeLetter]) VALUES (10, N'D+')
INSERT [dbo].[Grades] ([GradeId], [GradeLetter]) VALUES (11, N'D')
INSERT [dbo].[Grades] ([GradeId], [GradeLetter]) VALUES (12, N'D-')
INSERT [dbo].[Grades] ([GradeId], [GradeLetter]) VALUES (13, N'F')
SET IDENTITY_INSERT [dbo].[Grades] OFF
SET IDENTITY_INSERT [dbo].[RoomAllocation] ON 

INSERT [dbo].[RoomAllocation] ([AllocationId], [RoomId], [CourseId], [DayId], [StartTime], [EndTime], [IsCurrent]) VALUES (1, 1, 1, 1, CAST(0x0700E03495640000 AS Time), CAST(0x0700B0BD58750000 AS Time), 1)
INSERT [dbo].[RoomAllocation] ([AllocationId], [RoomId], [CourseId], [DayId], [StartTime], [EndTime], [IsCurrent]) VALUES (2, 2, 1, 1, CAST(0x0700A8E76F4B0000 AS Time), CAST(0x070048F9F66C0000 AS Time), 1)
INSERT [dbo].[RoomAllocation] ([AllocationId], [RoomId], [CourseId], [DayId], [StartTime], [EndTime], [IsCurrent]) VALUES (3, 6, 2, 3, CAST(0x070058A5C8C00000 AS Time), CAST(0x0700B6757BC10000 AS Time), 1)
SET IDENTITY_INSERT [dbo].[RoomAllocation] OFF
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (1, N'Block-A: 101')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (2, N'Block-A: 102')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (3, N'Block-A: 103')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (4, N'Block-A: 201')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (5, N'Block-A: 202')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (6, N'Block-A: 203')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (7, N'Block-B: 101')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (8, N'Block-B: 102')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (9, N'Block-B: 103')
SET IDENTITY_INSERT [dbo].[Rooms] OFF
SET IDENTITY_INSERT [dbo].[Semesters] ON 

INSERT [dbo].[Semesters] ([SemesterId], [SemesterName]) VALUES (1, N'1st')
INSERT [dbo].[Semesters] ([SemesterId], [SemesterName]) VALUES (2, N'2nd')
INSERT [dbo].[Semesters] ([SemesterId], [SemesterName]) VALUES (3, N'3rd')
INSERT [dbo].[Semesters] ([SemesterId], [SemesterName]) VALUES (4, N'4th')
INSERT [dbo].[Semesters] ([SemesterId], [SemesterName]) VALUES (5, N'5th')
INSERT [dbo].[Semesters] ([SemesterId], [SemesterName]) VALUES (6, N'6th')
INSERT [dbo].[Semesters] ([SemesterId], [SemesterName]) VALUES (7, N'7th')
INSERT [dbo].[Semesters] ([SemesterId], [SemesterName]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[Semesters] OFF
SET IDENTITY_INSERT [dbo].[StudentResults] ON 

INSERT [dbo].[StudentResults] ([ResultId], [StudentId], [CourseId], [GradeId], [IsCurrent]) VALUES (1, 1026, 1, 1, 0)
INSERT [dbo].[StudentResults] ([ResultId], [StudentId], [CourseId], [GradeId], [IsCurrent]) VALUES (2, 1026, 2, 4, 0)
INSERT [dbo].[StudentResults] ([ResultId], [StudentId], [CourseId], [GradeId], [IsCurrent]) VALUES (3, 1026, 3, 1, 0)
INSERT [dbo].[StudentResults] ([ResultId], [StudentId], [CourseId], [GradeId], [IsCurrent]) VALUES (4, 1026, 1, 2, 0)
INSERT [dbo].[StudentResults] ([ResultId], [StudentId], [CourseId], [GradeId], [IsCurrent]) VALUES (5, 1026, 3, 6, 0)
INSERT [dbo].[StudentResults] ([ResultId], [StudentId], [CourseId], [GradeId], [IsCurrent]) VALUES (6, 1030, 19, 1, 0)
INSERT [dbo].[StudentResults] ([ResultId], [StudentId], [CourseId], [GradeId], [IsCurrent]) VALUES (7, 1030, 21, 1, 0)
INSERT [dbo].[StudentResults] ([ResultId], [StudentId], [CourseId], [GradeId], [IsCurrent]) VALUES (8, 1026, 1, 1, 1)
INSERT [dbo].[StudentResults] ([ResultId], [StudentId], [CourseId], [GradeId], [IsCurrent]) VALUES (9, 1026, 2, 1, 1)
SET IDENTITY_INSERT [dbo].[StudentResults] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (2, N'CSE-2016-001', N'Shazad Ul Alam', N'shazad@yahoo.com', N'01717112233', N'Barguna', 1, CAST(0xF83A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (3, N'CSE-2016-002', N'Jobayer Mahmud', N'jobayer@gmail.com', N'01718223344', N'Barisal', 1, CAST(0xF93A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (4, N'CSE-2016-003', N'Md. Mahamudul Hasan', N'mahamudul@gmail.com', N'01716665544', N'Bhola', 1, CAST(0xF93A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (5, N'CSE-2016-004', N'Farzana Khanom', N'farzana@yahoo.com', N'01615225588', N'Jhalokati', 1, CAST(0xDB3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (6, N'CSE-2016-005', N'Mohammad Rizvee Rahman', N'rizvee@hotmail.com', N'01815998877', N'Patuakhali', 1, CAST(0xF93A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (7, N'EEE-2015-001', N'Shajhina Afrose', N'shajhina@live.com', N'01911457896', N'Pirojpur', 2, CAST(0xD43A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (8, N'EEE-2016-001', N'Shahjahan Biplob', N'biplob@ymail.com', N'01515321548', N'Bandarban', 2, CAST(0xF93A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (9, N'EEE-2016-002', N'Md. Asaduzzaman', N'asaduzzaman@yahoo.com', N'01815478963', N'Dhaka', 2, CAST(0x0B3B0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1003, N'EEE-2016-003', N'Md. Al-amin', N'alamin@gmail.com', N'01682589599', N'Chandpur', 2, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1004, N'EEE-2015-002', N'Shaila Ahmed', N'shaila@yahoo.com', N'01818471425', N'Chittagong', 2, CAST(0x1C3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1005, N'BBA-2016-001', N'Md.Al-Imran', N'alimran@hotmail.com', N'01615478523', N'Comilla', 3, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1006, N'BBA-2016-002', N'Sadia Jahan', N'sadia@gmail.com', N'01517458963', N'Cox''s Bazar', 3, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1007, N'BBA-2016-003', N'Jannatul Ferdus', N'ferdus@yahoo.com', N'01719582415', N'Feni', 3, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1008, N'BBA-2016-004', N'MD.REZAUL KARIM', N'rezaul@hotmail.com', N'01618478523', N'Khagrachhari', 3, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1009, N'BBA-2016-005', N'Arpan Kumar Mandal', N'arpan@live.com', N'01814256321', N'Lakshmipur', 3, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1010, N'CHE-2016-001', N'Jannatul Ferdous', N'jannatul@yahoo.com', N'01711223366', N'Noakhali', 4, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1011, N'CHE-2016-002', N'Md. Shaokat Ullaha', N'shaokat@yahoo.com', N'01915369874', N'Rangamati', 4, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1012, N'CHE-2016-003', N'Asaduzzaman', N'asaduzzaman@gmail.com', N'01815632541', N'Faridpur', 4, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1013, N'CHE-2016-004', N'Mohammad Asiful Islam Bhuiyan', N'asiful@yahoo.com', N'01719257412', N'Gazipur', 4, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1014, N'CHE-2016-005', N'Md. zahidul Islam', N'zahidul@gmail.com', N'01712547896', N'Gopalganj', 4, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1015, N'PHY-2016-001', N'Nasrat Sharif Aveek', N'aveek@gmail.com', N'01719265021', N'Kishoreganj', 5, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1016, N'PHY-2016-002', N'Monirul Islam', N'monirul@live.com', N'01716321478', N'Madaripur', 5, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1017, N'PHY-2016-003', N'Khadiza Islam Tohfa', N'tohfa@gmail.com', N'01817253698', N'Manikganj', 5, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1018, N'PHY-2016-004', N'Md. Mustafa Arafat', N'mustafa@yahoo.com', N'01514253698', N'Munshiganj', 5, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1019, N'PHY-2016-005', N'Md Anas Biswas', N'anas@yahoo.com', N'01817475869', N'Narayanganj', 5, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1020, N'MAT-2016-001', N'Md.Saif Uddin', N'saif@yahoo.com', N'01718592631', N'Narsingdi', 6, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1021, N'MAT-2016-002', N'AMIT GHOSH', N'amit@gmail.com', N'01617456321', N'Rajbari', 6, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1022, N'MAT-2016-003', N'Md. Jewel Rana', N'jewel@gmail.com', N'01711552233', N'Shariatpur', 6, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1023, N'MAT-2016-004', N'Sanabeal kabir', N'sanabeal@yahoo.com', N'01654321478', N'Tangail', 6, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1024, N'MAT-2016-005', N'Tazreen Bhuiyan', N'tazreen@hotmail.com', N'01714253698', N'Bagerhat', 6, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1025, N'BAN-2016-001', N'Nazia Islam', N'nazia@yahoo.com', N'01612457896', N'Chuadanga', 7, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1026, N'BAN-2016-002', N'AL AMIN IBNE MOSADDEQUE CHAYAN', N'chayan@solarbd.com', N'01717849659', N'Dinajpur', 7, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1027, N'BAN-2016-003', N'Jannatul Ferdous Shuvo', N'jannatul@gmail.com', N'01515478963', N'Jessore', 7, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1028, N'BAN-2016-004', N'Md.Mominul Shekh', N'mominul@ymail.com', N'01715369874', N'Jhenaidah', 7, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1029, N'BAN-2016-005', N'MD. IFTEKHAR UL ISLAM MONDOL', N'iftekhar@yahoo.com', N'01812365478', N'Khulna', 7, CAST(0xFA3A0B00 AS Date))
INSERT [dbo].[Students] ([StudentId], [RegNo], [StudentName], [StudentEmail], [StudentContactNo], [StudentAddress], [DepartmentId], [RegDate]) VALUES (1030, N'CSE-2016-006', N'Al Amin', N'alamin1@gmail.com', N'0174859655', N'Dhaka', 1, CAST(0x0C3B0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [CreditTaken], [DesignationId], [DepartmentId]) VALUES (1, N'G. S. Bhattacharya', N'Sylhet', N'bhattacharya@gmail.com', N'01715478963', 10, 2, 7)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [CreditTaken], [DesignationId], [DepartmentId]) VALUES (2, N'S. K. Banerjee, PhD', N'Sunamganj', N'banerjee@yahoo.com', N'01817451263', 11, 4, 7)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [CreditTaken], [DesignationId], [DepartmentId]) VALUES (3, N'Kazi Akram Hossain', N'Moulvibazar', N'akram@yahoo.com', N'01612457896', 8, 1, 3)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [CreditTaken], [DesignationId], [DepartmentId]) VALUES (4, N'Khan Saheb Abdur Rob Choudhury', N'Habiganj', N'saheb@yahoo.com', N'01718251436', 7, 3, 3)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [CreditTaken], [DesignationId], [DepartmentId]) VALUES (5, N'Nabani Prasad Chanda', N'Thakurgaon', N'nabani@yahoo.com', N'01614253678', 9, 1, 4)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [CreditTaken], [DesignationId], [DepartmentId]) VALUES (6, N'Abu Hena', N'Rangpur', N'hena@gmail.com', N'01814253687', 12, 4, 4)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [CreditTaken], [DesignationId], [DepartmentId]) VALUES (7, N'Md. Tahir Jamil', N'Panchagarh', N'tahir@gmail.com', N'01718253698', 11, 3, 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [CreditTaken], [DesignationId], [DepartmentId]) VALUES (8, N'Maulavi Sirajur Rahman', N'Nilphamari', N'sirajur@yahoo.com', N'01625362514', 12, 3, 1)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [CreditTaken], [DesignationId], [DepartmentId]) VALUES (9, N'Elias Ahmed', N'Lalmonirhat', N'elias@yahoo.com', N'0152142536', 10, 3, 2)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [CreditTaken], [DesignationId], [DepartmentId]) VALUES (10, N'Golam Yahia Chowdhury', N'Kurigram', N'yahia@gmail.com', N'01652361547', 15, 2, 2)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [CreditTaken], [DesignationId], [DepartmentId]) VALUES (11, N'Dr. Musammat Rokeya Begum', N'Gaibandha', N'rokeya@yahoo.com', N'01914253678', 10, 4, 6)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [CreditTaken], [DesignationId], [DepartmentId]) VALUES (12, N'Gulshan Ara', N'Sirajganj', N'gulshan@gmail.com', N'01919475869', 12, 3, 6)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [CreditTaken], [DesignationId], [DepartmentId]) VALUES (13, N'Zia Arefin Azad', N'Rajshahi', N'arefin@yahoo.com', N'01641253698', 12, 3, 5)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [CreditTaken], [DesignationId], [DepartmentId]) VALUES (14, N'S. M. Abdus Samad Azad', N'Pabna', N'samad@gmail.com', N'01818475869', 13, 4, 5)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
ALTER TABLE [dbo].[CourseAssign]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[CourseAssign] CHECK CONSTRAINT [FK_CourseAssign_Courses]
GO
ALTER TABLE [dbo].[CourseAssign]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_Teachers] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([TeacherId])
GO
ALTER TABLE [dbo].[CourseAssign] CHECK CONSTRAINT [FK_CourseAssign_Teachers]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Departments]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Semesters] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semesters] ([SemesterId])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Semesters]
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_Courses]
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_Students]
GO
ALTER TABLE [dbo].[RoomAllocation]  WITH CHECK ADD  CONSTRAINT [FK_RoomAllocation_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[RoomAllocation] CHECK CONSTRAINT [FK_RoomAllocation_Courses]
GO
ALTER TABLE [dbo].[RoomAllocation]  WITH CHECK ADD  CONSTRAINT [FK_RoomAllocation_Days] FOREIGN KEY([DayId])
REFERENCES [dbo].[Days] ([DayId])
GO
ALTER TABLE [dbo].[RoomAllocation] CHECK CONSTRAINT [FK_RoomAllocation_Days]
GO
ALTER TABLE [dbo].[RoomAllocation]  WITH CHECK ADD  CONSTRAINT [FK_RoomAllocation_Rooms] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([RoomId])
GO
ALTER TABLE [dbo].[RoomAllocation] CHECK CONSTRAINT [FK_RoomAllocation_Rooms]
GO
ALTER TABLE [dbo].[StudentResults]  WITH CHECK ADD  CONSTRAINT [FK_StudentResults_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[StudentResults] CHECK CONSTRAINT [FK_StudentResults_Courses]
GO
ALTER TABLE [dbo].[StudentResults]  WITH CHECK ADD  CONSTRAINT [FK_StudentResults_Grades] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grades] ([GradeId])
GO
ALTER TABLE [dbo].[StudentResults] CHECK CONSTRAINT [FK_StudentResults_Grades]
GO
ALTER TABLE [dbo].[StudentResults]  WITH CHECK ADD  CONSTRAINT [FK_StudentResults_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[StudentResults] CHECK CONSTRAINT [FK_StudentResults_Students]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Departments]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Departments]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Designations] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designations] ([DesignationId])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Designations]
GO
USE [master]
GO
ALTER DATABASE [UniversityManagementDB] SET  READ_WRITE 
GO
