USE [question]
GO
/****** Object:  StoredProcedure [dbo].[removequestion]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP PROCEDURE [dbo].[removequestion]
GO
/****** Object:  StoredProcedure [dbo].[removequestion]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[removequestion](@questionid int)
	AS
BEGIN
	delete from question.dbo.question
	where id=@questionid

	delete from question.dbo.answer
	where questionid=@questionid

	delete from question.dbo.groupquestion
	where questionid=@questionid 
end
GO
