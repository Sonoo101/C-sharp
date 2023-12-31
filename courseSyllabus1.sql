USE [LearningManagement_Local]
GO
/****** Object:  Table [dbo].[CourseSyllabus]    Script Date: 8/8/2023 10:05:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseSyllabus](
	[SyllabusId] [int] IDENTITY(1,1) NOT NULL,
	[SyllabusTitle] [nvarchar](500) NULL,
	[ParentId] [int] NULL,
	[IsActive] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SyllabusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CourseSyllabus_Add]    Script Date: 8/8/2023 10:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CourseSyllabus_Add](
@SyllabusTitle nvarchar(500),
@ParentId int,
@IsActive bit,
@CreateDate datetime,
@CreateBy int
)
as
begin
insert into CourseSyllabus(SyllabusTitle, ParentId, IsActive, CreateDate, CreateBy)
values(@SyllabusTitle, @ParentId, @IsActive, @CreateDate, @CreateBy)
select 'success' as status, 'Syllabus Add Successfully' as message
end
GO
/****** Object:  StoredProcedure [dbo].[CourseSyllabus_Delete]    Script Date: 8/8/2023 10:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CourseSyllabus_Delete](@SyllabusId int) 
as delete CourseSyllabus
where SyllabusId = @SyllabusId
GO
/****** Object:  StoredProcedure [dbo].[CourseSyllabus_FindById]    Script Date: 8/8/2023 10:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CourseSyllabus_FindById](
@SyllabusId int
) as begin
select SyllabusId, SyllabusTitle, ParentId, IsActive, CreateDate from CourseSyllabus
where SyllabusId = @SyllabusId
end
GO
/****** Object:  StoredProcedure [dbo].[CourseSyllabus_List]    Script Date: 8/8/2023 10:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CourseSyllabus_List](
@SyllabusId int
) as begin
select SyllabusId, SyllabusTitle, ParentId, IsActive, CreateDate from CourseSyllabus
end
GO
/****** Object:  StoredProcedure [dbo].[CourseSyllabus_Update]    Script Date: 8/8/2023 10:05:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CourseSyllabus_Update](
@SyllabusId int,
@SyllabusTitle nvarchar(500),
@ParentId int,
@IsActive bit,
@UpdateDate datetime,
@UpdateBy int
)
as
begin
update CourseSyllabus
set SyllabusTitle = @SyllabusTitle, ParentId = @ParentId, IsActive = @IsActive, UpdateDate = @UpdateDate, UpdateBy = @UpdateBy
where SyllabusId =@SyllabusId
select 'success' as status, 'Syllabus Update Successfully' as message
end
GO
