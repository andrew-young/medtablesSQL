USE [question]
GO
/****** Object:  StoredProcedure [dbo].[removeimage]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP PROCEDURE [dbo].[removeimage]
GO
/****** Object:  StoredProcedure [dbo].[removeimage]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[removeimage] (@qid int)
	AS
BEGIN
	delete from question.dbo.image
	where qid=@qid
END
GO
