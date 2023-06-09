USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[gettablequestion]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[gettablequestion]
GO
/****** Object:  UserDefinedFunction [dbo].[gettablequestion]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





create FUNCTION [dbo].[gettablequestion](@qid int)
returns table
as
return
(
	select t.qid, q.userid,q.text, t.randomroworder as randomrow , t.randomcolumnorder as randomcol
	, t.dragrow, t.dragcol,t.swap
	from tablequestion t
		inner join question q on t.qid=q.qid
	where t.qid=@qid
);
GO
