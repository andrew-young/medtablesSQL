USE [question]
GO
/****** Object:  StoredProcedure [dbo].[addtablerow]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP PROCEDURE [dbo].[addtablerow]
GO
/****** Object:  StoredProcedure [dbo].[addtablerow]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[addtablerow](@qid int,@rid int,@text nvarchar(max))
	AS
BEGIN
	insert into question.dbo.tablerow (qid,rid,text)
	values(@qid ,@rid,@text)
end
GO
