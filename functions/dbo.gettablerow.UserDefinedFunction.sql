USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[gettablerow]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[gettablerow]
GO
/****** Object:  UserDefinedFunction [dbo].[gettablerow]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[gettablerow](@qid int)
returns table
as
return
(
	select rid,text
	from tablerow
	where qid=@qid
);
GO
