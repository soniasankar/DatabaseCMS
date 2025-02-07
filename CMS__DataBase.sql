USE [master]
GO
/****** Object:  Database [CMS__DataBase]    Script Date: 10-09-2024 21:26:19 ******/
CREATE DATABASE [CMS__DataBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CMS__DataBase', FILENAME = N'D:\program_sqlserver\MSSQL16.MSSQLSERVER\MSSQL\DATA\CMS__DataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CMS__DataBase_log', FILENAME = N'D:\program_sqlserver\MSSQL16.MSSQLSERVER\MSSQL\DATA\CMS__DataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CMS__DataBase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CMS__DataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CMS__DataBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CMS__DataBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CMS__DataBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CMS__DataBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CMS__DataBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [CMS__DataBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CMS__DataBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CMS__DataBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CMS__DataBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CMS__DataBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CMS__DataBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CMS__DataBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CMS__DataBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CMS__DataBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CMS__DataBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CMS__DataBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CMS__DataBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CMS__DataBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CMS__DataBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CMS__DataBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CMS__DataBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CMS__DataBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CMS__DataBase] SET RECOVERY FULL 
GO
ALTER DATABASE [CMS__DataBase] SET  MULTI_USER 
GO
ALTER DATABASE [CMS__DataBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CMS__DataBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CMS__DataBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CMS__DataBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CMS__DataBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CMS__DataBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CMS__DataBase', N'ON'
GO
ALTER DATABASE [CMS__DataBase] SET QUERY_STORE = ON
GO
ALTER DATABASE [CMS__DataBase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CMS__DataBase]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 10-09-2024 21:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppointmentId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[AppointmentDate] [date] NOT NULL,
	[TokenNumber] [nvarchar](30) NULL,
	[ConsultationStatus] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 10-09-2024 21:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 10-09-2024 21:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NOT NULL,
	[ConsultationFee] [decimal](18, 2) NOT NULL,
	[SpecializationId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logins]    Script Date: 10-09-2024 21:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logins](
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MainPrescription]    Script Date: 10-09-2024 21:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainPrescription](
	[MainPrescriptionId] [int] IDENTITY(1,1) NOT NULL,
	[Symptoms] [nvarchar](max) NOT NULL,
	[Diagnosis] [nvarchar](max) NOT NULL,
	[TreatmentPlan] [nvarchar](max) NOT NULL,
	[AppointmentId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MainPrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicineBill]    Script Date: 10-09-2024 21:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineBill](
	[MedicineBillId] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentId] [int] NOT NULL,
	[GrandTotalAmount] [decimal](10, 2) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicineBillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicineInfo]    Script Date: 10-09-2024 21:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineInfo](
	[MedicineId] [int] IDENTITY(1,1) NOT NULL,
	[MedicineName] [nvarchar](100) NOT NULL,
	[GenericName] [nvarchar](100) NULL,
	[ManufacturingDate] [date] NOT NULL,
	[ExpiryDate] [date] NOT NULL,
	[Category] [nvarchar](50) NULL,
	[PricePerUnit] [decimal](10, 2) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicinePrescription]    Script Date: 10-09-2024 21:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicinePrescription](
	[MedicinePrescriptionId] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Dosage] [nvarchar](50) NULL,
	[Duration] [nvarchar](50) NULL,
	[Frequency] [nvarchar](50) NULL,
	[IsMedicineStatus] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicinePrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicinePrescriptionDetails]    Script Date: 10-09-2024 21:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicinePrescriptionDetails](
	[MedicinePrescriptionDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[MedicinePrescriptionId] [int] NOT NULL,
	[MedicineId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Dosage] [nvarchar](50) NULL,
	[Duration] [nvarchar](50) NULL,
	[Frequency] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicinePrescriptionDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 10-09-2024 21:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[PatientName] [nvarchar](100) NOT NULL,
	[DOB] [date] NOT NULL,
	[Gender] [nvarchar](20) NOT NULL,
	[BloodGroup] [nvarchar](10) NOT NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10-09-2024 21:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specializations]    Script Date: 10-09-2024 21:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specializations](
	[SpecializationId] [int] IDENTITY(1,1) NOT NULL,
	[SpecializationName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SpecializationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 10-09-2024 21:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffId] [int] IDENTITY(1000,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Gender] [nvarchar](20) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[BloodGroup] [nvarchar](5) NULL,
	[JoiningDate] [date] NOT NULL,
	[Salary] [decimal](18, 2) NOT NULL,
	[Experience] [int] NOT NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Qualification] [nvarchar](100) NULL,
	[Address] [nvarchar](200) NULL,
	[IsActive] [bit] NOT NULL,
	[DepartmentId] [int] NULL,
	[SpecializationId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 10-09-2024 21:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockId] [int] IDENTITY(1,1) NOT NULL,
	[StockQuantity] [int] NOT NULL,
	[MedicineId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestBill]    Script Date: 10-09-2024 21:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestBill](
	[TestBillId] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentId] [int] NOT NULL,
	[GrandTotalAmount] [decimal](10, 2) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TestBillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestInfo]    Script Date: 10-09-2024 21:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestInfo](
	[TestId] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [nvarchar](100) NOT NULL,
	[TestType] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[ReferenceMaxRange] [nvarchar](100) NULL,
	[SampleRequired] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestPrescription]    Script Date: 10-09-2024 21:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestPrescription](
	[TestPrescriptionId] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentId] [int] NOT NULL,
	[TestId] [int] NOT NULL,
	[TestResult] [nvarchar](500) NOT NULL,
	[IsStatus] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TestPrescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([AppointmentId], [PatientId], [DoctorId], [AppointmentDate], [TokenNumber], [ConsultationStatus]) VALUES (3, 1, 2, CAST(N'2024-09-15' AS Date), N'TKN001', 1)
INSERT [dbo].[Appointment] ([AppointmentId], [PatientId], [DoctorId], [AppointmentDate], [TokenNumber], [ConsultationStatus]) VALUES (4, 2, 3, CAST(N'2024-09-16' AS Date), N'TKN002', 0)
INSERT [dbo].[Appointment] ([AppointmentId], [PatientId], [DoctorId], [AppointmentDate], [TokenNumber], [ConsultationStatus]) VALUES (5, 3, 3, CAST(N'2024-09-17' AS Date), N'TKN003', 1)
INSERT [dbo].[Appointment] ([AppointmentId], [PatientId], [DoctorId], [AppointmentDate], [TokenNumber], [ConsultationStatus]) VALUES (6, 4, 4, CAST(N'2024-09-18' AS Date), N'TKN004', 0)
INSERT [dbo].[Appointment] ([AppointmentId], [PatientId], [DoctorId], [AppointmentDate], [TokenNumber], [ConsultationStatus]) VALUES (7, 5, 5, CAST(N'2024-09-19' AS Date), N'TKN005', 1)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (1, N'Cardiology')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (2, N'Neurology')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (5, N'Oncology')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (3, N'Orthopedics')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (4, N'Pediatrics')
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctors] ON 

INSERT [dbo].[Doctors] ([DoctorId], [StaffId], [ConsultationFee], [SpecializationId]) VALUES (2, 1000, CAST(300.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Doctors] ([DoctorId], [StaffId], [ConsultationFee], [SpecializationId]) VALUES (3, 1001, CAST(250.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Doctors] ([DoctorId], [StaffId], [ConsultationFee], [SpecializationId]) VALUES (4, 1002, CAST(200.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Doctors] ([DoctorId], [StaffId], [ConsultationFee], [SpecializationId]) VALUES (5, 1003, CAST(220.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Doctors] ([DoctorId], [StaffId], [ConsultationFee], [SpecializationId]) VALUES (6, 1004, CAST(280.00 AS Decimal(18, 2)), 5)
SET IDENTITY_INSERT [dbo].[Doctors] OFF
GO
SET IDENTITY_INSERT [dbo].[Logins] ON 

INSERT [dbo].[Logins] ([LoginId], [StaffId], [Username], [Password]) VALUES (8, 1001, N'johndoe', N'password1')
INSERT [dbo].[Logins] ([LoginId], [StaffId], [Username], [Password]) VALUES (9, 1002, N'janesmith', N'password2')
INSERT [dbo].[Logins] ([LoginId], [StaffId], [Username], [Password]) VALUES (10, 1003, N'michaeljohnson', N'password3')
INSERT [dbo].[Logins] ([LoginId], [StaffId], [Username], [Password]) VALUES (11, 1004, N'emilydavis', N'password4')
SET IDENTITY_INSERT [dbo].[Logins] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicineInfo] ON 

INSERT [dbo].[MedicineInfo] ([MedicineId], [MedicineName], [GenericName], [ManufacturingDate], [ExpiryDate], [Category], [PricePerUnit], [CreatedDate], [CreatedBy]) VALUES (8, N'Aspirin', N'Acetylsalicylic Acid', CAST(N'2023-01-01' AS Date), CAST(N'2025-01-01' AS Date), N'Pain Reliever', CAST(15.00 AS Decimal(10, 2)), CAST(N'2024-09-10T17:32:51.480' AS DateTime), 1000)
INSERT [dbo].[MedicineInfo] ([MedicineId], [MedicineName], [GenericName], [ManufacturingDate], [ExpiryDate], [Category], [PricePerUnit], [CreatedDate], [CreatedBy]) VALUES (9, N'Tylenol', N'Acetaminophen', CAST(N'2023-02-15' AS Date), CAST(N'2025-02-15' AS Date), N'Pain Reliever', CAST(20.00 AS Decimal(10, 2)), CAST(N'2024-09-10T17:32:51.480' AS DateTime), 1001)
INSERT [dbo].[MedicineInfo] ([MedicineId], [MedicineName], [GenericName], [ManufacturingDate], [ExpiryDate], [Category], [PricePerUnit], [CreatedDate], [CreatedBy]) VALUES (10, N'Amoxicillin', N'Amoxicillin', CAST(N'2023-03-10' AS Date), CAST(N'2025-03-10' AS Date), N'Antibiotic', CAST(30.00 AS Decimal(10, 2)), CAST(N'2024-09-10T17:32:51.480' AS DateTime), 1002)
INSERT [dbo].[MedicineInfo] ([MedicineId], [MedicineName], [GenericName], [ManufacturingDate], [ExpiryDate], [Category], [PricePerUnit], [CreatedDate], [CreatedBy]) VALUES (11, N'Ibuprofen', N'Ibuprofen', CAST(N'2023-04-20' AS Date), CAST(N'2025-04-20' AS Date), N'Pain Reliever', CAST(25.00 AS Decimal(10, 2)), CAST(N'2024-09-10T17:32:51.480' AS DateTime), 1003)
INSERT [dbo].[MedicineInfo] ([MedicineId], [MedicineName], [GenericName], [ManufacturingDate], [ExpiryDate], [Category], [PricePerUnit], [CreatedDate], [CreatedBy]) VALUES (12, N'Metformin', N'Metformin', CAST(N'2023-05-30' AS Date), CAST(N'2025-05-30' AS Date), N'Diabetes', CAST(35.00 AS Decimal(10, 2)), CAST(N'2024-09-10T17:32:51.480' AS DateTime), 1004)
SET IDENTITY_INSERT [dbo].[MedicineInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([PatientId], [PatientName], [DOB], [Gender], [BloodGroup], [PhoneNumber], [Address], [Email]) VALUES (1, N'Alice Green', CAST(N'1975-09-10' AS Date), N'Female', N'O+', N'678-901-2345', N'101 First Ave, Cityville', N'alice.green@example.com')
INSERT [dbo].[Patient] ([PatientId], [PatientName], [DOB], [Gender], [BloodGroup], [PhoneNumber], [Address], [Email]) VALUES (2, N'Bob White', CAST(N'1982-12-22' AS Date), N'Male', N'A-', N'789-012-3456', N'202 Second St, Cityville', N'bob.white@example.com')
INSERT [dbo].[Patient] ([PatientId], [PatientName], [DOB], [Gender], [BloodGroup], [PhoneNumber], [Address], [Email]) VALUES (3, N'Carol Black', CAST(N'1991-06-16' AS Date), N'Female', N'B+', N'890-123-4567', N'303 Third Blvd, Cityville', N'carol.black@example.com')
INSERT [dbo].[Patient] ([PatientId], [PatientName], [DOB], [Gender], [BloodGroup], [PhoneNumber], [Address], [Email]) VALUES (4, N'David Grey', CAST(N'1984-03-05' AS Date), N'Male', N'AB-', N'901-234-5678', N'404 Fourth Dr, Cityville', N'david.grey@example.com')
INSERT [dbo].[Patient] ([PatientId], [PatientName], [DOB], [Gender], [BloodGroup], [PhoneNumber], [Address], [Email]) VALUES (5, N'Eva Blue', CAST(N'1990-08-30' AS Date), N'Female', N'O-', N'012-345-6789', N'505 Fifth Ct, Cityville', N'eva.blue@example.com')
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName], [IsActive]) VALUES (1, N'Doctor', 1)
INSERT [dbo].[Roles] ([RoleId], [RoleName], [IsActive]) VALUES (2, N'Nurse', 1)
INSERT [dbo].[Roles] ([RoleId], [RoleName], [IsActive]) VALUES (3, N'Receptionist', 1)
INSERT [dbo].[Roles] ([RoleId], [RoleName], [IsActive]) VALUES (4, N'Pharmacist', 1)
INSERT [dbo].[Roles] ([RoleId], [RoleName], [IsActive]) VALUES (5, N'Lab Technician', 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Specializations] ON 

INSERT [dbo].[Specializations] ([SpecializationId], [SpecializationName]) VALUES (1, N'Cardiologist')
INSERT [dbo].[Specializations] ([SpecializationId], [SpecializationName]) VALUES (2, N'Neurologist')
INSERT [dbo].[Specializations] ([SpecializationId], [SpecializationName]) VALUES (5, N'Oncologist')
INSERT [dbo].[Specializations] ([SpecializationId], [SpecializationName]) VALUES (3, N'Orthopedic Surgeon')
INSERT [dbo].[Specializations] ([SpecializationId], [SpecializationName]) VALUES (4, N'Pediatrician')
SET IDENTITY_INSERT [dbo].[Specializations] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([StaffId], [FirstName], [LastName], [Gender], [DateOfBirth], [BloodGroup], [JoiningDate], [Salary], [Experience], [PhoneNumber], [Email], [Qualification], [Address], [IsActive], [DepartmentId], [SpecializationId], [RoleId]) VALUES (1000, N'John', N'Doe', N'Male', CAST(N'1980-01-15' AS Date), N'O+', CAST(N'2010-05-23' AS Date), CAST(75000.00 AS Decimal(18, 2)), 14, N'123-456-7890', N'john.doe@example.com', N'MBBS', N'123 Elm St, Cityville', 1, 1, 1, 1)
INSERT [dbo].[Staff] ([StaffId], [FirstName], [LastName], [Gender], [DateOfBirth], [BloodGroup], [JoiningDate], [Salary], [Experience], [PhoneNumber], [Email], [Qualification], [Address], [IsActive], [DepartmentId], [SpecializationId], [RoleId]) VALUES (1001, N'Jane', N'Smith', N'Female', CAST(N'1985-02-10' AS Date), N'A-', CAST(N'2015-08-14' AS Date), CAST(68000.00 AS Decimal(18, 2)), 9, N'234-567-8901', N'jane.smith@example.com', N'MSN', N'456 Oak St, Cityville', 1, 2, 2, 2)
INSERT [dbo].[Staff] ([StaffId], [FirstName], [LastName], [Gender], [DateOfBirth], [BloodGroup], [JoiningDate], [Salary], [Experience], [PhoneNumber], [Email], [Qualification], [Address], [IsActive], [DepartmentId], [SpecializationId], [RoleId]) VALUES (1002, N'Michael', N'Johnson', N'Male', CAST(N'1990-03-25' AS Date), N'B+', CAST(N'2018-03-30' AS Date), CAST(55000.00 AS Decimal(18, 2)), 6, N'345-678-9012', N'michael.johnson@example.com', N'BSN', N'789 Pine St, Cityville', 1, 3, 3, 3)
INSERT [dbo].[Staff] ([StaffId], [FirstName], [LastName], [Gender], [DateOfBirth], [BloodGroup], [JoiningDate], [Salary], [Experience], [PhoneNumber], [Email], [Qualification], [Address], [IsActive], [DepartmentId], [SpecializationId], [RoleId]) VALUES (1003, N'Emily', N'Davis', N'Female', CAST(N'1992-07-05' AS Date), N'AB-', CAST(N'2020-06-01' AS Date), CAST(60000.00 AS Decimal(18, 2)), 4, N'456-789-0123', N'emily.davis@example.com', N'BSc', N'321 Maple St, Cityville', 1, 4, 4, 4)
INSERT [dbo].[Staff] ([StaffId], [FirstName], [LastName], [Gender], [DateOfBirth], [BloodGroup], [JoiningDate], [Salary], [Experience], [PhoneNumber], [Email], [Qualification], [Address], [IsActive], [DepartmentId], [SpecializationId], [RoleId]) VALUES (1004, N'Robert', N'Brown', N'Male', CAST(N'1988-11-20' AS Date), N'O-', CAST(N'2012-12-10' AS Date), CAST(70000.00 AS Decimal(18, 2)), 12, N'567-890-1234', N'robert.brown@example.com', N'MD', N'654 Cedar St, Cityville', 1, 5, 5, 5)
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[TestInfo] ON 

INSERT [dbo].[TestInfo] ([TestId], [TestName], [TestType], [Category], [Amount], [ReferenceMaxRange], [SampleRequired], [CreatedDate], [CreatedBy]) VALUES (3, N'Blood Test', N'Blood', N'General', CAST(50.00 AS Decimal(10, 2)), N'N/A', N'Blood Sample', CAST(N'2024-09-10T17:40:20.557' AS DateTime), 1001)
INSERT [dbo].[TestInfo] ([TestId], [TestName], [TestType], [Category], [Amount], [ReferenceMaxRange], [SampleRequired], [CreatedDate], [CreatedBy]) VALUES (4, N'X-Ray', N'Imaging', N'Radiology', CAST(100.00 AS Decimal(10, 2)), N'N/A', N'X-Ray Film', CAST(N'2024-09-10T17:40:20.557' AS DateTime), 1002)
INSERT [dbo].[TestInfo] ([TestId], [TestName], [TestType], [Category], [Amount], [ReferenceMaxRange], [SampleRequired], [CreatedDate], [CreatedBy]) VALUES (5, N'CT Scan', N'Imaging', N'Radiology', CAST(200.00 AS Decimal(10, 2)), N'N/A', N'CT Scan', CAST(N'2024-09-10T17:40:20.557' AS DateTime), 1003)
INSERT [dbo].[TestInfo] ([TestId], [TestName], [TestType], [Category], [Amount], [ReferenceMaxRange], [SampleRequired], [CreatedDate], [CreatedBy]) VALUES (6, N'Ultrasound', N'Imaging', N'Radiology', CAST(150.00 AS Decimal(10, 2)), N'N/A', N'Ultrasound Gel', CAST(N'2024-09-10T17:40:20.557' AS DateTime), 1003)
INSERT [dbo].[TestInfo] ([TestId], [TestName], [TestType], [Category], [Amount], [ReferenceMaxRange], [SampleRequired], [CreatedDate], [CreatedBy]) VALUES (7, N'Urine Test', N'Urine', N'General', CAST(30.00 AS Decimal(10, 2)), N'N/A', N'Urine Sample', CAST(N'2024-09-10T17:40:20.557' AS DateTime), 1001)
SET IDENTITY_INSERT [dbo].[TestInfo] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Appointm__435734E17EF6E46D]    Script Date: 10-09-2024 21:26:19 ******/
ALTER TABLE [dbo].[Appointment] ADD UNIQUE NONCLUSTERED 
(
	[TokenNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__D949CC346C5B8E94]    Script Date: 10-09-2024 21:26:19 ******/
ALTER TABLE [dbo].[Departments] ADD UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Logins__536C85E4631713C8]    Script Date: 10-09-2024 21:26:19 ******/
ALTER TABLE [dbo].[Logins] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Patient__85FB4E3862E36383]    Script Date: 10-09-2024 21:26:19 ******/
ALTER TABLE [dbo].[Patient] ADD UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Patient__A9D1053481F29343]    Script Date: 10-09-2024 21:26:19 ******/
ALTER TABLE [dbo].[Patient] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__8A2B616066B14F28]    Script Date: 10-09-2024 21:26:19 ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Speciali__08A8EB9E5A4B6B99]    Script Date: 10-09-2024 21:26:19 ******/
ALTER TABLE [dbo].[Specializations] ADD UNIQUE NONCLUSTERED 
(
	[SpecializationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staff__85FB4E387040B9DE]    Script Date: 10-09-2024 21:26:19 ******/
ALTER TABLE [dbo].[Staff] ADD UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staff__A9D105347BEACF38]    Script Date: 10-09-2024 21:26:19 ******/
ALTER TABLE [dbo].[Staff] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MainPrescription] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[MedicineBill] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[MedicineInfo] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[MedicinePrescription] ADD  DEFAULT ((0)) FOR [IsMedicineStatus]
GO
ALTER TABLE [dbo].[MedicinePrescription] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Stock] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TestBill] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TestInfo] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TestPrescription] ADD  DEFAULT ((0)) FOR [IsStatus]
GO
ALTER TABLE [dbo].[TestPrescription] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Doctor] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Doctor]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Patient]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Specializations] FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specializations] ([SpecializationId])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Specializations]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Staff]
GO
ALTER TABLE [dbo].[Logins]  WITH CHECK ADD  CONSTRAINT [FK_Logins_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[Logins] CHECK CONSTRAINT [FK_Logins_Staff]
GO
ALTER TABLE [dbo].[MainPrescription]  WITH CHECK ADD  CONSTRAINT [FK_MainPrescription_Appointment] FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointment] ([AppointmentId])
GO
ALTER TABLE [dbo].[MainPrescription] CHECK CONSTRAINT [FK_MainPrescription_Appointment]
GO
ALTER TABLE [dbo].[MainPrescription]  WITH CHECK ADD  CONSTRAINT [FK_MainPrescription_Staff] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[MainPrescription] CHECK CONSTRAINT [FK_MainPrescription_Staff]
GO
ALTER TABLE [dbo].[MedicineBill]  WITH CHECK ADD  CONSTRAINT [FK_MedicineBill_Appointment] FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointment] ([AppointmentId])
GO
ALTER TABLE [dbo].[MedicineBill] CHECK CONSTRAINT [FK_MedicineBill_Appointment]
GO
ALTER TABLE [dbo].[MedicineBill]  WITH CHECK ADD  CONSTRAINT [FK_MedicineBill_Staff] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[MedicineBill] CHECK CONSTRAINT [FK_MedicineBill_Staff]
GO
ALTER TABLE [dbo].[MedicineInfo]  WITH CHECK ADD  CONSTRAINT [FK_MedicineInfo_Staff] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[MedicineInfo] CHECK CONSTRAINT [FK_MedicineInfo_Staff]
GO
ALTER TABLE [dbo].[MedicinePrescription]  WITH CHECK ADD  CONSTRAINT [FK_MedicinePrescription_Appointment] FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointment] ([AppointmentId])
GO
ALTER TABLE [dbo].[MedicinePrescription] CHECK CONSTRAINT [FK_MedicinePrescription_Appointment]
GO
ALTER TABLE [dbo].[MedicinePrescription]  WITH CHECK ADD  CONSTRAINT [FK_MedicinePrescription_Staff] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[MedicinePrescription] CHECK CONSTRAINT [FK_MedicinePrescription_Staff]
GO
ALTER TABLE [dbo].[MedicinePrescriptionDetails]  WITH CHECK ADD  CONSTRAINT [FK_MedicinePrescriptionDetails_Medicine] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[MedicineInfo] ([MedicineId])
GO
ALTER TABLE [dbo].[MedicinePrescriptionDetails] CHECK CONSTRAINT [FK_MedicinePrescriptionDetails_Medicine]
GO
ALTER TABLE [dbo].[MedicinePrescriptionDetails]  WITH CHECK ADD  CONSTRAINT [FK_MedicinePrescriptionDetails_MedicinePrescription] FOREIGN KEY([MedicinePrescriptionId])
REFERENCES [dbo].[MedicinePrescription] ([MedicinePrescriptionId])
GO
ALTER TABLE [dbo].[MedicinePrescriptionDetails] CHECK CONSTRAINT [FK_MedicinePrescriptionDetails_MedicinePrescription]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Departments]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Roles]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Specializations] FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specializations] ([SpecializationId])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Specializations]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_MedicineInfo] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[MedicineInfo] ([MedicineId])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_MedicineInfo]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Staff] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Staff]
GO
ALTER TABLE [dbo].[TestBill]  WITH CHECK ADD  CONSTRAINT [FK_TestBill_Appointment] FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointment] ([AppointmentId])
GO
ALTER TABLE [dbo].[TestBill] CHECK CONSTRAINT [FK_TestBill_Appointment]
GO
ALTER TABLE [dbo].[TestBill]  WITH CHECK ADD  CONSTRAINT [FK_TestBill_Staff] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[TestBill] CHECK CONSTRAINT [FK_TestBill_Staff]
GO
ALTER TABLE [dbo].[TestInfo]  WITH CHECK ADD  CONSTRAINT [FK_TestInfo_Staff] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[TestInfo] CHECK CONSTRAINT [FK_TestInfo_Staff]
GO
ALTER TABLE [dbo].[TestPrescription]  WITH CHECK ADD  CONSTRAINT [FK_TestPrescription_Appointment] FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Appointment] ([AppointmentId])
GO
ALTER TABLE [dbo].[TestPrescription] CHECK CONSTRAINT [FK_TestPrescription_Appointment]
GO
ALTER TABLE [dbo].[TestPrescription]  WITH CHECK ADD  CONSTRAINT [FK_TestPrescription_Staff] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[TestPrescription] CHECK CONSTRAINT [FK_TestPrescription_Staff]
GO
ALTER TABLE [dbo].[TestPrescription]  WITH CHECK ADD  CONSTRAINT [FK_TestPrescription_TestInfo] FOREIGN KEY([TestId])
REFERENCES [dbo].[TestInfo] ([TestId])
GO
ALTER TABLE [dbo].[TestPrescription] CHECK CONSTRAINT [FK_TestPrescription_TestInfo]
GO
USE [master]
GO
ALTER DATABASE [CMS__DataBase] SET  READ_WRITE 
GO
