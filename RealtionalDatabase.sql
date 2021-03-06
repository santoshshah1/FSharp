USE [UNI-KL]
GO
/****** Object:  ForeignKey [FK__Participa__Semin__440B1D61]    Script Date: 12/30/2014 21:29:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Participa__Semin__440B1D61]') AND parent_object_id = OBJECT_ID(N'[dbo].[Participants]'))
ALTER TABLE [dbo].[Participants] DROP CONSTRAINT [FK__Participa__Semin__440B1D61]
GO
/****** Object:  Table [dbo].[Participants]    Script Date: 12/30/2014 21:29:24 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Participa__Semin__440B1D61]') AND parent_object_id = OBJECT_ID(N'[dbo].[Participants]'))
ALTER TABLE [dbo].[Participants] DROP CONSTRAINT [FK__Participa__Semin__440B1D61]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Participants]') AND type in (N'U'))
DROP TABLE [dbo].[Participants]
GO
/****** Object:  Table [dbo].[Seminar]    Script Date: 12/30/2014 21:29:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Seminar]') AND type in (N'U'))
DROP TABLE [dbo].[Seminar]
GO
/****** Object:  Table [dbo].[Seminar]    Script Date: 12/30/2014 21:29:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Seminar]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Seminar](
	[SeminarID] [int] IDENTITY(1,1) NOT NULL,
	[Semester] [nvarchar](20) NOT NULL,
	[Level] [nvarchar](10) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SeminarID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Seminar] ON
INSERT [dbo].[Seminar] ([SeminarID], [Semester], [Level], [Title]) VALUES (1, N'SeminarWS1415', N'Bachelor', N'Working with Monads in Scala')
INSERT [dbo].[Seminar] ([SeminarID], [Semester], [Level], [Title]) VALUES (2, N'SeminarWS1415', N'Bachelor', N'Concurrent Haskell')
INSERT [dbo].[Seminar] ([SeminarID], [Semester], [Level], [Title]) VALUES (3, N'SeminarWS1415', N'Master', N'Software Transactional Memory')
INSERT [dbo].[Seminar] ([SeminarID], [Semester], [Level], [Title]) VALUES (4, N'SeminarWS1415', N'Bachelor', N'Data parallel Haskell')
SET IDENTITY_INSERT [dbo].[Seminar] OFF
/****** Object:  Table [dbo].[Participants]    Script Date: 12/30/2014 21:29:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Participants]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Participants](
	[ParticipantID] [int] IDENTITY(1,1) NOT NULL,
	[SeminarID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Grade] [nvarchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[ParticipantID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Participants] ON
INSERT [dbo].[Participants] ([ParticipantID], [SeminarID], [Name], [Grade]) VALUES (1, 1, N'Santosh', N'Pass')
INSERT [dbo].[Participants] ([ParticipantID], [SeminarID], [Name], [Grade]) VALUES (2, 2, N'Helen', N'Pass')
SET IDENTITY_INSERT [dbo].[Participants] OFF
/****** Object:  ForeignKey [FK__Participa__Semin__440B1D61]    Script Date: 12/30/2014 21:29:24 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Participa__Semin__440B1D61]') AND parent_object_id = OBJECT_ID(N'[dbo].[Participants]'))
ALTER TABLE [dbo].[Participants]  WITH CHECK ADD FOREIGN KEY([SeminarID])
REFERENCES [dbo].[Seminar] ([SeminarID])
GO
