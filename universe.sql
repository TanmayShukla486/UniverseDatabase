--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer NOT NULL,
    galaxy_type integer,
    distance_from_earth numeric(30,5)
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    revolution_in_hours integer,
    planet_id integer
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
-- Name: moon_type_id_sequence; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_type_id_sequence
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_type_id_sequence OWNER TO freecodecamp;

--
-- Name: moon_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_type (
    moon_type_id integer DEFAULT nextval('public.moon_type_id_sequence'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.moon_type OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_type integer,
    star_id integer,
    description text,
    distance_from_earth numeric(30,5),
    has_life boolean,
    age_in_millions_of_years integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    distance_from_earth numeric(30,5),
    star_type integer,
    age_in_millions_of_years integer
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_star_type_id_seq OWNED BY public.star_type.star_type_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'The Andromeda Galaxy is a barred spiral galaxy and is the nearest major galaxy to the Milky Way. It was originally named the Andromeda Nebula and is cataloged as Messier 31, M31, and NGC 224. Andromeda has a D25 isophotal diameter of about 46.56 kiloparsecs.', false, true, 10010, 1, 23700000000000.00000);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'The Milky Way[c] is the galaxy that includes the Solar System, with the name describing the galaxys appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.', true, true, 13600, 1, 246000.00000);
INSERT INTO public.galaxy VALUES (3, 'Cigar', 'Messier 82 (also known as NGC 3034, Cigar Galaxy or M82) is a starburst galaxy approximately 12 million light-years away in the constellation Ursa Major.', false, false, 13600, 5, 246000.00000);
INSERT INTO public.galaxy VALUES (4, 'Bear Paw', 'NGC 2537, also known as the Bear Paw Galaxy or Bear Claw Galaxy, is a blue compact dwarf galaxy in the constellation Lynx, located around 3 degrees NNW of 31 Lyncis', false, false, 13600, 2, 246000.00000);
INSERT INTO public.galaxy VALUES (5, 'IC 4710', 'IC 4710 is a galaxy in southern constellation of Pavo, roughly 34 million light-years away.Discovered on August 18, 1900 by astronomer DeLisle Stewart, this galaxy is composed of bright stars, with bright pockets — marking bursts of new star formation — scattered around its edges.[4] It has a diameter of 36,000 light-years.', false, false, 13600, 4, 246600.00000);
INSERT INTO public.galaxy VALUES (6, 'NGC 2787', 'NGC 2787 is a barred lenticular galaxy approximately 24[3] million light-years away in the northern constellation of Ursa Major. It was discovered on December 3, 1788 by German-born astronomer William Herschel. J. L. E. Dreyer.', false, false, 13600, 3, 246057.00000);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'spiral', 'These galaxies come in a variety of shapes and are classified by the size of their bulge and the appearance of their spiral arms.');
INSERT INTO public.galaxy_type VALUES (2, 'elliptical', 'These galaxies are almost entirely made up of old stars and have shapes that are spheres or ellipsoids. They do not have spiral arms and their light is dominated by older reddish stars.');
INSERT INTO public.galaxy_type VALUES (3, 'lenticular', 'These galaxies are a cross between spirals and ellipticals, with the central bulge and disk of a spiral galaxy but no arms.');
INSERT INTO public.galaxy_type VALUES (4, 'irregular', 'These galaxies do not have a distinct regular shape like spiral or elliptical galaxies. For example, the Large Magellanic Cloud is generally classified as an irregular galaxy, but it has some features of spiral galaxies, like a bar and a spiral-arm-like structure.');
INSERT INTO public.galaxy_type VALUES (5, 'starburst', 'A starburst galaxy is one undergoing an exceptionally high rate of star formation, as compared to the long-term average rate of star formation in the galaxy, or the star formation rate observed in most other galaxies.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'luna1', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (2, 'luna2', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (3, 'luna3', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (4, 'luna4', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (5, 'luna5', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (6, 'luna6', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (7, 'luna7', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (8, 'luna8', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (9, 'luna9', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (10, 'luna10', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (11, 'luna11', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (12, 'luna12', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (13, 'luna13', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (14, 'luna14', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (15, 'luna15', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (16, 'luna16', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (17, 'luna17', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (18, 'luna18', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (19, 'luna19', 'our moon', 2500, 504, 2);
INSERT INTO public.moon VALUES (20, 'luna20', 'our moon', 2500, 504, 2);


--
-- Data for Name: moon_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_type VALUES (1, 'earth moon', 'Earths moon');
INSERT INTO public.moon_type VALUES (2, 'mars moon', 'Moon of the planet Mars');
INSERT INTO public.moon_type VALUES (3, 'jupiter moon', 'Moon of the planet Jupiter');
INSERT INTO public.moon_type VALUES (4, 'saturn moon', 'Moon of the planet Saturn');
INSERT INTO public.moon_type VALUES (5, 'uranus moon', 'Moon of the planet Uranus');
INSERT INTO public.moon_type VALUES (6, 'neptune moon', 'Moon of the planet Neptune');
INSERT INTO public.moon_type VALUES (7, 'pluto moon', 'Moon of the planet Pluto');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Venus', NULL, 2, 'Second closest planet, often called Earth''s twin', 42.00000, false, 4500);
INSERT INTO public.planet VALUES (2, 'Earth', NULL, 2, 'Our home planet', 0.00000, true, 4500);
INSERT INTO public.planet VALUES (3, 'Mars', NULL, 2, 'Red Planet with evidence of water', 78.00000, false, 4600);
INSERT INTO public.planet VALUES (4, 'Jupiter', 2, 2, 'Largest planet in solar system', 778.00000, false, 4600);
INSERT INTO public.planet VALUES (5, 'Saturn', 3, 2, 'Known for its rings', 14300.00000, false, 4600);
INSERT INTO public.planet VALUES (6, 'Uranus', 4, 2, 'Blue planet with rings', 28700.00000, false, 4600);
INSERT INTO public.planet VALUES (8, 'Neptune1', 2, 2, 'Farthest planet from the Sun', 4500.00000, false, 4600);
INSERT INTO public.planet VALUES (9, 'Neptune', 2, 2, 'Farthest planet from the Sun', 4500.00000, false, 4600);
INSERT INTO public.planet VALUES (10, 'Neptune2', 2, 2, 'Farthest planet from the Sun', 4500.00000, false, 4600);
INSERT INTO public.planet VALUES (11, 'Neptune3', 2, 2, 'Farthest planet from the Sun', 4500.00000, false, 4600);
INSERT INTO public.planet VALUES (12, 'Neptune4', 2, 2, 'Farthest planet from the Sun', 4500.00000, false, 4600);
INSERT INTO public.planet VALUES (13, 'Neptune5', 2, 2, 'Farthest planet from the Sun', 4500.00000, false, 4600);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'super jupiter', 'An astronomical object that is more massive than the planet Jupiter.');
INSERT INTO public.planet_type VALUES (2, 'giant planet', 'A massive planet. They are most commonly composed primarily of gas (hydrogen and helium) or ices.');
INSERT INTO public.planet_type VALUES (3, 'super neptune', 'A planet that is more massive than the planet Neptune.');
INSERT INTO public.planet_type VALUES (4, 'neptunian', 'A planet similar to neptune or uranus.');
INSERT INTO public.planet_type VALUES (5, 'sub-neptune', 'a planet with smaller radius than Neptune even though it may have a larger mass');
INSERT INTO public.planet_type VALUES (6, 'mini-neptune', 'Also known as a gas dwarf or transitional planet. A planet up to 10 Earth masses, but less massive than Uranus and Neptune.');
INSERT INTO public.planet_type VALUES (7, 'mega-earth', 'Proposed neologism for a massive terrestrial exoplanet that is at least ten times the mass of Earth');
INSERT INTO public.planet_type VALUES (8, 'super-earth', 'An extrasolar planet with a mass higher than Earth');
INSERT INTO public.planet_type VALUES (9, 'sub-earth', 'A classification of planets substantially less massive than Earth and Venus.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Mirach', 1, 'A cool, red giant star thats almost 1,900 times brighter than the sun.', 199.00000, 2, 1000);
INSERT INTO public.star VALUES (2, 'Sun', 2, 'The Sun is the star at the center of the Solar System.', 8.00000, 3, 1000);
INSERT INTO public.star VALUES (3, 'Sirius', 2, 'The brightest star in the night sky, located in the constellation Canis Major.', 9.00000, 2, 250);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 'A red supergiant star located in the constellation Orion. Its one of the largest stars known, and its brightness varies significantly.', 520.00000, 1, 8);
INSERT INTO public.star VALUES (5, 'Rigel', 2, 'A blue supergiant star located in the constellation Orion. It''s one of the most luminous stars in the Milky Way.', 770.00000, 1, 8);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 2, 'The closest star to the Sun, located in the Alpha Centauri system. It''s a red dwarf star.', 4.00000, 5, 4850);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'supergiants', 'Supergiants are among the most massive and most luminous stars.');
INSERT INTO public.star_type VALUES (2, 'giants', 'Giant stars are stars with a larger radius and luminosity than main-sequence stars of the same surface temperature.');
INSERT INTO public.star_type VALUES (3, 'main sequence', 'A main sequence star is a star that fuses hydrogen into helium in its core, and makes up about 90% of the stars in the universe.');
INSERT INTO public.star_type VALUES (4, 'white dwarfs', 'A white dwarf is a stellar core remnant composed mostly of electron-degenerate matter.');
INSERT INTO public.star_type VALUES (5, 'red dwarfs', 'A red dwarf is the smallest and coolest type of star. They are also the most common type of star in the universe.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: moon_type_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_type_id_sequence', 8, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 9, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_star_type_id_seq', 5, true);


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
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: galaxy_type galaxy_type_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_type_key UNIQUE (name);


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
-- Name: moon_type moon_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type
    ADD CONSTRAINT moon_type_pkey PRIMARY KEY (moon_type_id);


--
-- Name: moon_type moon_type_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type
    ADD CONSTRAINT moon_type_type_key UNIQUE (name);


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
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: planet_type planet_type_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_type_key UNIQUE (name);


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
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


--
-- Name: star_type star_type_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_type_key UNIQUE (name);


--
-- Name: planet_type type_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT type_unique UNIQUE (name);


--
-- Name: galaxy_type type_unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT type_unique_galaxy UNIQUE (name);


--
-- Name: moon_type type_unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type
    ADD CONSTRAINT type_unique_moon UNIQUE (name);


--
-- Name: star_type type_unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT type_unique_star UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

