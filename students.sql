--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1+b3)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1+b3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.students DROP CONSTRAINT students_major_id_fkey;
ALTER TABLE ONLY public.majors_courses DROP CONSTRAINT majors_courses_major_id_fkey;
ALTER TABLE ONLY public.majors_courses DROP CONSTRAINT majors_courses_course_id_fkey;
ALTER TABLE ONLY public.students DROP CONSTRAINT students_pkey;
ALTER TABLE ONLY public.majors DROP CONSTRAINT majors_pkey;
ALTER TABLE ONLY public.majors_courses DROP CONSTRAINT majors_courses_pkey;
ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_pkey;
ALTER TABLE public.students ALTER COLUMN student_id DROP DEFAULT;
ALTER TABLE public.majors ALTER COLUMN major_id DROP DEFAULT;
ALTER TABLE public.courses ALTER COLUMN course_id DROP DEFAULT;
DROP SEQUENCE public.students_student_id_seq;
DROP TABLE public.students;
DROP SEQUENCE public.majors_major_id_seq;
DROP TABLE public.majors_courses;
DROP TABLE public.majors;
DROP SEQUENCE public.courses_course_id_seq;
DROP TABLE public.courses;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course character varying(100) NOT NULL
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_course_id_seq OWNER TO postgres;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: majors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.majors (
    major_id integer NOT NULL,
    major character varying(50) NOT NULL
);


ALTER TABLE public.majors OWNER TO postgres;

--
-- Name: majors_courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.majors_courses (
    major_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.majors_courses OWNER TO postgres;

--
-- Name: majors_major_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.majors_major_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.majors_major_id_seq OWNER TO postgres;

--
-- Name: majors_major_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.majors_major_id_seq OWNED BY public.majors.major_id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    major_id integer,
    gpa numeric(2,1)
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_student_id_seq OWNER TO postgres;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: majors major_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.majors ALTER COLUMN major_id SET DEFAULT nextval('public.majors_major_id_seq'::regclass);


--
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.courses VALUES (131, 'Data Structures and Algorithms');
INSERT INTO public.courses VALUES (132, 'Web Programming');
INSERT INTO public.courses VALUES (133, 'Database Systems');
INSERT INTO public.courses VALUES (134, 'Computer Networks');
INSERT INTO public.courses VALUES (135, 'SQL');
INSERT INTO public.courses VALUES (136, 'Machine Learning');
INSERT INTO public.courses VALUES (137, 'Computer Systems');
INSERT INTO public.courses VALUES (138, 'Web Applications');
INSERT INTO public.courses VALUES (139, 'Artificial Intelligence');
INSERT INTO public.courses VALUES (140, 'Python');
INSERT INTO public.courses VALUES (141, 'Object-Oriented Programming');
INSERT INTO public.courses VALUES (142, 'Calculus');
INSERT INTO public.courses VALUES (143, 'Game Architecture');
INSERT INTO public.courses VALUES (144, 'Algorithms');
INSERT INTO public.courses VALUES (145, 'UNIX');
INSERT INTO public.courses VALUES (146, 'Server Administration');
INSERT INTO public.courses VALUES (147, 'Network Security');


--
-- Data for Name: majors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.majors VALUES (108, 'Database Administration');
INSERT INTO public.majors VALUES (109, 'Web Development');
INSERT INTO public.majors VALUES (110, 'Data Science');
INSERT INTO public.majors VALUES (111, 'Network Engineering');
INSERT INTO public.majors VALUES (112, 'Computer Programming');
INSERT INTO public.majors VALUES (113, 'Game Design');
INSERT INTO public.majors VALUES (114, 'System Administration');


--
-- Data for Name: majors_courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.majors_courses VALUES (108, 131);
INSERT INTO public.majors_courses VALUES (109, 132);
INSERT INTO public.majors_courses VALUES (108, 133);
INSERT INTO public.majors_courses VALUES (110, 131);
INSERT INTO public.majors_courses VALUES (111, 134);
INSERT INTO public.majors_courses VALUES (108, 135);
INSERT INTO public.majors_courses VALUES (110, 136);
INSERT INTO public.majors_courses VALUES (111, 137);
INSERT INTO public.majors_courses VALUES (112, 134);
INSERT INTO public.majors_courses VALUES (108, 138);
INSERT INTO public.majors_courses VALUES (113, 139);
INSERT INTO public.majors_courses VALUES (110, 140);
INSERT INTO public.majors_courses VALUES (112, 141);
INSERT INTO public.majors_courses VALUES (114, 137);
INSERT INTO public.majors_courses VALUES (113, 142);
INSERT INTO public.majors_courses VALUES (109, 131);
INSERT INTO public.majors_courses VALUES (110, 142);
INSERT INTO public.majors_courses VALUES (109, 141);
INSERT INTO public.majors_courses VALUES (113, 143);
INSERT INTO public.majors_courses VALUES (114, 134);
INSERT INTO public.majors_courses VALUES (113, 144);
INSERT INTO public.majors_courses VALUES (114, 145);
INSERT INTO public.majors_courses VALUES (114, 146);
INSERT INTO public.majors_courses VALUES (112, 137);
INSERT INTO public.majors_courses VALUES (112, 140);
INSERT INTO public.majors_courses VALUES (111, 147);
INSERT INTO public.majors_courses VALUES (109, 138);
INSERT INTO public.majors_courses VALUES (111, 144);


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.students VALUES (34, 'Rhea', 'Kellems', 108, 2.5);
INSERT INTO public.students VALUES (35, 'Emma', 'Gilbert', NULL, NULL);
INSERT INTO public.students VALUES (36, 'Kimberly', 'Whitley', 109, 3.8);
INSERT INTO public.students VALUES (37, 'Jimmy', 'Felipe', 108, 3.7);
INSERT INTO public.students VALUES (38, 'Kyle', 'Stimson', NULL, 2.8);
INSERT INTO public.students VALUES (39, 'Casares', 'Hijo', 113, 4.0);
INSERT INTO public.students VALUES (40, 'Noe', 'Savage', NULL, 3.6);
INSERT INTO public.students VALUES (41, 'Sterling', 'Boss', 113, 3.9);
INSERT INTO public.students VALUES (42, 'Brian', 'Davis', NULL, 2.3);
INSERT INTO public.students VALUES (43, 'Kaija', 'Uronen', 113, 3.7);
INSERT INTO public.students VALUES (44, 'Faye', 'Conn', 113, 2.1);
INSERT INTO public.students VALUES (45, 'Efren', 'Reilly', 109, 3.9);
INSERT INTO public.students VALUES (46, 'Danh', 'Nhung', NULL, 2.4);
INSERT INTO public.students VALUES (47, 'Maxine', 'Hagenes', 108, 2.9);
INSERT INTO public.students VALUES (48, 'Larry', 'Saunders', 110, 2.2);
INSERT INTO public.students VALUES (49, 'Karl', 'Kuhar', 109, NULL);
INSERT INTO public.students VALUES (50, 'Lieke', 'Hazenveld', 113, 3.5);
INSERT INTO public.students VALUES (51, 'Obie', 'Hilpert', 109, NULL);
INSERT INTO public.students VALUES (52, 'Peter', 'Booysen', NULL, 2.9);
INSERT INTO public.students VALUES (53, 'Nathan', 'Turner', 108, 3.3);
INSERT INTO public.students VALUES (54, 'Gerald', 'Osiki', 110, 2.2);
INSERT INTO public.students VALUES (55, 'Vanya', 'Hassanah', 113, 4.0);
INSERT INTO public.students VALUES (56, 'Roxelana', 'Florescu', 108, 3.2);
INSERT INTO public.students VALUES (57, 'Helene', 'Parker', 110, 3.4);
INSERT INTO public.students VALUES (58, 'Mariana', 'Russel', 109, 1.8);
INSERT INTO public.students VALUES (59, 'Ajit', 'Dhungel', NULL, 3.0);
INSERT INTO public.students VALUES (60, 'Mehdi', 'Vandenberghe', 108, 1.9);
INSERT INTO public.students VALUES (61, 'Dejon', 'Howell', 109, 4.0);
INSERT INTO public.students VALUES (62, 'Aliya', 'Gulgowski', 114, 2.6);
INSERT INTO public.students VALUES (63, 'Ana', 'Tupajic', 110, 3.1);
INSERT INTO public.students VALUES (64, 'Hugo', 'Duran', NULL, 3.8);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 147, true);


--
-- Name: majors_major_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.majors_major_id_seq', 114, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_student_id_seq', 64, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: majors_courses majors_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_pkey PRIMARY KEY (major_id, course_id);


--
-- Name: majors majors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.majors
    ADD CONSTRAINT majors_pkey PRIMARY KEY (major_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: majors_courses majors_courses_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id);


--
-- Name: majors_courses majors_courses_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.majors_courses
    ADD CONSTRAINT majors_courses_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- Name: students students_major_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_major_id_fkey FOREIGN KEY (major_id) REFERENCES public.majors(major_id);


--
-- PostgreSQL database dump complete
--

