USE [question]
GO
/****** Object:  Table [dbo].[tableanswertext]    Script Date: 2023-06-27 2:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableanswertext](
	[qid] [int] NOT NULL,
	[aid] [int] NOT NULL,
	[text] [nvarchar](max) NULL,
 CONSTRAINT [pk_tableanswertext] PRIMARY KEY CLUSTERED 
(
	[qid] ASC,
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
