USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[gettestbyuserid]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[gettestbyuserid]
GO
/****** Object:  UserDefinedFunction [dbo].[gettestbyuserid]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[gettestbyuserid](@uid int)
returns table
as
return
(
	select t.tid,t.name
	from test t
		--inner join users u on g.userid=u.id
	where t.userid=@uid
);
GO
