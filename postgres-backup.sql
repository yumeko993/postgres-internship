--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    c_no integer NOT NULL,
    title text,
    hours integer
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: exams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exams (
    s_id integer,
    c_no integer,
    score integer,
    CONSTRAINT score CHECK (((score > 0) AND (score < 6)))
);


ALTER TABLE public.exams OWNER TO postgres;

--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    s_id integer NOT NULL,
    name text,
    start_year integer
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (c_no, title, hours) FROM stdin;
1	mathematics	140
2	physics	140
3	English	100
4	Deutsch	100
5	chemistry	100
\.


--
-- Data for Name: exams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exams (s_id, c_no, score) FROM stdin;
1	1	4
1	2	5
1	3	4
1	4	3
1	5	4
2	1	4
2	2	3
2	3	5
2	4	3
2	5	5
3	1	3
3	2	4
3	3	5
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (s_id, name, start_year) FROM stdin;
1	Andrey	2020
2	Daniil	2020
3	Artem	2020
4	Vladimir	2020
5	Dmitrii	2020
\.


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (c_no);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (s_id);


--
-- Name: exams uni; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT uni UNIQUE (s_id, c_no);


--
-- Name: exams fk_c_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT fk_c_no FOREIGN KEY (c_no) REFERENCES public.courses(c_no);


--
-- Name: exams fk_s_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT fk_s_id FOREIGN KEY (s_id) REFERENCES public.students(s_id);


--
-- PostgreSQL database dump complete
--

