USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[getqtype]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[getqtype]
GO
/****** Object:  UserDefinedFunction [dbo].[getqtype]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[getqtype]()
returns table
as
return
(
	select t.id, t.name
	from qtype t
);
GO
