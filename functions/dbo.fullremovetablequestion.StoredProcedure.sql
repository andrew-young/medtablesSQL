USE [question]
GO
/****** Object:  StoredProcedure [dbo].[fullremovetablequestion]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP PROCEDURE [dbo].[fullremovetablequestion]
GO
/****** Object:  StoredProcedure [dbo].[fullremovetablequestion]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create procedure [dbo].[fullremovetablequestion] (@qid int)
	AS
BEGIN
	delete from question.dbo.tableanswer
	where qid=@qid

	delete from question.dbo.tableanswertext
	where qid=@qid

	delete from question.dbo.tablequestion
	where qid=@qid

	delete from question.dbo.tablerow
	where qid=@qid

	delete from question.dbo.tablecolumn
	where qid=@qid

	delete from question.dbo.image
	where qid=@qid

	
	delete from question.dbo.question
	where qid=@qid

	delete from question.dbo.testquestion
	where qid=@qid

	
	
END
GO
