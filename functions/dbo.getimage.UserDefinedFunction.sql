USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[getimage]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[getimage]
GO
/****** Object:  UserDefinedFunction [dbo].[getimage]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create FUNCTION [dbo].[getimage](@qid int)
returns table
as
return
(
	select imagename,note
	from image
	where qid=@qid
);
GO
