USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[gettablecol]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[gettablecol]
GO
/****** Object:  UserDefinedFunction [dbo].[gettablecol]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[gettablecol](@qid int)
returns table
as
return
(
	select cid,text
	from tablecolumn
	where qid=@qid
);
GO
