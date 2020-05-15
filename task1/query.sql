-- 1 query

SELECT
  student.first_name,
  student.last_name
FROM student
  JOIN exam_result exam ON student.id = exam.student_id
WHERE exam.result >= 4
ORDER BY result DESC;

-- 2 query

SELECT COUNT(student.id) AS 'Students who pass the exam with 4 and 5'
FROM student
  JOIN exam_result exam ON student.id = exam.student_id
WHERE exam.result >= 4;

-- 3 query

SELECT COUNT(student_result.id) AS 'Students who pass without exam'
FROM student_result;

-- 4 query

SELECT AVG(exam_result.result) AS 'Average mark on subject "SUBD"'
FROM exam_result
WHERE training_course_id = (
  SELECT tc.id
  FROM training_course tc
  WHERE tc.course_name = 'SUBD'
);

-- 5 query

-- first variant
SELECT
  student.first_name,
  student.last_name
FROM student
WHERE student.id NOT IN (
  SELECT student_result.student_id
  FROM student_result
  WHERE student_result.training_course_id = (
    SELECT id
    FROM training_course
    WHERE training_course.course_name = 'Graph Theory'
  )
  UNION
  SELECT exam_result.student_id
  FROM exam_result
  WHERE exam_result.training_course_id = (
    SELECT id
    FROM training_course
    WHERE training_course.course_name = 'Graph Theory'
  )
);

-- second variant

SELECT
  student.first_name,
  student.last_name
FROM student
WHERE student.id NOT IN (
  SELECT student_result.student_id
  FROM student_result
  WHERE student_result.training_course_id = (
    SELECT id
    FROM training_course
    WHERE training_course.course_name = 'Graph Theory'
          AND student_result.result >= 3
  )
  UNION
  SELECT exam_result.student_id
  FROM exam_result
  WHERE exam_result.training_course_id = (
    SELECT id
    FROM training_course
    WHERE training_course.course_name = 'Graph Theory'
          AND exam_result.result >= 3
  )
);

-- 6 query

SELECT lecturer.id
FROM lecturer
  JOIN training_course_lecturer course on lecturer.id = course.lecturer_id
GROUP BY lecturer.id
HAVING COUNT(lecturer.id) > 1;

-- 7 query

SELECT
  exam.student_id,
  student.last_name
FROM exam_result AS exam
  LEFT JOIN student on exam.student_id = student.id
GROUP BY exam.student_id, exam.training_course_id
HAVING COUNT(exam.student_id) > 1;

-- 8 query

SELECT
  student.first_name,
  student.last_name
FROM student
  RIGHT JOIN exam_result exam on student.id = exam.student_id
GROUP BY exam.student_id
ORDER BY MAX(exam.result) DESC
LIMIT 5;

-- 9 query

SELECT lecturer.last_name
FROM lecturer
  RIGHT JOIN exam_result result on lecturer.id = result.lecturer_id
GROUP BY lecturer.last_name
ORDER BY result.result DESC
LIMIT 1;

-- 10 query

SELECT
  DATE_FORMAT(exam_result.date_exam, '%Y') AS 'Year',
  AVG(exam_result.result)                  AS 'Average mark'
FROM exam_result
GROUP BY DATE_FORMAT(exam_result.date_exam, '%Y')
ORDER BY DATE_FORMAT(exam_result.date_exam, '%Y') DESC;
