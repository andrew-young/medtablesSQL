USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[gettestquestion]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[gettestquestion]
GO
/****** Object:  UserDefinedFunction [dbo].[gettestquestion]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create FUNCTION [dbo].[gettestquestion](@tid int)
returns table
as
return
(
	select q.qid,q.text,q.userid
	from test t
		inner join testquestion tq on t.tid = tq.tid
		inner join question q on q.qid=tq.qid
	where t.tid=@tid 
);
GO
