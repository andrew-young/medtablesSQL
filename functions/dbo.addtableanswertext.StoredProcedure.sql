USE [question]
GO
/****** Object:  StoredProcedure [dbo].[addtableanswertext]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP PROCEDURE [dbo].[addtableanswertext]
GO
/****** Object:  StoredProcedure [dbo].[addtableanswertext]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[addtableanswertext](@qid int,@aid int,@text nvarchar(max))
	AS
BEGIN
	insert into question.dbo.tableanswertext (qid,aid,text)
	values(@qid ,@aid,@text)
end
GO
