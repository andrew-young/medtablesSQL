USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[gettesttablerow]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[gettesttablerow]
GO
/****** Object:  UserDefinedFunction [dbo].[gettesttablerow]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create FUNCTION [dbo].[gettesttablerow](@tid int)
returns table
as
return
(
	select tr.qid,tr.rid,tr.text
	from test t
		inner join testquestion tq on t.tid = tq.tid
		inner join tablerow tr on tr.qid=tq.qid
	where t.tid=@tid 
);
GO
