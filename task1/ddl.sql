create table lecturer
(
  id         int auto_increment
    primary key,
  first_name varchar(50) null,
  last_name  varchar(50) null
);

create table student
(
  id         int auto_increment
    primary key,
  first_name varchar(50) null,
  last_name  varchar(50) null
);

create table training_course
(
  id          int auto_increment
    primary key,
  course_name varchar(50) null
);

create table exam_result
(
  id                 int auto_increment
    primary key,
  student_id         int  null,
  training_course_id int  null,
  lecturer_id        int  null,
  result             int  null,
  date_exam          date null,
  constraint exam_result_ibfk_1
  foreign key (student_id) references student (id),
  constraint exam_result_ibfk_2
  foreign key (training_course_id) references training_course (id),
  constraint exam_result_ibfk_3
  foreign key (lecturer_id) references lecturer (id)
);

create index lecturer_id
  on exam_result (lecturer_id);

create index student_id
  on exam_result (student_id);

create index training_course_id
  on exam_result (training_course_id);

create table student_result
(
  id                 int auto_increment
    primary key,
  student_id         int  null,
  training_course_id int  null,
  lecturer_id        int  null,
  result             int  null,
  date_exam          date null,
  constraint student_result_ibfk_1
  foreign key (student_id) references student (id),
  constraint student_result_ibfk_2
  foreign key (training_course_id) references training_course (id),
  constraint student_result_ibfk_3
  foreign key (lecturer_id) references lecturer (id)
);

create index lecturer_id
  on student_result (lecturer_id);

create index student_id
  on student_result (student_id);

create index training_course_id
  on student_result (training_course_id);

create table student_training
(
  student_id         int not null,
  training_course_id int not null,
  constraint student_training_ibfk_1
  foreign key (student_id) references student (id),
  constraint student_training_ibfk_2
  foreign key (training_course_id) references training_course (id)
);

create index student_id
  on student_training (student_id);

create index training_course_id
  on student_training (training_course_id);

create table training_course_lecturer
(
  training_course_id int not null,
  lecturer_id        int not null,
  constraint training_course_lecturer_ibfk_1
  foreign key (training_course_id) references training_course (id),
  constraint training_course_lecturer_ibfk_2
  foreign key (lecturer_id) references lecturer (id)
);

create index lecturer_id
  on training_course_lecturer (lecturer_id);

create index training_course_id
  on training_course_lecturer (training_course_id);

