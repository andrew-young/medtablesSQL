USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[gettesttablequestion]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[gettesttablequestion]
GO
/****** Object:  UserDefinedFunction [dbo].[gettesttablequestion]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





create FUNCTION [dbo].[gettesttablequestion](@tid int)
returns table
as
return
(
	select tq.qid, tq.randomcolumnorder as randomcol, tq.randomroworder as randomrow, tq.dragrow as dragrow, tq.dragcol as dragcol,tq.swap
	from test t
		inner join testquestion testq on t.tid = testq.tid
		inner join tablequestion tq on tq.qid=testq.qid
	where t.tid=@tid 
);
GO
