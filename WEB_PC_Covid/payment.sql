--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-01-07 11:34:17

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 18956)
-- Name: Account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Account" (
    "ID" character varying(10) NOT NULL,
    "Password" character varying(100) NOT NULL,
    "Balance" integer DEFAULT 0 NOT NULL,
    "Role" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."Account" OWNER TO postgres;

--
-- TOC entry 3306 (class 0 OID 18956)
-- Dependencies: 209
-- Data for Name: Account; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Account" ("ID", "Password", "Balance", "Role") VALUES ('9999999999', '$2a$10$3v3B/DSgfq95XbE99FvhROStt1Kpsb7iWaitJBHEEfqgaXs1J5sgS', 0, 1);


--
-- TOC entry 3166 (class 2606 OID 18962)
-- Name: Account Account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_pkey" PRIMARY KEY ("ID");


-- Completed on 2022-01-07 11:34:18

--
-- PostgreSQL database dump complete
--

