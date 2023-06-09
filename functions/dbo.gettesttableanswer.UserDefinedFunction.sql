USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[gettesttableanswer]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[gettesttableanswer]
GO
/****** Object:  UserDefinedFunction [dbo].[gettesttableanswer]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






create FUNCTION [dbo].[gettesttableanswer](@tid int)
returns table
as
return
(
	select ta.qid,ta.aid,ta.cid,ta.rid,tat.text
	from test t
		inner join testquestion tq on t.tid = tq.tid
		inner join tableanswer ta on ta.qid = tq.qid
		inner join tableanswertext tat on ta.aid=tat.aid and ta.qid=tat.qid
	where t.tid=@tid
);
GO
