CREATE TABLE [CourseMapSyllabus] (
  [CourseId] int,
  [SyllabusId] int,
  [CreateDate] datetime,
  [CreateBy] int,
  [UpdateDate] datetime,
  [UpdateBy] int
)
GO

alter procedure CourseMapSyllabus_List(
@CourseId int
) as begin
select CourseId, SyllabusId, CreateDate from CourseMapSyllabus
end

CourseMapSyllabus_List @CourseId = 0

create procedure CourseMapSyllabus_FindById(
@CourseId int
) as begin
select SyllabusId, CreateDate from CourseMapSyllabus
where CourseId = @CourseId
end

create procedure CourseMapSyllabus_Add(
@SyllabusId int,
@CreateDate datetime,
@CreateBy int
)
as
begin
insert into CourseMapSyllabus(SyllabusId, CreateDate, CreateBy)
values(@SyllabusId, @CreateDate, @CreateBy)
select 'success' as status, 'Course Syllabus Mapped Successfully' as message
end


alter procedure CourseMapSyllabus_Update(
@CourseId int,
@SyllabusId int,
@UpdateDate datetime,
@UpdateBy int
)
as
begin
update CourseMapSyllabus
set SyllabusId = @SyllabusId, UpdateDate = @UpdateDate, UpdateBy = @UpdateBy
where CourseId = @CourseId
select 'success' as status, 'Syllabus Update Successfully' as message
end


create procedure CourseMapSyllabus_Delete(@CourseId int) 
as delete CourseMapSyllabus
where CourseId = @CourseId
select 'success' as status, 'Syllabus Deleted Successfully' as message