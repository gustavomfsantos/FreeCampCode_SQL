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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    diamenter_in_mil_light_year numeric(4,2),
    format character varying(30),
    discovery_year integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30),
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    density numeric(5,2),
    color text,
    discovered date,
    orbital_period_hours integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30),
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    size_radius numeric(8,1),
    orbital_period_days numeric(6,0),
    predominant_color character varying(30),
    gravity_meters_sec numeric(4,2),
    explored_by_humans boolean,
    discovered_without_telescope boolean,
    type_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30),
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    size_solar_rad numeric(5,1),
    mass_solar_masses numeric(4,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.type (
    type_id integer NOT NULL UNIQUE,
    name character varying(30) NOT NULL,
    temperature_below_celsius boolean
);


ALTER TABLE public.type OWNER TO freecodecamp;

--
-- Name: types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_type_id_seq OWNER TO freecodecamp;

--
-- Name: types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.types_type_id_seq OWNED BY public.type.type_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: type type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type ALTER COLUMN type_id SET DEFAULT nextval('public.types_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 0.20, 'Spiral', NULL);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 0.20, 'Spiral', NULL);
INSERT INTO public.galaxy VALUES ('Hercules A', 3, 1.50, 'Elliptical', NULL);
INSERT INTO public.galaxy VALUES ('IC 101', 4, 4.00, 'Elliptical', NULL);
INSERT INTO public.galaxy VALUES ('Black Eye', 5, 0.10, 'Spiral', NULL);
INSERT INTO public.galaxy VALUES ('Comet', 7, 0.60, 'Spiral', NULL);
INSERT INTO public.galaxy VALUES ('Cartwheel', 8, 0.60, 'Ring', NULL);
INSERT INTO public.galaxy VALUES ('Cigar', 6, 0.04, 'Irregular', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Phobos', 2, 1, 1.88, 'Brown', '1877-08-17', 8);
INSERT INTO public.moon VALUES ('Callisto', 3, 2, 1.83, 'Gray', '1610-01-07', 408);
INSERT INTO public.moon VALUES ('Io', 3, 3, 3.53, 'Pastel Yellow', '1610-01-08', 42);
INSERT INTO public.moon VALUES ('Europa', 3, 4, 3.01, 'Gray', '1610-01-07', 85);
INSERT INTO public.moon VALUES ('Ganymede', 3, 5, 1.94, 'Gray', '1610-01-07', 172);
INSERT INTO public.moon VALUES ('Amalthea', 3, 6, 0.90, 'Red', '1892-09-09', 12);
INSERT INTO public.moon VALUES ('Triton', 6, 7, 2.06, 'Purple', '1846-10-10', 141);
INSERT INTO public.moon VALUES ('Arche', 3, 8, 2.60, NULL, '2002-10-31', NULL);
INSERT INTO public.moon VALUES ('Thebe', 3, 9, 3.00, 'Gray', '1979-05-05', 16);
INSERT INTO public.moon VALUES ('Adrastea', 3, 10, 1.83, 'Gray', '1979-07-08', 7);
INSERT INTO public.moon VALUES ('Themisto', 3, 11, 2.60, 'Orange', '1975-09-30', NULL);
INSERT INTO public.moon VALUES ('Neso', 6, 12, 1.50, 'Blue', '2002-08-14', NULL);
INSERT INTO public.moon VALUES ('Galatea', 6, 13, 1.30, 'White', '1989-07-01', 10);
INSERT INTO public.moon VALUES ('Despina', 6, 14, 1.30, 'Gray', '1989-07-01', 8);
INSERT INTO public.moon VALUES ('Deimos', 2, 15, 1.65, 'Gray', '1877-08-12', 30);
INSERT INTO public.moon VALUES ('Moon', 1, 16, 3.34, 'Gray', '1609-01-01', 648);
INSERT INTO public.moon VALUES ('Hydra', 7, 17, 5.00, 'Gray', '2005-05-15', 916);
INSERT INTO public.moon VALUES ('Charon', 7, 18, 1.71, 'Brown', '1978-06-22', 153);
INSERT INTO public.moon VALUES ('Kerberos', 7, 19, 1.26, 'Black', '2011-06-28', 768);
INSERT INTO public.moon VALUES ('Nix', 7, 20, 0.20, 'Gray', '2005-05-15', 600);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Pluto', 6, 7, 1180.0, 90520, 'Blue', 0.62, false, false, NULL);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 7, 10, 1.0, 11, 'Black', NULL, false, false, NULL);
INSERT INTO public.planet VALUES ('Proxima Centauri c', 7, 11, 7.0, 1900, 'Gray', NULL, false, false, NULL);
INSERT INTO public.planet VALUES ('Proxima Centauri d', 7, 12, 0.3, 15, 'Black', NULL, false, false, NULL);
INSERT INTO public.planet VALUES ('Earth', 6, 1, 6371.0, 365, 'Blue', 9.80, true, true, 1);
INSERT INTO public.planet VALUES ('Mars', 6, 2, 3389.0, 687, 'Red', 3.70, true, true, 1);
INSERT INTO public.planet VALUES ('Venus', 6, 4, 6051.0, 225, 'Red', 8.80, true, true, 1);
INSERT INTO public.planet VALUES ('Mercury', 6, 5, 2439.0, 88, 'Black', 3.70, false, true, 1);
INSERT INTO public.planet VALUES ('Jupiter', 6, 3, 143000.0, 4330, 'Orange', 24.80, false, true, 2);
INSERT INTO public.planet VALUES ('Saturn', 6, 8, 58232.0, 10585, 'Orange', 10.44, false, true, 2);
INSERT INTO public.planet VALUES ('Neptune', 6, 6, 24622.0, 60225, 'Blue', 11.15, false, false, 3);
INSERT INTO public.planet VALUES ('Uranus', 6, 9, 25362.0, 30660, 'White', 8.87, false, false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('UY Scuti', 1, 2, 1708.0, 8.50);
INSERT INTO public.star VALUES ('Alpheratz', 2, 3, NULL, 3.80);
INSERT INTO public.star VALUES ('Mirach', 2, 4, 100.0, 3.00);
INSERT INTO public.star VALUES ('Antares', 1, 5, 850.0, 17.00);
INSERT INTO public.star VALUES ('Sun', 1, 6, 1.0, 1.00);
INSERT INTO public.star VALUES ('Stephenson 2-18', 1, 1, 2150.0, NULL);
INSERT INTO public.star VALUES ('Proxima Centauri', 1, 7, 0.2, 0.12);


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.type VALUES (1, 'Rocky', False);
INSERT INTO public.type VALUES (2, 'Gas Giant', True);
INSERT INTO public.type VALUES (3, 'Ice Giant', True);



--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.types_type_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: type types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT types_pkey PRIMARY KEY (type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.type(type_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

