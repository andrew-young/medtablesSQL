USE [question]
GO
/****** Object:  StoredProcedure [dbo].[addtablecolumn]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP PROCEDURE [dbo].[addtablecolumn]
GO
/****** Object:  StoredProcedure [dbo].[addtablecolumn]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[addtablecolumn](@qid int,@cid int,@text nvarchar(max))
	AS
BEGIN
	insert into question.dbo.tablecolumn (qid,cid,text)
	values(@qid ,@cid,@text)
end
GO
