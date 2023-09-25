--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    year integer NOT NULL,
    round character varying(40) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_goals integer NOT NULL,
    game_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    name character varying(30) NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (2018, 'Final', 121, 122, 2, 4, 65);
INSERT INTO public.games VALUES (2018, 'Third Place', 123, 124, 0, 2, 66);
INSERT INTO public.games VALUES (2018, 'Semi-Final', 122, 124, 1, 2, 67);
INSERT INTO public.games VALUES (2018, 'Semi-Final', 121, 123, 0, 1, 68);
INSERT INTO public.games VALUES (2018, 'Quarter-Final', 122, 125, 2, 3, 69);
INSERT INTO public.games VALUES (2018, 'Quarter-Final', 124, 126, 0, 2, 70);
INSERT INTO public.games VALUES (2018, 'Quarter-Final', 123, 127, 1, 2, 71);
INSERT INTO public.games VALUES (2018, 'Quarter-Final', 121, 128, 0, 2, 72);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 124, 129, 1, 2, 73);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 126, 130, 0, 1, 74);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 123, 131, 2, 3, 75);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 127, 132, 0, 2, 76);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 122, 133, 1, 2, 77);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 125, 134, 1, 2, 78);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 128, 135, 1, 2, 79);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 121, 136, 3, 4, 80);
INSERT INTO public.games VALUES (2014, 'Final', 137, 136, 0, 1, 81);
INSERT INTO public.games VALUES (2014, 'Third Place', 138, 127, 0, 3, 82);
INSERT INTO public.games VALUES (2014, 'Semi-Final', 136, 138, 0, 1, 83);
INSERT INTO public.games VALUES (2014, 'Semi-Final', 137, 127, 1, 7, 84);
INSERT INTO public.games VALUES (2014, 'Quarter-Final', 138, 139, 0, 1, 85);
INSERT INTO public.games VALUES (2014, 'Quarter-Final', 136, 123, 0, 1, 86);
INSERT INTO public.games VALUES (2014, 'Quarter-Final', 127, 129, 1, 2, 87);
INSERT INTO public.games VALUES (2014, 'Quarter-Final', 137, 121, 0, 1, 88);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 127, 140, 1, 2, 89);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 129, 128, 0, 2, 90);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 121, 141, 0, 2, 91);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 137, 142, 1, 2, 92);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 138, 132, 1, 2, 93);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 139, 143, 1, 2, 94);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 136, 130, 0, 1, 95);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 123, 144, 1, 2, 96);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES ('France', 121);
INSERT INTO public.teams VALUES ('Croatia', 122);
INSERT INTO public.teams VALUES ('Belgium', 123);
INSERT INTO public.teams VALUES ('England', 124);
INSERT INTO public.teams VALUES ('Russia', 125);
INSERT INTO public.teams VALUES ('Sweden', 126);
INSERT INTO public.teams VALUES ('Brazil', 127);
INSERT INTO public.teams VALUES ('Uruguay', 128);
INSERT INTO public.teams VALUES ('Colombia', 129);
INSERT INTO public.teams VALUES ('Switzerland', 130);
INSERT INTO public.teams VALUES ('Japan', 131);
INSERT INTO public.teams VALUES ('Mexico', 132);
INSERT INTO public.teams VALUES ('Denmark', 133);
INSERT INTO public.teams VALUES ('Spain', 134);
INSERT INTO public.teams VALUES ('Portugal', 135);
INSERT INTO public.teams VALUES ('Argentina', 136);
INSERT INTO public.teams VALUES ('Germany', 137);
INSERT INTO public.teams VALUES ('Netherlands', 138);
INSERT INTO public.teams VALUES ('Costa Rica', 139);
INSERT INTO public.teams VALUES ('Chile', 140);
INSERT INTO public.teams VALUES ('Nigeria', 141);
INSERT INTO public.teams VALUES ('Algeria', 142);
INSERT INTO public.teams VALUES ('Greece', 143);
INSERT INTO public.teams VALUES ('United States', 144);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 96, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 144, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

