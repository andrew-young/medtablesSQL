USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[gettestimage]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[gettestimage]
GO
/****** Object:  UserDefinedFunction [dbo].[gettestimage]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





create FUNCTION [dbo].[gettestimage](@tid int)
returns table
as
return
(
	select img.qid, imagename, note
	from test t
		inner join testquestion tq on t.tid=tq.tid
		inner join image img on img.qid=tq.qid
	where t.tid=@tid 
);
GO
