USE [question]
GO
/****** Object:  Table [dbo].[tablequestion]    Script Date: 2023-06-27 2:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tablequestion](
	[qid] [int] NOT NULL,
	[randomcolumnorder] [bit] NOT NULL,
	[randomroworder] [bit] NOT NULL,
	[dragrow] [bit] NOT NULL,
	[dragcol] [bit] NOT NULL,
	[swap] [bit] NOT NULL,
 CONSTRAINT [pk_tablequestion] PRIMARY KEY CLUSTERED 
(
	[qid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tablequestion] ADD  DEFAULT ((0)) FOR [swap]
GO
