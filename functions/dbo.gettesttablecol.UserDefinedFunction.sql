USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[gettesttablecol]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[gettesttablecol]
GO
/****** Object:  UserDefinedFunction [dbo].[gettesttablecol]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create FUNCTION [dbo].[gettesttablecol](@tid int)
returns table
as
return
(
	select tc.qid,tc.cid,tc.text
	from test t
		inner join testquestion tq on t.tid = tq.tid
		inner join tablecolumn tc on tc.qid=tq.qid
	where t.tid=@tid 
);
GO
