USE [question]
GO
/****** Object:  StoredProcedure [dbo].[addtableanswer]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP PROCEDURE [dbo].[addtableanswer]
GO
/****** Object:  StoredProcedure [dbo].[addtableanswer]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[addtableanswer](@qid int,@rid int,@cid int,@aid int)
	AS
BEGIN
	insert into question.dbo.tableanswer (qid,rid,cid,aid)
	values(@qid,@rid ,@cid ,@aid)
end
GO
