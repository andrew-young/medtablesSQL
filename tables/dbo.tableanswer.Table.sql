USE [question]
GO
/****** Object:  Table [dbo].[tableanswer]    Script Date: 2023-06-27 2:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableanswer](
	[qid] [int] NOT NULL,
	[rid] [int] NOT NULL,
	[cid] [int] NOT NULL,
	[aid] [int] NOT NULL,
 CONSTRAINT [pk_tableanswer] PRIMARY KEY CLUSTERED 
(
	[qid] ASC,
	[rid] ASC,
	[cid] ASC,
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
