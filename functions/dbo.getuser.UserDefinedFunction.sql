USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[getuser]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[getuser]
GO
/****** Object:  UserDefinedFunction [dbo].[getuser]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[getuser](@name varchar(50) )
returns table
as
return
(
	select top 1 id 
	from users
	where name=@name
);
GO
