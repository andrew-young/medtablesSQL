USE [question]
GO
/****** Object:  StoredProcedure [dbo].[updatequestion]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP PROCEDURE [dbo].[updatequestion]
GO
/****** Object:  StoredProcedure [dbo].[updatequestion]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[updatequestion](@qid int, @text varchar(max),@userid int )
	AS
BEGIN

	update question.dbo.question 
	set userid=@userid
		,text=@text
	where qid = @qid

end
GO
