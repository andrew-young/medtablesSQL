USE [question]
GO
/****** Object:  StoredProcedure [dbo].[addtest]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP PROCEDURE [dbo].[addtest]
GO
/****** Object:  StoredProcedure [dbo].[addtest]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[addtest](@name varchar(50),@userid int,@tid int output )
	AS
BEGIN
	begin transaction
		if not exists(select tid from dbo.test where name=@name and userid=@userid)
		begin
			
			begin
				insert into test (name,userid)
				values(@name,@userid)
				end
				select @tid=@@IDENTITY
			end
		else
		begin
			select @tid=(select top 1 tid from dbo.test where name=@name and userid=@userid)
		end
	COMMIT transaction
end
GO
