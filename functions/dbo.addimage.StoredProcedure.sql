USE [question]
GO
/****** Object:  StoredProcedure [dbo].[addimage]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP PROCEDURE [dbo].[addimage]
GO
/****** Object:  StoredProcedure [dbo].[addimage]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[addimage](@qid int,@imagename varchar(max) ,@note varchar(max))
	AS
BEGIN
	insert into question.dbo.image (qid,imagename,note)
	values(@qid ,@imagename,@note)
end
GO
