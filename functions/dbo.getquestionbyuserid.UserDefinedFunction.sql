USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[getquestionbyuserid]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[getquestionbyuserid]
GO
/****** Object:  UserDefinedFunction [dbo].[getquestionbyuserid]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create FUNCTION [dbo].[getquestionbyuserid](@userid int)
returns table
as
return
(
	select q.text,q.qid--,q.userid
	from question q
	where q.userid=@userid
);
GO
