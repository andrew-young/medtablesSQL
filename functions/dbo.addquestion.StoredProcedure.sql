USE [question]
GO
/****** Object:  StoredProcedure [dbo].[addquestion]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP PROCEDURE [dbo].[addquestion]
GO
/****** Object:  StoredProcedure [dbo].[addquestion]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[addquestion](@text varchar(max),@userid int,@qid int output )
	AS
BEGIN

	insert into question.dbo.question (userid,text) 
	values(@userid,@text)

	select @qid=@@IDENTITY
end
GO
