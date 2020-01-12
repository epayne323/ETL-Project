--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6
-- Dumped by pg_dump version 11.6

-- Started on 2020-01-11 23:07:54

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

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 17350)
-- Name: movie_grosses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_grosses (
    index bigint,
    "Title" text,
    "Gross" text,
    "Year" text,
    grossint bigint
);


ALTER TABLE public.movie_grosses OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 17380)
-- Name: movie_grosses_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_grosses_ratings (
    index bigint,
    tconst text NOT NULL,
    "Title" text,
    "Gross" text,
    "Year" text,
    grossint bigint,
    "averageRating" double precision,
    "numVotes" bigint
);


ALTER TABLE public.movie_grosses_ratings OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 17332)
-- Name: title_basics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.title_basics (
    index bigint,
    tconst text NOT NULL,
    "titleType" text,
    "primaryTitle" text,
    "originalTitle" text,
    "isAdult" bigint,
    "startYear" text,
    "endYear" text,
    "runtimeMinutes" text,
    genres text
);


ALTER TABLE public.title_basics OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 17325)
-- Name: title_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.title_ratings (
    index bigint,
    tconst text NOT NULL,
    "averageRating" double precision,
    "numVotes" bigint
);


ALTER TABLE public.title_ratings OWNER TO postgres;

--
-- TOC entry 2708 (class 2606 OID 17388)
-- Name: movie_grosses_ratings movie_grosses_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_grosses_ratings
    ADD CONSTRAINT movie_grosses_ratings_pkey PRIMARY KEY (tconst);


--
-- TOC entry 2704 (class 2606 OID 17345)
-- Name: title_basics title_basics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.title_basics
    ADD CONSTRAINT title_basics_pkey PRIMARY KEY (tconst);


--
-- TOC entry 2701 (class 2606 OID 17343)
-- Name: title_ratings title_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.title_ratings
    ADD CONSTRAINT title_ratings_pkey PRIMARY KEY (tconst);


--
-- TOC entry 2705 (class 1259 OID 17356)
-- Name: ix_movie_grosses_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_movie_grosses_index ON public.movie_grosses USING btree (index);


--
-- TOC entry 2706 (class 1259 OID 17386)
-- Name: ix_movie_grosses_ratings_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_movie_grosses_ratings_index ON public.movie_grosses_ratings USING btree (index);


--
-- TOC entry 2702 (class 1259 OID 17338)
-- Name: ix_title_basics_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_title_basics_index ON public.title_basics USING btree (index);


--
-- TOC entry 2699 (class 1259 OID 17331)
-- Name: ix_title_ratings_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_title_ratings_index ON public.title_ratings USING btree (index);


-- Completed on 2020-01-11 23:07:54

--
-- PostgreSQL database dump complete
--

