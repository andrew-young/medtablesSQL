USE [question]
GO
/****** Object:  Table [dbo].[testquestion]    Script Date: 2023-06-27 2:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[testquestion](
	[tid] [int] NOT NULL,
	[qid] [int] NOT NULL,
 CONSTRAINT [pk_groupquestion] PRIMARY KEY CLUSTERED 
(
	[tid] ASC,
	[qid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
