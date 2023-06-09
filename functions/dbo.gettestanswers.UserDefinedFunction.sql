USE [question]
GO
/****** Object:  UserDefinedFunction [dbo].[gettestanswers]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP FUNCTION [dbo].[gettestanswers]
GO
/****** Object:  UserDefinedFunction [dbo].[gettestanswers]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[gettestanswers](@testid int)
returns table
as
return
(
	select q.id as questionid,a.answer,a.id as answerid,a.label,a.num
	from test t
		inner join testgroup tg on t.id = tg.testid
		inner join qgroup g on g.id=tg.groupid
		inner join groupquestion gq on gq.groupid=g.id
		inner join question q on q.id=gq.questionid
		inner join answer a on a.questionid=q.id
	where t.id=@testid 
);
GO
