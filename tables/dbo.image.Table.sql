USE [question]
GO
/****** Object:  Table [dbo].[image]    Script Date: 2023-06-27 2:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[qid] [int] NOT NULL,
	[imagename] [varchar](100) NULL,
	[note] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
