USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[getquestion]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[getquestion]
GO
/****** Object:  UserDefinedFunction [dbo].[getquestion]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create FUNCTION [dbo].[getquestion](@qid int)
returns table
as
return
(
	select q.text,q.qid,q.userid
	from question q
	where q.qid=@qid
);
GO
