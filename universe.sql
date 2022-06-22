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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_km integer,
    dist_sun_au numeric(4,3) NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    origin_of_name text,
    max_dia_ly integer,
    max_no_of_stars_billion integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_celestial_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_celestial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_celestial_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_celestial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_celestial_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    planet_id integer NOT NULL,
    radius_km numeric(6,2),
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
    name character varying(30),
    is_spherical boolean,
    has_life boolean,
    star_id integer NOT NULL,
    dist_to_earth_ly real,
    radius_rj real
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
    name character varying(30),
    galaxy_id integer NOT NULL,
    constellation character varying(30),
    temperature_k integer,
    age_gyr real,
    planets_no integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_celestial_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_celestial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_celestial_id_seq OWNER TO freecodecamp;

--
-- Name: star_celestial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_celestial_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_celestial_id_seq'::regclass);


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

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_celestial_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, '1 Ceres', 939, 2.766);
INSERT INTO public.asteroid VALUES (2, '4 Vesta', 525, 2.362);
INSERT INTO public.asteroid VALUES (3, '2 Pallas', 511, 2.773);
INSERT INTO public.asteroid VALUES (4, '10 Hygiea', 433, 3.139);
INSERT INTO public.asteroid VALUES (5, '704 Interamnia', 332, 3.062);
INSERT INTO public.asteroid VALUES (6, '52 Europa', 319, 3.095);
INSERT INTO public.asteroid VALUES (7, '511 Davida', 298, 3.168);
INSERT INTO public.asteroid VALUES (8, '87 Sylvia', 274, 3.485);
INSERT INTO public.asteroid VALUES (9, '15 Eunomia', 270, 2.643);
INSERT INTO public.asteroid VALUES (10, '31 Euphrosyne', 268, 3.149);
INSERT INTO public.asteroid VALUES (11, '624 Hektor', 256, 5.235);
INSERT INTO public.asteroid VALUES (12, '3 Juno', 254, 2.672);
INSERT INTO public.asteroid VALUES (13, '107 Camilla', 254, 3.476);
INSERT INTO public.asteroid VALUES (14, '65 Cybele', 237, 3.439);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The appearance from Earth of the galaxy—a band of light', 105700, 400);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Andromeda, which is shortened from "Andromeda Galaxy", gets its name from the area of the sky in which it appears, the constellation of Andromeda.', 220000, 1000);
INSERT INTO public.galaxy VALUES (3, 'Antennae Galaxies', 'Appearance is similar to an insects antennae.', 500000, NULL);
INSERT INTO public.galaxy VALUES (4, 'Backward Galaxy', 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation.', 122732, NULL);
INSERT INTO public.galaxy VALUES (6, 'Bodes Galaxy', 'Named for Johann Elert Bode who discovered this galaxy in 1774.', 90000, 250);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 'It has a spectacular dark band of absorbing dust in front of the galaxys bright nucleus, giving rise to its nicknames of the "Black Eye" or "Evil Eye" galaxy.', 52962, 100);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1738.00, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11.27, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6.20, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 3, 1821.60, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 1560.80, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 2634.10, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 2410.30, 1610);
INSERT INTO public.moon VALUES (8, 'Amalthea', 3, 83.50, 1892);
INSERT INTO public.moon VALUES (9, 'Himalia', 3, 69.80, 1904);
INSERT INTO public.moon VALUES (10, 'Elara', 3, 43.00, 1905);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 3, 30.00, 1908);
INSERT INTO public.moon VALUES (12, 'Sinope', 3, 19.00, 1914);
INSERT INTO public.moon VALUES (13, 'Lysithea', 3, 18.00, 1938);
INSERT INTO public.moon VALUES (14, 'Carme', 3, 23.00, 1938);
INSERT INTO public.moon VALUES (15, 'Ananke', 3, 14.00, 1951);
INSERT INTO public.moon VALUES (16, 'Leda', 3, 10.00, 1974);
INSERT INTO public.moon VALUES (17, 'Thebe', 3, 49.30, 1979);
INSERT INTO public.moon VALUES (18, 'Mimas', 4, 198.20, 1789);
INSERT INTO public.moon VALUES (19, 'Enceladus', 4, 252.10, 1789);
INSERT INTO public.moon VALUES (20, 'Tethys', 4, 533.10, 1684);
INSERT INTO public.moon VALUES (21, 'Dione', 4, 561.40, 1684);
INSERT INTO public.moon VALUES (22, 'Rhea', 4, 763.80, 1672);
INSERT INTO public.moon VALUES (23, 'Titan', 4, 2574.73, 1655);
INSERT INTO public.moon VALUES (24, 'Ariel', 5, 578.90, 1851);
INSERT INTO public.moon VALUES (25, 'Umbriel', 5, 584.70, 1851);
INSERT INTO public.moon VALUES (26, 'Titania', 5, 788.90, 1787);
INSERT INTO public.moon VALUES (27, 'Oberon', 5, 761.40, 1787);
INSERT INTO public.moon VALUES (28, 'Miranda', 5, 235.80, 1948);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', false, true, 1, 0, 0.089);
INSERT INTO public.planet VALUES (2, 'Mars', false, false, 1, 2e-05, 0.047);
INSERT INTO public.planet VALUES (3, 'Jupiter', false, false, 1, 8e-05, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', false, false, 1, 0.00015, 0.8);
INSERT INTO public.planet VALUES (5, 'Uranus', false, false, 1, 0.00032, 0.355);
INSERT INTO public.planet VALUES (6, 'Neptune', false, false, 1, 0.00047, 0.344);
INSERT INTO public.planet VALUES (7, 'Venus', true, false, 1, 2e-05, 0.085);
INSERT INTO public.planet VALUES (8, 'Mercury', true, false, 1, 1e-05, 0.034);
INSERT INTO public.planet VALUES (9, 'Kepler-90b', false, false, 2, 2835.9, 0.117);
INSERT INTO public.planet VALUES (10, 'Kepler-90c', false, false, 2, 2835.9, 0.105);
INSERT INTO public.planet VALUES (11, 'Kepler-90i', false, false, 2, 2544, 0.117);
INSERT INTO public.planet VALUES (12, 'Kepler-90d', false, false, 2, 2840, 0.256);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, NULL, 5778, 4.572, 8);
INSERT INTO public.star VALUES (2, 'Kepler-90', 1, 'Draco', 5930, 2, 8);
INSERT INTO public.star VALUES (3, 'TRAPPIST-1', 1, 'Aquarius', 2550, 7.6, 7);
INSERT INTO public.star VALUES (4, 'Tau Ceti', 1, 'Cetus', 5344, 5.8, 4);
INSERT INTO public.star VALUES (5, 'Upsilon Andromedae', 2, 'Andromeda', 6107, 3.78, 4);
INSERT INTO public.star VALUES (6, 'Mu Arae', 1, 'Ara', 5704, 6.41, 4);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 14, true);


--
-- Name: galaxy_celestial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_celestial_id_seq', 1, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_celestial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_celestial_id_seq', 1, true);


--
-- Name: asteroid asteroid_asteroid_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_asteroid_id_key UNIQUE (asteroid_id);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

