USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[gettest]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[gettest]
GO
/****** Object:  UserDefinedFunction [dbo].[gettest]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create FUNCTION [dbo].[gettest](@tid int)
returns table
as
return
(
	select t.name,t.userid
	from test t
		--inner join users u on g.userid=u.id
	where t.tid=@tid
);
GO
