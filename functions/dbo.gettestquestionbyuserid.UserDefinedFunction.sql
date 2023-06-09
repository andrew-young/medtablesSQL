USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[gettestquestionbyuserid]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[gettestquestionbyuserid]
GO
/****** Object:  UserDefinedFunction [dbo].[gettestquestionbyuserid]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create FUNCTION [dbo].[gettestquestionbyuserid](@userid int)
returns table
as
return
(
	select t.tid,tq.qid,q.text,q.userid --q.userid may be diffrent from @userid
	from test t
		inner join testquestion tq on t.tid=tq.tid
		inner join question q on tq.qid=q.qid
	where t.userid=@userid
);
GO
