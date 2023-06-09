USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[gettableanswer]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[gettableanswer]
GO
/****** Object:  UserDefinedFunction [dbo].[gettableanswer]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create FUNCTION [dbo].[gettableanswer](@qid int)
returns table
as
return
(
	select cid,rid,tat.text
	from tableanswer ta
		inner join tableanswertext tat on ta.aid=tat.aid and ta.qid=tat.qid
	where ta.qid=@qid
);
GO
