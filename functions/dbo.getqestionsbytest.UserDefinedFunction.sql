USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[getqestionsbytest]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[getqestionsbytest]
GO
/****** Object:  UserDefinedFunction [dbo].[getqestionsbytest]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[getqestionsbytest](@testid int)
returns table
as
return
(
	select t.id, t.name,q.question,q.qtypeid
	from test t
		inner join testgroup tg on t.id = tg.testid
		inner join qgroup g on g.id=tg.groupid
		inner join groupquestion gq on gq.groupid=g.id
		inner join question q on q.id=gq.questionid
	where t.id=@testid 
);
GO
