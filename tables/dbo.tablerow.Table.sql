USE [question]
GO
/****** Object:  Table [dbo].[tablerow]    Script Date: 2023-06-27 2:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tablerow](
	[qid] [int] NOT NULL,
	[rid] [int] NOT NULL,
	[text] [nvarchar](max) NULL,
 CONSTRAINT [PK_rows] PRIMARY KEY CLUSTERED 
(
	[qid] ASC,
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
