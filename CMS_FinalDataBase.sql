USE [master]
GO
/****** Object:  Database [CMS_database]    Script Date: 10-09-2024 16:48:36 ******/
CREATE DATABASE [CMS_database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CMS_database', FILENAME = N'D:\program_sqlserver\MSSQL16.MSSQLSERVER\MSSQL\DATA\CMS_database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CMS_database_log', FILENAME = N'D:\program_sqlserver\MSSQL16.MSSQLSERVER\MSSQL\DATA\CMS_database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CMS_database] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CMS_database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CMS_database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CMS_database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CMS_database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CMS_database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CMS_database] SET ARITHABORT OFF 
GO
ALTER DATABASE [CMS_database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CMS_database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CMS_database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CMS_database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CMS_database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CMS_database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CMS_database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CMS_database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CMS_database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CMS_database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CMS_database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CMS_database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CMS_database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CMS_database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CMS_database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CMS_database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CMS_database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CMS_database] SET RECOVERY FULL 
GO
ALTER DATABASE [CMS_database] SET  MULTI_USER 
GO
ALTER DATABASE [CMS_database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CMS_database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CMS_database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CMS_database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CMS_database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CMS_database] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CMS_database', N'ON'
GO
ALTER DATABASE [CMS_database] SET QUERY_STORE = ON
GO
ALTER DATABASE [CMS_database] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CMS_database]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 10-09-2024 16:48:36 ******/
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
/****** Object:  Table [dbo].[Departments]    Script Date: 10-09-2024 16:48:36 ******/
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
/****** Object:  Table [dbo].[Doctors]    Script Date: 10-09-2024 16:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NOT NULL,
	[ConsultationFee] [decimal](18, 2) NOT NULL,
	[SpecializationId] [int] NOT NULL,
	[DepartmentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logins]    Script Date: 10-09-2024 16:48:36 ******/
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
/****** Object:  Table [dbo].[MainPrescription]    Script Date: 10-09-2024 16:48:36 ******/
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
/****** Object:  Table [dbo].[MedicineBill]    Script Date: 10-09-2024 16:48:36 ******/
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
/****** Object:  Table [dbo].[MedicineInfo]    Script Date: 10-09-2024 16:48:36 ******/
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
/****** Object:  Table [dbo].[MedicinePrescription]    Script Date: 10-09-2024 16:48:36 ******/
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
/****** Object:  Table [dbo].[MedicinePrescriptionDetails]    Script Date: 10-09-2024 16:48:36 ******/
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
/****** Object:  Table [dbo].[Patient]    Script Date: 10-09-2024 16:48:36 ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 10-09-2024 16:48:36 ******/
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
/****** Object:  Table [dbo].[Specializations]    Script Date: 10-09-2024 16:48:36 ******/
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
/****** Object:  Table [dbo].[Staff]    Script Date: 10-09-2024 16:48:36 ******/
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
/****** Object:  Table [dbo].[TestBill]    Script Date: 10-09-2024 16:48:36 ******/
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
/****** Object:  Table [dbo].[TestInfo]    Script Date: 10-09-2024 16:48:36 ******/
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
/****** Object:  Table [dbo].[TestPrescription]    Script Date: 10-09-2024 16:48:36 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Appointm__435734E17ED38770]    Script Date: 10-09-2024 16:48:36 ******/
ALTER TABLE [dbo].[Appointment] ADD UNIQUE NONCLUSTERED 
(
	[TokenNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__D949CC344097B93F]    Script Date: 10-09-2024 16:48:36 ******/
ALTER TABLE [dbo].[Departments] ADD UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Logins__536C85E4D6737E33]    Script Date: 10-09-2024 16:48:36 ******/
ALTER TABLE [dbo].[Logins] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Patient__85FB4E38AE7A2649]    Script Date: 10-09-2024 16:48:36 ******/
ALTER TABLE [dbo].[Patient] ADD UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Patient__A9D105348457D912]    Script Date: 10-09-2024 16:48:36 ******/
ALTER TABLE [dbo].[Patient] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__8A2B61601F4A56B4]    Script Date: 10-09-2024 16:48:36 ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Speciali__08A8EB9E13A740C0]    Script Date: 10-09-2024 16:48:36 ******/
ALTER TABLE [dbo].[Specializations] ADD UNIQUE NONCLUSTERED 
(
	[SpecializationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staff__85FB4E3857F53ACF]    Script Date: 10-09-2024 16:48:36 ******/
ALTER TABLE [dbo].[Staff] ADD UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staff__A9D10534B162FB27]    Script Date: 10-09-2024 16:48:36 ******/
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
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Departments]
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
ALTER DATABASE [CMS_database] SET  READ_WRITE 
GO
