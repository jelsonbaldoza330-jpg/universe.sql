--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: celestial_body_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_body_type (
    celestial_body_type_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL,
    is_spherical boolean NOT NULL,
    minimum_radius_km numeric(8,2) NOT NULL
);


ALTER TABLE public.celestial_body_type OWNER TO freecodecamp;

--
-- Name: celestial_body_type_celestial_body_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_body_type_celestial_body_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_body_type_celestial_body_type_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_body_type_celestial_body_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_body_type_celestial_body_type_id_seq OWNED BY public.celestial_body_type.celestial_body_type_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    age_millions_of_years integer NOT NULL,
    estimated_star_count bigint NOT NULL,
    description text NOT NULL,
    has_life boolean DEFAULT false NOT NULL
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
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    radius_km numeric(8,2) NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    discovery_year integer
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
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(30) NOT NULL,
    mass_earth numeric(10,3) NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    moons_count integer DEFAULT 0 NOT NULL
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
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_class character varying(10) NOT NULL,
    mass_solar numeric(8,3) NOT NULL,
    is_variable boolean DEFAULT false NOT NULL,
    discovery_year integer
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
-- Name: celestial_body_type celestial_body_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body_type ALTER COLUMN celestial_body_type_id SET DEFAULT nextval('public.celestial_body_type_celestial_body_type_id_seq'::regclass);


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
-- Data for Name: celestial_body_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_body_type VALUES (1, 'Terrestrial planet', 'A rocky planet with a solid surface', true, 1000.00);
INSERT INTO public.celestial_body_type VALUES (2, 'Gas giant', 'A large planet composed mostly of gas', true, 10000.00);
INSERT INTO public.celestial_body_type VALUES (3, 'Natural satellite', 'A naturally occurring body orbiting a planet', true, 1.00);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral', 13600, 200000000000, 'Home galaxy of the Solar System', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 1000000000000, 'Nearest major galaxy to the Milky Way', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 40000000, 'A member of the Local Group', false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 400, 100000000000, 'A grand-design spiral galaxy', false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Lenticular', 13000, 100000000000, 'A bright galaxy with a prominent dust lane', false);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 13000, 30000000000, 'A satellite galaxy of the Milky Way', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737.40, true, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.27, false, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.20, false, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821.60, true, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560.80, true, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634.10, true, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.30, true, 1610);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2574.70, true, 1655);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 252.10, true, 1789);
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 763.80, true, 1672);
INSERT INTO public.moon VALUES (11, 'Titania', 7, 788.90, true, 1787);
INSERT INTO public.moon VALUES (12, 'Oberon', 7, 761.40, true, 1787);
INSERT INTO public.moon VALUES (13, 'Triton', 8, 1353.40, true, 1846);
INSERT INTO public.moon VALUES (14, 'Mimas', 6, 198.20, true, 1789);
INSERT INTO public.moon VALUES (15, 'Iapetus', 6, 734.50, true, 1671);
INSERT INTO public.moon VALUES (16, 'Dione', 6, 561.40, true, 1684);
INSERT INTO public.moon VALUES (17, 'Ariel', 7, 578.90, true, 1851);
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, 584.70, true, 1851);
INSERT INTO public.moon VALUES (19, 'Charon', 8, 606.00, true, 1978);
INSERT INTO public.moon VALUES (20, 'Amalthea', 5, 83.50, false, 1892);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 0.055, false, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 0.815, false, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 1.000, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 0.107, false, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas giant', 317.830, false, 4);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas giant', 95.160, false, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant', 14.540, false, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice giant', 17.150, false, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-90b', 7, 'Super-Earth', 1.320, false, 0);
INSERT INTO public.planet VALUES (10, 'Kepler-90c', 7, 'Gas giant', 15.100, false, 0);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1b', 8, 'Terrestrial', 1.374, false, 0);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1c', 8, 'Terrestrial', 1.308, false, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1.000, false, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A1V', 2.063, false, 1844);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 'M5.5V', 0.122, true, 1915);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 'G2V', 1.100, false, 1592);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 'M1-M2', 16.500, true, 1836);
INSERT INTO public.star VALUES (6, 'Vega', 1, 'A0V', 2.135, false, 1850);
INSERT INTO public.star VALUES (7, 'Kepler-90', 1, 'G0V', 1.200, false, 2013);
INSERT INTO public.star VALUES (8, 'TRAPPIST-1', 1, 'M8V', 0.089, false, 1999);


--
-- Name: celestial_body_type_celestial_body_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_body_type_celestial_body_type_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: celestial_body_type celestial_body_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body_type
    ADD CONSTRAINT celestial_body_type_name_key UNIQUE (name);


--
-- Name: celestial_body_type celestial_body_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body_type
    ADD CONSTRAINT celestial_body_type_pkey PRIMARY KEY (celestial_body_type_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

