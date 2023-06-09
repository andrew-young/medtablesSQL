USE [master]
GO
/****** Object:  Database [question]    Script Date: 2023-04-17 11:01:36 PM ******/
CREATE DATABASE [question]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'question', FILENAME = N'D:\Program Files (x86)\New folder\MSSQL15.MSSQLSERVER\MSSQL\DATA\question.mdf' , SIZE = 7360KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'question_log', FILENAME = N'D:\Program Files (x86)\New folder\MSSQL15.MSSQLSERVER\MSSQL\DATA\question_log.ldf' , SIZE = 2880KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [question] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [question].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [question] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [question] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [question] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [question] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [question] SET ARITHABORT OFF 
GO
ALTER DATABASE [question] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [question] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [question] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [question] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [question] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [question] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [question] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [question] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [question] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [question] SET  DISABLE_BROKER 
GO
ALTER DATABASE [question] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [question] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [question] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [question] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [question] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [question] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [question] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [question] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [question] SET  MULTI_USER 
GO
ALTER DATABASE [question] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [question] SET DB_CHAINING OFF 
GO
ALTER DATABASE [question] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [question] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [question] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [question] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'question', N'ON'
GO
ALTER DATABASE [question] SET QUERY_STORE = OFF
GO
USE [question]
GO
/****** Object:  User [qserver]    Script Date: 2023-04-17 11:01:37 PM ******/
CREATE USER [qserver] FOR LOGIN [qserver] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [qserver]
GO
/****** Object:  Table [dbo].[image]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[qid] [int] NOT NULL,
	[imagename] [varchar](100) NULL,
	[note] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [clust_images]    Script Date: 2023-04-17 11:01:37 PM ******/
CREATE CLUSTERED INDEX [clust_images] ON [dbo].[image]
(
	[qid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[getimage]    Script Date: 2023-04-17 11:01:37 PM ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [pk_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[getuser]    Script Date: 2023-04-17 11:01:37 PM ******/
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
/****** Object:  Table [dbo].[test]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[userid] [int] NOT NULL,
 CONSTRAINT [pk_qgroup] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[gettestbyuserid]    Script Date: 2023-04-17 11:01:37 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[gettest]    Script Date: 2023-04-17 11:01:37 PM ******/
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
/****** Object:  Table [dbo].[question]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[qid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[text] [varchar](max) NOT NULL,
 CONSTRAINT [pk_question] PRIMARY KEY CLUSTERED 
(
	[qid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[gettestanswers]    Script Date: 2023-04-17 11:01:37 PM ******/
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
/****** Object:  Table [dbo].[tablecolumn]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tablecolumn](
	[qid] [int] NOT NULL,
	[cid] [int] NOT NULL,
	[text] [nvarchar](max) NULL,
 CONSTRAINT [pk_column] PRIMARY KEY CLUSTERED 
(
	[qid] ASC,
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[gettablecol]    Script Date: 2023-04-17 11:01:37 PM ******/
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
/****** Object:  Table [dbo].[tablerow]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tablerow](
	[qid] [int] NOT NULL,
	[rid] [int] NOT NULL,
	[text] [nvarchar](max) NULL,
 CONSTRAINT [PK_rows] PRIMARY KEY CLUSTERED 
(
	[qid] ASC,
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[gettablerow]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[gettablerow](@qid int)
returns table
as
return
(
	select rid,text
	from tablerow
	where qid=@qid
);
GO
/****** Object:  UserDefinedFunction [dbo].[getquestionbyuserid]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create FUNCTION [dbo].[getquestionbyuserid](@userid int)
returns table
as
return
(
	select q.text,q.qid--,q.userid
	from question q
	where q.userid=@userid
);
GO
/****** Object:  UserDefinedFunction [dbo].[getquestion]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create FUNCTION [dbo].[getquestion](@qid int)
returns table
as
return
(
	select q.text,q.qid,q.userid
	from question q
	where q.qid=@qid
);
GO
/****** Object:  Table [dbo].[testquestion]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[testquestion](
	[tid] [int] NOT NULL,
	[qid] [int] NOT NULL,
 CONSTRAINT [pk_groupquestion] PRIMARY KEY CLUSTERED 
(
	[tid] ASC,
	[qid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[gettestquestion]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create FUNCTION [dbo].[gettestquestion](@tid int)
returns table
as
return
(
	select q.qid,q.text,q.userid
	from test t
		inner join testquestion tq on t.tid = tq.tid
		inner join question q on q.qid=tq.qid
	where t.tid=@tid 
);
GO
/****** Object:  UserDefinedFunction [dbo].[gettestimage]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





create FUNCTION [dbo].[gettestimage](@tid int)
returns table
as
return
(
	select img.qid, imagename, note
	from test t
		inner join testquestion tq on t.tid=tq.tid
		inner join image img on img.qid=tq.qid
	where t.tid=@tid 
);
GO
/****** Object:  Table [dbo].[tableanswer]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableanswer](
	[qid] [int] NOT NULL,
	[rid] [int] NOT NULL,
	[cid] [int] NOT NULL,
	[aid] [int] NOT NULL,
 CONSTRAINT [pk_tableanswer] PRIMARY KEY CLUSTERED 
(
	[qid] ASC,
	[rid] ASC,
	[cid] ASC,
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tableanswertext]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tableanswertext](
	[qid] [int] NOT NULL,
	[aid] [int] NOT NULL,
	[text] [nvarchar](max) NULL,
 CONSTRAINT [pk_tableanswertext] PRIMARY KEY CLUSTERED 
(
	[qid] ASC,
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[gettesttableanswer]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






create FUNCTION [dbo].[gettesttableanswer](@tid int)
returns table
as
return
(
	select ta.qid,ta.aid,ta.cid,ta.rid,tat.text
	from test t
		inner join testquestion tq on t.tid = tq.tid
		inner join tableanswer ta on ta.qid = tq.qid
		inner join tableanswertext tat on ta.aid=tat.aid and ta.qid=tat.qid
	where t.tid=@tid
);
GO
/****** Object:  UserDefinedFunction [dbo].[getqestionsbytest]    Script Date: 2023-04-17 11:01:37 PM ******/
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
/****** Object:  UserDefinedFunction [dbo].[gettesttablecol]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create FUNCTION [dbo].[gettesttablecol](@tid int)
returns table
as
return
(
	select tc.qid,tc.cid,tc.text
	from test t
		inner join testquestion tq on t.tid = tq.tid
		inner join tablecolumn tc on tc.qid=tq.qid
	where t.tid=@tid 
);
GO
/****** Object:  UserDefinedFunction [dbo].[gettableanswer]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create FUNCTION [dbo].[gettableanswer](@qid int)
returns table
as
return
(
	select cid,rid,tat.text
	from tableanswer ta
		inner join tableanswertext tat on ta.aid=tat.aid and ta.qid=tat.qid
	where ta.qid=@qid
);
GO
/****** Object:  Table [dbo].[tablequestion]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tablequestion](
	[qid] [int] NOT NULL,
	[randomcolumnorder] [bit] NOT NULL,
	[randomroworder] [bit] NOT NULL,
	[dragrow] [bit] NOT NULL,
	[dragcol] [bit] NOT NULL,
	[swap] [bit] NOT NULL,
 CONSTRAINT [pk_tablequestion] PRIMARY KEY CLUSTERED 
(
	[qid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[gettesttablequestion]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





create FUNCTION [dbo].[gettesttablequestion](@tid int)
returns table
as
return
(
	select tq.qid, tq.randomcolumnorder as randomcol, tq.randomroworder as randomrow, tq.dragrow as dragrow, tq.dragcol as dragcol,tq.swap
	from test t
		inner join testquestion testq on t.tid = testq.tid
		inner join tablequestion tq on tq.qid=testq.qid
	where t.tid=@tid 
);
GO
/****** Object:  UserDefinedFunction [dbo].[gettesttablerow]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create FUNCTION [dbo].[gettesttablerow](@tid int)
returns table
as
return
(
	select tr.qid,tr.rid,tr.text
	from test t
		inner join testquestion tq on t.tid = tq.tid
		inner join tablerow tr on tr.qid=tq.qid
	where t.tid=@tid 
);
GO
/****** Object:  UserDefinedFunction [dbo].[gettestquestionbyuserid]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create FUNCTION [dbo].[gettestquestionbyuserid](@userid int)
returns table
as
return
(
	select t.tid,tq.qid,q.text,q.userid --q.userid may be diffrent from @userid
	from test t
		inner join testquestion tq on t.tid=tq.tid
		inner join question q on tq.qid=q.qid
	where t.userid=@userid
);
GO
/****** Object:  UserDefinedFunction [dbo].[gettablequestion]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





create FUNCTION [dbo].[gettablequestion](@qid int)
returns table
as
return
(
	select t.qid, q.userid,q.text, t.randomroworder as randomrow , t.randomcolumnorder as randomcol
	, t.dragrow, t.dragcol,t.swap
	from tablequestion t
		inner join question q on t.qid=q.qid
	where t.qid=@qid
);
GO
/****** Object:  UserDefinedFunction [dbo].[getqtype]    Script Date: 2023-04-17 11:01:37 PM ******/
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
/****** Object:  Index [ix_qgroup]    Script Date: 2023-04-17 11:01:37 PM ******/
CREATE NONCLUSTERED INDEX [ix_qgroup] ON [dbo].[test]
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_users]    Script Date: 2023-04-17 11:01:37 PM ******/
CREATE NONCLUSTERED INDEX [ix_users] ON [dbo].[users]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tablequestion] ADD  DEFAULT ((0)) FOR [swap]
GO
/****** Object:  StoredProcedure [dbo].[addimage]    Script Date: 2023-04-17 11:01:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[addquestion]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[addquestion](@text varchar(max),@userid int,@qid int output )
	AS
BEGIN

	insert into question.dbo.question (userid,text) 
	values(@userid,@text)

	select @qid=@@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[addtableanswer]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[addtableanswer](@qid int,@rid int,@cid int,@aid int)
	AS
BEGIN
	insert into question.dbo.tableanswer (qid,rid,cid,aid)
	values(@qid,@rid ,@cid ,@aid)
end
GO
/****** Object:  StoredProcedure [dbo].[addtableanswertext]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[addtableanswertext](@qid int,@aid int,@text nvarchar(max))
	AS
BEGIN
	insert into question.dbo.tableanswertext (qid,aid,text)
	values(@qid ,@aid,@text)
end
GO
/****** Object:  StoredProcedure [dbo].[addtablecolumn]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[addtablecolumn](@qid int,@cid int,@text nvarchar(max))
	AS
BEGIN
	insert into question.dbo.tablecolumn (qid,cid,text)
	values(@qid ,@cid,@text)
end
GO
/****** Object:  StoredProcedure [dbo].[addtablequestion]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






create procedure [dbo].[addtablequestion](@qid int , @randomrow bit, @randomcol bit, @dragrow bit, @dragcol bit, @swap bit )
	AS
BEGIN

	insert into question.dbo.tablequestion (qid,randomroworder ,randomcolumnorder ,dragrow ,dragcol,swap) 
	values(@qid,@randomrow,@randomcol ,@dragrow ,@dragcol, @swap)

	
end
GO
/****** Object:  StoredProcedure [dbo].[addtablerow]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[addtablerow](@qid int,@rid int,@text nvarchar(max))
	AS
BEGIN
	insert into question.dbo.tablerow (qid,rid,text)
	values(@qid ,@rid,@text)
end
GO
/****** Object:  StoredProcedure [dbo].[addtest]    Script Date: 2023-04-17 11:01:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[addtestquestion]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[addtestquestion](@qid int,@tid int)
	AS
BEGIN
	insert into question.dbo.testquestion (qid,tid)
	values(@qid,@tid)
end
GO
/****** Object:  StoredProcedure [dbo].[adduser]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[adduser](@name varchar(50),@id int output )
	AS
BEGIN
	begin transaction
		if not exists(select * from dbo.getuser(@name))
		begin
			insert into users (name)
			values(@name)
			select @id=@@IDENTITY
		end
		else
		begin
			select @id=id from dbo.getuser(@name)
		end
	COMMIT transaction
end
GO
/****** Object:  StoredProcedure [dbo].[fullremovetablequestion]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create procedure [dbo].[fullremovetablequestion] (@qid int)
	AS
BEGIN
	delete from question.dbo.tableanswer
	where qid=@qid

	delete from question.dbo.tableanswertext
	where qid=@qid

	delete from question.dbo.tablequestion
	where qid=@qid

	delete from question.dbo.tablerow
	where qid=@qid

	delete from question.dbo.tablecolumn
	where qid=@qid

	delete from question.dbo.image
	where qid=@qid

	
	delete from question.dbo.question
	where qid=@qid

	delete from question.dbo.testquestion
	where qid=@qid

	
	
END
GO
/****** Object:  StoredProcedure [dbo].[removeimage]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[removeimage] (@qid int)
	AS
BEGIN
	delete from question.dbo.image
	where qid=@qid
END
GO
/****** Object:  StoredProcedure [dbo].[removequestion]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[removequestion](@questionid int)
	AS
BEGIN
	delete from question.dbo.question
	where id=@questionid

	delete from question.dbo.answer
	where questionid=@questionid

	delete from question.dbo.groupquestion
	where questionid=@questionid 
end
GO
/****** Object:  StoredProcedure [dbo].[removetablequestion]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[removetablequestion] (@qid int)
	AS
BEGIN
	delete from question.dbo.tableanswer
	where qid=@qid

	delete from question.dbo.tableanswertext
	where qid=@qid

	delete from question.dbo.tablequestion
	where qid=@qid

	delete from question.dbo.tablerow
	where qid=@qid

	delete from question.dbo.tablecolumn
	where qid=@qid

	delete from question.dbo.image
	where qid=@qid
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[removetest]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[removetest](@tid int)
	AS
BEGIN
	delete from question.dbo.test
	where tid=@tid

	delete from question.dbo.testquestion
	where tid=@tid
end
GO
/****** Object:  StoredProcedure [dbo].[removetestquestion]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[removetestquestion](@tid int)
	AS
BEGIN
	delete from question.dbo.testquestion
	where tid=@tid
END
GO
/****** Object:  StoredProcedure [dbo].[renametest]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[renametest] (@tid int,@name varchar(100))
	AS
BEGIN
	update question.dbo.test
	set name=@name
	where tid=@tid
END
GO
/****** Object:  StoredProcedure [dbo].[updatequestion]    Script Date: 2023-04-17 11:01:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[updatequestion](@qid int, @text varchar(max),@userid int )
	AS
BEGIN

	update question.dbo.question 
	set userid=@userid
		,text=@text
	where qid = @qid

end
GO
USE [master]
GO
ALTER DATABASE [question] SET  READ_WRITE 
GO
