-- ============================================================
-- SCHOOL DATABASE - Architecture (Tables, Constraints, Data)
-- ============================================================

-- ============================================================
--  SCHOOL DATABASE - Practice SQL Script
--  Compatible with: MySQL, PostgreSQL, SQLite
--  Tables: departments, teachers, students, courses,
--          enrollments, grades, attendance, exams
-- ============================================================

Create DATABASE school;
-- ============================================================
-- 1. DEPARTMENTS
-- ============================================================
CREATE TABLE departments (
    department_id   INT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    head_teacher_id INT,          -- filled after teachers are inserted
    building        VARCHAR(50)
);


-- ============================================================
-- 2. TEACHERS
-- ============================================================
CREATE TABLE teachers (
    teacher_id    INT PRIMARY KEY,
    first_name    VARCHAR(50)  NOT NULL,
    last_name     VARCHAR(50)  NOT NULL,
    email         VARCHAR(100) UNIQUE,
    phone         VARCHAR(20),
    department_id INT,
    hire_date     DATE,
    salary        DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);


-- ============================================================
-- 3. STUDENTS
-- ============================================================
CREATE TABLE students (
    student_id   INT PRIMARY KEY,
    first_name   VARCHAR(50)  NOT NULL,
    last_name    VARCHAR(50)  NOT NULL,
    email        VARCHAR(100) UNIQUE,
    phone        VARCHAR(20),
    date_of_birth DATE,
    gender       CHAR(1),          -- 'M' or 'F'
    grade_level  INT,              -- 9, 10, 11, 12
    enroll_date  DATE,
    gpa          DECIMAL(3,2)
);


-- ============================================================
-- 4. COURSES
-- ============================================================
CREATE TABLE courses (
    course_id     INT PRIMARY KEY,
    course_code   VARCHAR(20) UNIQUE,
    title         VARCHAR(100) NOT NULL,
    department_id INT,
    teacher_id    INT,
    credits       INT,
    max_students  INT,
    room          VARCHAR(20),
    schedule      VARCHAR(50),     -- e.g. 'Mon/Wed 09:00'
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (teacher_id)    REFERENCES teachers(teacher_id)
);


-- ============================================================
-- 5. ENROLLMENTS  (which student is in which course)
-- ============================================================
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id    INT,
    course_id     INT,
    enroll_date   DATE,
    status        VARCHAR(20) DEFAULT 'active', -- active / dropped / completed
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id)  REFERENCES courses(course_id)
);


-- ============================================================
-- 6. GRADES  (per assignment / quiz / test)
-- ============================================================
CREATE TABLE grades (
    grade_id      INT PRIMARY KEY,
    enrollment_id INT,
    assignment    VARCHAR(100),
    category      VARCHAR(30),     -- homework / quiz / midterm / final
    score         DECIMAL(5,2),
    max_score     DECIMAL(5,2),
    grade_date    DATE,
    FOREIGN KEY (enrollment_id) REFERENCES enrollments(enrollment_id)
);


-- ============================================================
-- 7. ATTENDANCE
-- ============================================================
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    student_id    INT,
    course_id     INT,
    attend_date   DATE,
    status        VARCHAR(10),     -- present / absent / late
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id)  REFERENCES courses(course_id)
);


-- ============================================================
-- 8. EXAMS
-- ============================================================
CREATE TABLE exams (
    exam_id    INT PRIMARY KEY,
    course_id  INT,
    exam_type  VARCHAR(30),        -- midterm / final / quiz
    exam_date  DATE,
    room       VARCHAR(20),
    total_marks INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


-- ============================================================
-- INSERT DATA
-- ============================================================

-- DEPARTMENTS
INSERT INTO departments (department_id, name, building) VALUES
(1, 'Mathematics',        'Block A'),
(2, 'Science',            'Block B'),
(3, 'English',            'Block C'),
(4, 'History',            'Block A'),
(5, 'Computer Science',   'Block D'),
(6, 'Physical Education', 'Gym');

-- TEACHERS  (30 rows)
INSERT INTO teachers (teacher_id, first_name, last_name, email, phone, department_id, hire_date, salary) VALUES
(1,  'Ahmed',   'Khan',      'a.khan@school.edu',      '0300-1111001', 1, '2015-08-01', 75000),
(2,  'Sara',    'Malik',     's.malik@school.edu',     '0300-1111002', 1, '2017-01-15', 70000),
(3,  'Omar',    'Sheikh',    'o.sheikh@school.edu',    '0300-1111003', 2, '2014-03-20', 80000),
(4,  'Nadia',   'Hussain',   'n.hussain@school.edu',   '0300-1111004', 2, '2019-09-01', 68000),
(5,  'Bilal',   'Chaudhry',  'b.chaudhry@school.edu',  '0300-1111005', 3, '2016-06-10', 72000),
(6,  'Amna',    'Iqbal',     'a.iqbal@school.edu',     '0300-1111006', 3, '2020-01-05', 65000),
(7,  'Tariq',   'Siddiqui',  't.siddiqui@school.edu',  '0300-1111007', 4, '2013-11-11', 78000),
(8,  'Hina',    'Rehman',    'h.rehman@school.edu',    '0300-1111008', 4, '2018-04-22', 69000),
(9,  'Usman',   'Butt',      'u.butt@school.edu',      '0300-1111009', 5, '2021-08-01', 82000),
(10, 'Zara',    'Anwar',     'z.anwar@school.edu',     '0300-1111010', 5, '2022-02-14', 76000),
(11, 'Kamran',  'Ali',       'k.ali@school.edu',       '0300-1111011', 6, '2015-07-30', 60000),
(12, 'Farah',   'Zahid',     'f.zahid@school.edu',     '0300-1111012', 1, '2023-08-01', 63000),
(13, 'Imran',   'Yousaf',    'i.yousaf@school.edu',    '0300-1111013', 2, '2012-05-18', 85000),
(14, 'Sana',    'Baig',      's.baig@school.edu',      '0300-1111014', 3, '2016-09-09', 71000),
(15, 'Hamza',   'Mirza',     'h.mirza@school.edu',     '0300-1111015', 4, '2020-11-01', 67000);

-- Update department heads
UPDATE departments SET head_teacher_id = 1  WHERE department_id = 1;
UPDATE departments SET head_teacher_id = 3  WHERE department_id = 2;
UPDATE departments SET head_teacher_id = 5  WHERE department_id = 3;
UPDATE departments SET head_teacher_id = 7  WHERE department_id = 4;
UPDATE departments SET head_teacher_id = 9  WHERE department_id = 5;
UPDATE departments SET head_teacher_id = 11 WHERE department_id = 6;

-- STUDENTS  (40 rows)
INSERT INTO students (student_id, first_name, last_name, email, phone, date_of_birth, gender, grade_level, enroll_date, gpa) VALUES
(1,  'Ali',      'Hassan',   'ali.h@students.edu',    '0311-2221001', '2007-03-12', 'M', 11, '2021-09-01', 3.80),
(2,  'Ayesha',   'Nasir',    'ayesha.n@students.edu', '0311-2221002', '2007-07-22', 'F', 11, '2021-09-01', 3.95),
(3,  'Zain',     'Ahmed',    'zain.a@students.edu',   '0311-2221003', '2008-01-05', 'M', 10, '2022-09-01', 3.20),
(4,  'Hira',     'Qureshi',  'hira.q@students.edu',   '0311-2221004', '2008-11-30', 'F', 10, '2022-09-01', 3.60),
(5,  'Fahad',    'Raza',     'fahad.r@students.edu',  '0311-2221005', '2006-05-17', 'M', 12, '2020-09-01', 2.90),
(6,  'Maryam',   'Tariq',    'maryam.t@students.edu', '0311-2221006', '2006-09-08', 'F', 12, '2020-09-01', 3.75),
(7,  'Hamza',    'Sohail',   'hamza.s@students.edu',  '0311-2221007', '2009-02-28', 'M',  9, '2023-09-01', 3.10),
(8,  'Fatima',   'Aziz',     'fatima.a@students.edu', '0311-2221008', '2009-06-14', 'F',  9, '2023-09-01', 3.85),
(9,  'Bilal',    'Farooq',   'bilal.f@students.edu',  '0311-2221009', '2007-12-01', 'M', 11, '2021-09-01', 2.75),
(10, 'Sana',     'Mehmood',  'sana.m@students.edu',   '0311-2221010', '2007-04-19', 'F', 11, '2021-09-01', 3.50),
(11, 'Usman',    'Ghani',    'usman.g@students.edu',  '0311-2221011', '2008-08-08', 'M', 10, '2022-09-01', 3.30),
(12, 'Noor',     'Jabbar',   'noor.j@students.edu',   '0311-2221012', '2008-03-25', 'F', 10, '2022-09-01', 3.70),
(13, 'Saad',     'Liaqat',   'saad.l@students.edu',   '0311-2221013', '2006-10-10', 'M', 12, '2020-09-01', 3.15),
(14, 'Rimsha',   'Imtiaz',   'rimsha.i@students.edu', '0311-2221014', '2006-01-31', 'F', 12, '2020-09-01', 3.90),
(15, 'Junaid',   'Waheed',   'junaid.w@students.edu', '0311-2221015', '2009-07-07', 'M',  9, '2023-09-01', 2.80),
(16, 'Zara',     'Sultan',   'zara.s@students.edu',   '0311-2221016', '2009-11-20', 'F',  9, '2023-09-01', 3.40),
(17, 'Hassan',   'Alvi',     'hassan.a@students.edu', '0311-2221017', '2007-02-14', 'M', 11, '2021-09-01', 3.60),
(18, 'Iqra',     'Noman',    'iqra.n@students.edu',   '0311-2221018', '2007-09-03', 'F', 11, '2021-09-01', 3.25),
(19, 'Daniyal',  'Rao',      'daniyal.r@students.edu','0311-2221019', '2008-05-22', 'M', 10, '2022-09-01', 2.95),
(20, 'Mahnoor',  'Shahid',   'mahnoor.s@students.edu','0311-2221020', '2008-12-12', 'F', 10, '2022-09-01', 3.80),
(21, 'Talha',    'Rashid',   'talha.r@students.edu',  '0311-2221021', '2006-03-03', 'M', 12, '2020-09-01', 3.50),
(22, 'Areeba',   'Nawaz',    'areeba.n@students.edu', '0311-2221022', '2006-08-28', 'F', 12, '2020-09-01', 2.70),
(23, 'Faris',    'Zuberi',   'faris.z@students.edu',  '0311-2221023', '2009-04-16', 'M',  9, '2023-09-01', 3.55),
(24, 'Laiba',    'Kamal',    'laiba.k@students.edu',  '0311-2221024', '2009-10-09', 'F',  9, '2023-09-01', 3.20),
(25, 'Muzammil', 'Dar',      'muzammil.d@students.edu','0311-2221025','2007-06-27', 'M', 11, '2021-09-01', 3.45),
(26, 'Shanza',   'Rauf',     'shanza.r@students.edu', '0311-2221026', '2007-01-15', 'F', 11, '2021-09-01', 3.70),
(27, 'Asad',     'Javed',    'asad.j@students.edu',   '0311-2221027', '2008-09-09', 'M', 10, '2022-09-01', 3.00),
(28, 'Rabia',    'Waseem',   'rabia.w@students.edu',  '0311-2221028', '2008-07-04', 'F', 10, '2022-09-01', 3.85),
(29, 'Mohsin',   'Latif',    'mohsin.l@students.edu', '0311-2221029', '2006-12-20', 'M', 12, '2020-09-01', 2.60),
(30, 'Mehwish',  'Pervaiz',  'mehwish.p@students.edu','0311-2221030', '2006-06-06', 'F', 12, '2020-09-01', 3.35),
(31, 'Osama',    'Tahir',    'osama.t@students.edu',  '0311-2221031', '2009-03-18', 'M',  9, '2023-09-01', 3.65),
(32, 'Hifza',    'Bajwa',    'hifza.b@students.edu',  '0311-2221032', '2009-08-25', 'F',  9, '2023-09-01', 3.10),
(33, 'Shahzaib', 'Gondal',   'shahzaib.g@students.edu','0311-2221033','2007-10-31', 'M', 11, '2021-09-01', 3.90),
(34, 'Khadija',  'Saleem',   'khadija.s@students.edu','0311-2221034', '2007-05-09', 'F', 11, '2021-09-01', 3.55),
(35, 'Faisal',   'Chohan',   'faisal.c@students.edu', '0311-2221035', '2008-02-02', 'M', 10, '2022-09-01', 2.85),
(36, 'Nimra',    'Asghar',   'nimra.a@students.edu',  '0311-2221036', '2008-04-17', 'F', 10, '2022-09-01', 3.40),
(37, 'Waqas',    'Hameed',   'waqas.h@students.edu',  '0311-2221037', '2006-07-14', 'M', 12, '2020-09-01', 3.20),
(38, 'Sumbul',   'Riaz',     'sumbul.r@students.edu', '0311-2221038', '2006-11-11', 'F', 12, '2020-09-01', 3.75),
(39, 'Waleed',   'Munir',    'waleed.m@students.edu', '0311-2221039', '2009-01-23', 'M',  9, '2023-09-01', 3.30),
(40, 'Hoorain',  'Jamil',    'hoorain.j@students.edu','0311-2221040', '2009-05-05', 'F',  9, '2023-09-01', 3.60);

-- COURSES  (12 courses)
INSERT INTO courses (course_id, course_code, title, department_id, teacher_id, credits, max_students, room, schedule) VALUES
(1,  'MATH101', 'Algebra I',              1, 1,  4, 30, 'A101', 'Mon/Wed 08:00'),
(2,  'MATH201', 'Calculus',               1, 2,  4, 25, 'A102', 'Tue/Thu 08:00'),
(3,  'SCI101',  'Biology',                2, 3,  4, 30, 'B101', 'Mon/Wed 10:00'),
(4,  'SCI201',  'Chemistry',              2, 4,  4, 25, 'B201', 'Tue/Thu 10:00'),
(5,  'ENG101',  'English Literature',     3, 5,  3, 35, 'C101', 'Mon/Wed 12:00'),
(6,  'ENG201',  'Creative Writing',       3, 6,  3, 30, 'C102', 'Tue/Thu 12:00'),
(7,  'HIST101', 'World History',          4, 7,  3, 35, 'A201', 'Mon/Wed 14:00'),
(8,  'HIST201', 'Pakistan Studies',       4, 8,  3, 30, 'A202', 'Tue/Thu 14:00'),
(9,  'CS101',   'Introduction to CS',     5, 9,  4, 25, 'D101', 'Mon/Wed 09:00'),
(10, 'CS201',   'Python Programming',     5, 10, 4, 20, 'D102', 'Tue/Thu 09:00'),
(11, 'PE101',   'Physical Education I',   6, 11, 2, 40, 'GYM1', 'Fri 08:00'),
(12, 'MATH301', 'Statistics',             1, 1,  4, 25, 'A103', 'Mon/Wed 11:00');

-- ENROLLMENTS  (students enrolled in courses)
INSERT INTO enrollments (enrollment_id, student_id, course_id, enroll_date, status) VALUES
-- Grade 12 students
(1,  5,  1,  '2024-09-01', 'active'),
(2,  5,  5,  '2024-09-01', 'active'),
(3,  5,  7,  '2024-09-01', 'active'),
(4,  6,  1,  '2024-09-01', 'active'),
(5,  6,  3,  '2024-09-01', 'active'),
(6,  6,  5,  '2024-09-01', 'active'),
(7,  13, 2,  '2024-09-01', 'active'),
(8,  13, 4,  '2024-09-01', 'active'),
(9,  13, 8,  '2024-09-01', 'active'),
(10, 14, 2,  '2024-09-01', 'active'),
(11, 14, 6,  '2024-09-01', 'active'),
(12, 14, 9,  '2024-09-01', 'active'),
(13, 21, 1,  '2024-09-01', 'active'),
(14, 21, 7,  '2024-09-01', 'active'),
(15, 21, 10, '2024-09-01', 'active'),
(16, 22, 3,  '2024-09-01', 'active'),
(17, 22, 5,  '2024-09-01', 'active'),
(18, 22, 11, '2024-09-01', 'active'),
-- Grade 11 students
(19, 1,  1,  '2024-09-01', 'active'),
(20, 1,  3,  '2024-09-01', 'active'),
(21, 1,  9,  '2024-09-01', 'active'),
(22, 2,  2,  '2024-09-01', 'active'),
(23, 2,  5,  '2024-09-01', 'active'),
(24, 2,  9,  '2024-09-01', 'active'),
(25, 9,  1,  '2024-09-01', 'active'),
(26, 9,  7,  '2024-09-01', 'active'),
(27, 9,  11, '2024-09-01', 'active'),
(28, 10, 3,  '2024-09-01', 'active'),
(29, 10, 5,  '2024-09-01', 'active'),
(30, 10, 8,  '2024-09-01', 'active'),
(31, 17, 2,  '2024-09-01', 'active'),
(32, 17, 4,  '2024-09-01', 'active'),
(33, 17, 10, '2024-09-01', 'active'),
(34, 18, 6,  '2024-09-01', 'active'),
(35, 18, 7,  '2024-09-01', 'active'),
(36, 18, 9,  '2024-09-01', 'active'),
-- Grade 10 students
(37, 3,  1,  '2024-09-01', 'active'),
(38, 3,  3,  '2024-09-01', 'active'),
(39, 3,  5,  '2024-09-01', 'active'),
(40, 4,  2,  '2024-09-01', 'active'),
(41, 4,  4,  '2024-09-01', 'active'),
(42, 4,  8,  '2024-09-01', 'active'),
(43, 11, 1,  '2024-09-01', 'active'),
(44, 11, 7,  '2024-09-01', 'active'),
(45, 11, 11, '2024-09-01', 'active'),
(46, 12, 3,  '2024-09-01', 'active'),
(47, 12, 5,  '2024-09-01', 'active'),
(48, 12, 9,  '2024-09-01', 'active'),
-- Grade 9 students
(49, 7,  1,  '2024-09-01', 'active'),
(50, 7,  3,  '2024-09-01', 'active'),
(51, 7,  11, '2024-09-01', 'active'),
(52, 8,  1,  '2024-09-01', 'active'),
(53, 8,  5,  '2024-09-01', 'active'),
(54, 8,  9,  '2024-09-01', 'active'),
(55, 15, 3,  '2024-09-01', 'active'),
(56, 15, 7,  '2024-09-01', 'active'),
(57, 15, 11, '2024-09-01', 'active'),
(58, 16, 5,  '2024-09-01', 'active'),
(59, 16, 9,  '2024-09-01', 'active'),
(60, 16, 11, '2024-09-01', 'active');

-- GRADES
INSERT INTO grades (grade_id, enrollment_id, assignment, category, score, max_score, grade_date) VALUES
(1,  1,  'HW 1',       'homework', 18, 20, '2024-09-15'),
(2,  1,  'Quiz 1',     'quiz',     14, 15, '2024-09-22'),
(3,  1,  'Midterm',    'midterm',  78, 100,'2024-10-20'),
(4,  2,  'HW 1',       'homework', 17, 20, '2024-09-15'),
(5,  2,  'Quiz 1',     'quiz',     12, 15, '2024-09-22'),
(6,  3,  'Essay 1',    'homework', 85, 100,'2024-09-20'),
(7,  3,  'Midterm',    'midterm',  72, 100,'2024-10-20'),
(8,  19, 'HW 1',       'homework', 20, 20, '2024-09-15'),
(9,  19, 'Quiz 1',     'quiz',     15, 15, '2024-09-22'),
(10, 19, 'Midterm',    'midterm',  92, 100,'2024-10-20'),
(11, 22, 'HW 1',       'homework', 19, 20, '2024-09-15'),
(12, 22, 'Midterm',    'midterm',  95, 100,'2024-10-20'),
(13, 23, 'Essay 1',    'homework', 88, 100,'2024-09-20'),
(14, 23, 'Midterm',    'midterm',  90, 100,'2024-10-20'),
(15, 37, 'HW 1',       'homework', 15, 20, '2024-09-15'),
(16, 37, 'Quiz 1',     'quiz',     11, 15, '2024-09-22'),
(17, 37, 'Midterm',    'midterm',  68, 100,'2024-10-20'),
(18, 49, 'HW 1',       'homework', 16, 20, '2024-09-15'),
(19, 49, 'Quiz 1',     'quiz',     10, 15, '2024-09-22'),
(20, 52, 'HW 1',       'homework', 20, 20, '2024-09-15'),
(21, 52, 'Quiz 1',     'quiz',     14, 15, '2024-09-22'),
(22, 52, 'Midterm',    'midterm',  88, 100,'2024-10-20'),
(23, 10, 'HW 1',       'homework', 19, 20, '2024-09-15'),
(24, 10, 'Midterm',    'midterm',  91, 100,'2024-10-20'),
(25, 7,  'HW 1',       'homework', 14, 20, '2024-09-15'),
(26, 7,  'Midterm',    'midterm',  70, 100,'2024-10-20'),
(27, 25, 'HW 1',       'homework', 12, 20, '2024-09-15'),
(28, 25, 'Midterm',    'midterm',  65, 100,'2024-10-20'),
(29, 40, 'HW 1',       'homework', 17, 20, '2024-09-15'),
(30, 40, 'Midterm',    'midterm',  80, 100,'2024-10-20');

-- ATTENDANCE
INSERT INTO attendance (attendance_id, student_id, course_id, attend_date, status) VALUES
(1,  1,  1, '2024-09-02', 'present'),
(2,  1,  1, '2024-09-04', 'present'),
(3,  1,  1, '2024-09-09', 'absent'),
(4,  1,  1, '2024-09-11', 'present'),
(5,  2,  2, '2024-09-03', 'present'),
(6,  2,  2, '2024-09-05', 'present'),
(7,  2,  2, '2024-09-10', 'present'),
(8,  5,  1, '2024-09-02', 'late'),
(9,  5,  1, '2024-09-04', 'present'),
(10, 5,  1, '2024-09-09', 'absent'),
(11, 6,  3, '2024-09-02', 'present'),
(12, 6,  3, '2024-09-04', 'present'),
(13, 7,  1, '2024-09-02', 'present'),
(14, 7,  1, '2024-09-04', 'absent'),
(15, 8,  1, '2024-09-02', 'present'),
(16, 8,  1, '2024-09-04', 'present'),
(17, 9,  1, '2024-09-02', 'absent'),
(18, 9,  1, '2024-09-04', 'late'),
(19, 10, 3, '2024-09-02', 'present'),
(20, 10, 3, '2024-09-04', 'present'),
(21, 13, 2, '2024-09-03', 'present'),
(22, 13, 2, '2024-09-05', 'absent'),
(23, 14, 9, '2024-09-03', 'present'),
(24, 14, 9, '2024-09-05', 'present'),
(25, 15, 3, '2024-09-02', 'present'),
(26, 16, 9, '2024-09-03', 'late'),
(27, 17, 2, '2024-09-03', 'present'),
(28, 18, 9, '2024-09-03', 'present'),
(29, 19, 1, '2024-09-02', 'absent'),
(30, 20, 3, '2024-09-02', 'present');

-- EXAMS
INSERT INTO exams (exam_id, course_id, exam_type, exam_date, room, total_marks) VALUES
(1,  1,  'midterm', '2024-10-20', 'A101', 100),
(2,  2,  'midterm', '2024-10-21', 'A102', 100),
(3,  3,  'midterm', '2024-10-22', 'B101', 100),
(4,  4,  'midterm', '2024-10-23', 'B201', 100),
(5,  5,  'midterm', '2024-10-24', 'C101', 100),
(6,  9,  'midterm', '2024-10-25', 'D101', 100),
(7,  10, 'midterm', '2024-10-25', 'D102', 100),
(8,  1,  'final',   '2024-12-15', 'A101', 100),
(9,  2,  'final',   '2024-12-16', 'A102', 100),
(10, 3,  'final',   '2024-12-17', 'B101', 100),
(11, 5,  'final',   '2024-12-18', 'C101', 100),
(12, 9,  'final',   '2024-12-19', 'D101', 100);
