USE [question]
GO
/****** Object:  StoredProcedure [dbo].[addtestquestion]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP PROCEDURE [dbo].[addtestquestion]
GO
/****** Object:  StoredProcedure [dbo].[addtestquestion]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[addtestquestion](@qid int,@tid int)
	AS
BEGIN
	insert into question.dbo.testquestion (qid,tid)
	values(@qid,@tid)
end
GO
