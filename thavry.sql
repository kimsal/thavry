--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE alembic_version OWNER TO blog;

--
-- Name: booking; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE booking (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    email character varying(255),
    phone character varying(255),
    amount integer,
    description text,
    published_at timestamp without time zone DEFAULT now(),
    post_id integer
);


ALTER TABLE booking OWNER TO blog;

--
-- Name: booking_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE booking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE booking_id_seq OWNER TO blog;

--
-- Name: booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE booking_id_seq OWNED BY booking.id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE category (
    id integer NOT NULL,
    name character varying(100),
    slug character varying(100),
    is_menu integer
);


ALTER TABLE category OWNER TO blog;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_id_seq OWNER TO blog;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE category_id_seq OWNED BY category.id;


--
-- Name: page; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE page (
    id integer NOT NULL,
    title character varying(255),
    slug character varying(255),
    description text,
    published_at timestamp without time zone DEFAULT now(),
    is_menu integer
);


ALTER TABLE page OWNER TO blog;

--
-- Name: page_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE page_id_seq OWNER TO blog;

--
-- Name: page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE page_id_seq OWNED BY page.id;


--
-- Name: post; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE post (
    id integer NOT NULL,
    title character varying(255),
    description text,
    feature_image text,
    slug character varying(255),
    category_id integer,
    images text,
    price double precision,
    user_id integer,
    published_at timestamp without time zone DEFAULT now(),
    views integer
);


ALTER TABLE post OWNER TO blog;

--
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE post_id_seq OWNER TO blog;

--
-- Name: post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE post_id_seq OWNED BY post.id;


--
-- Name: request_trail_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE request_trail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE request_trail_id_seq OWNER TO blog;

--
-- Name: request_trail; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE request_trail (
    id integer DEFAULT nextval('request_trail_id_seq'::regclass) NOT NULL,
    name character varying(255),
    slug character varying(255),
    email character varying(100),
    comment text,
    published_at timestamp without time zone DEFAULT now()
);


ALTER TABLE request_trail OWNER TO blog;

--
-- Name: user_member; Type: TABLE; Schema: public; Owner: blog
--

CREATE TABLE user_member (
    id integer NOT NULL,
    name character varying(50),
    email character varying(100),
    password character varying(600),
    password2 character varying(200),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE user_member OWNER TO blog;

--
-- Name: user_member_id_seq; Type: SEQUENCE; Schema: public; Owner: blog
--

CREATE SEQUENCE user_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_member_id_seq OWNER TO blog;

--
-- Name: user_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog
--

ALTER SEQUENCE user_member_id_seq OWNED BY user_member.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY booking ALTER COLUMN id SET DEFAULT nextval('booking_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY category ALTER COLUMN id SET DEFAULT nextval('category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY page ALTER COLUMN id SET DEFAULT nextval('page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY post ALTER COLUMN id SET DEFAULT nextval('post_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blog
--

ALTER TABLE ONLY user_member ALTER COLUMN id SET DEFAULT nextval('user_member_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY alembic_version (version_num) FROM stdin;
98bf17c21d5f
\.


--
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY booking (id, firstname, lastname, email, phone, amount, description, published_at, post_id) FROM stdin;
1	Kimsal	san	kimsalsan007@gmail.com	90879788789	1	hff	2017-01-06 22:26:42.675409	2
2	kimsal	kimsal	kimsalsan007@gmail.com	ddddd	1	dddd	2017-01-06 22:27:16.68006	2
3	kim	ki	kimsalsan008@gmail.com	ki	1	ki	2017-01-06 22:28:54.610447	2
\.


--
-- Name: booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('booking_id_seq', 3, true);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY category (id, name, slug, is_menu) FROM stdin;
1	BLOG	blog	0
2	BOOKS	books	0
6	Cambodia	cambodia	1
5	Educational Travel	educational-travel	1
4	Traveling & Tips	traveling-tips	1
3	Personal Experience	personal-experience	1
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('category_id_seq', 6, true);


--
-- Data for Name: page; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY page (id, title, slug, description, published_at, is_menu) FROM stdin;
1	ABOUT ME	about-me	<p style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">My name is Thavry Thun (pronounced tah-vree toon). My home is in the countryside, and I am from a simple farming family. We are a happy, hard-working family. I have two brothers and no sisters. When I was a young child, I enjoyed drawing, especially drawing portraits of people. I hope you will enjoy my website and be my friend.</span></p><p style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><strong style="text-size-adjust: none;"><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">Study history</span></strong></p><p style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><strong style="text-size-adjust: none;"><em style="text-size-adjust: none;"><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">Pre-School: </span></em></strong><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">I am the only one daughter in my family, and my parents always support three of us to go to school. They believe in education that change someone’s life. Compare to the other kids in my village their parents most would ask them to stop study and go to work as the garment works or the low job workers in the city. I was sent to school in 1994 to 2001.The different from my parents is that, they value in education even they have to work so hard in the rice field, and just get enough to eat and support hardly  for us to go to school. I went to school since I was five years old. My mother did not value material world very much, we grown up from a simple life style. I was not a very excellent student, but I never made my mom disappointed because o f me. I always tried hard to get a better grade. When I got free time from school, I helped taking care of my little brother, and my older brother helped my parents in the field as we need to helped each other to make a living. I knew how to make easy money since I were young by bringing my family’s fruits and vegetables to sell at the market. </span></p><p style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><strong style="text-size-adjust: none;"><em style="text-size-adjust: none;"><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">Secondary School: </span></em></strong><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">After I have successful with my primary school in my village, I had to transfer to the secondary school in 2002 to 2004. I need to have a bike, because it was about 15 to 20 minutes by bike and I have to wait to take a ferry , if I were lucky I would go to school on time, else I would be late due to the ferry. I had a bike that was bought for my older brother, well it was not a new one as the other had, but at least I have my own transportation to go to school. While I was studied there, I always wish to get a new bike. The type of Thai bike which has a basket in the front, I was really wish so, but as my mother she is not a materialistic person, and on the other hands she has to earn money for us to go school. So, I</span></p><p style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">could not have the bike as I wish. I started to learn English, during the lunch break, so I could not able to come back home. I have to stay and eat lunch at my aunt’s house and then go to English class. I enjoyed my English class very much. I always came home in the evening, and cooked the rice ( if I arrived home earlier than my mother or brothers). During my secondary school, I love khmer literacy and English very much. They both were my favorite. Until 2004, I have finished my secondary school, and have to transferred to high school which was much more further than my secondary school.</span></p><p style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><strong style="text-size-adjust: none;"><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">High School: </span></strong><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">In 2004 to 2007 I was in high school.Again, I have to used the old bike from my older brother. I felt so excited to come to high school, but it was much works than in secondary and primary school. I have to stayed in school from early morning until evening most of the day. I needed to wake up at 4:40 am to prepared my foods and take the early private extra class at 6am because the public school started. I hardly find the break time, because I have to take so many extra classes in order to catch up better in the class. My parents needed to have more responsibility for three of us, because of my older brother needed to continue his study in the university in the capital city, and I needed more money for my extra class, and little brother would go to primary school soon too. Luckily, I got small scholarship from my teachers. So I did not need to pay for math, physic, and chemistry. My parents need to do most of the works by themselves. I really wanted to help them, but I have to donated most of my time on my study. I feel high school was the most hardest and time consuming. I was very sick for my final year, and it leaded to not have a very good result. I was very upset about that. However, I have successful with my study.</span></p><p style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><strong style="text-size-adjust: none;"><em style="text-size-adjust: none;"><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">University: </span></em></strong><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">I went to a private university in Phnom Penh, called Buld Bright University(BBU) attended Information Technology. My parents need to have a responsibility for the cost of living and school fee. It was not an easy life though. I need to stay in a small room by sharing with my friend. After 4 months, I have found a part time job in one organization called PEPY. Since then I could manage to pay the cost of living and study materials. One year later, I have decided to moved to Siem Reap with PEPY, so I transferred my study to Siem Reap also. I have enjoy my life in Siem Reap better than Phnom Penh. Even though it is far from my hometown. After seven months of studied in Siem Reap, In May fourth, there were one scholarship program that selected two students for 3 years program of Information Management to go to study in the Czech Republic. I have applied, and I was lucky that has been selected among 58 applications.</span></p><p style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">While I was study there, I have learned so many things. There were not only the subjects I learned in school, but I also got a chance to travel to many countries in Europe. At my university I got a chance to meet people from all over the world. It was very exciting for me as I came from a simple farming family. I would never imagine that I could have a chance to experiences all of these exciting things. It was my fortunate that I could come to Europe. My life style during I was in Europe was mostly exciting, however sometimes was not the way I wanted. I face some problems with foods and the weather. These both two things were the most challenging for me, but I never regret that I was there in Europe. Traveling is one of my dreams, and I was very lucky that I have been settling in Europe for few years. I have finished my bachelor degree in 2012 and has returned to my home country. </span></p><p style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><strong style="text-size-adjust: none;"><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">I have been always loved art</span></strong></p><p style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">Drawing portraits, animals, and landscapes comes as a natural talent for me. I have enjoyed drawing since I was very young, and continue to draw whenever I have time. I want to continue to develop my talent and perspective in art, no matter how long it takes, because I love what I am doing, and my art will continue to improve. I am still using only a pencil, but sometimes I will try to experiment with watercolors. I will persist with my love for art all of my life, because I also have a goal to become an artist and create many different and original works of art.</span></p><p style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><strong style="text-size-adjust: none;"><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">I enjoy writing </span></strong></p><p style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">I enjoy writing very much, and will also be writing for all of my life. I am gradually working on making many different books, and have already succeeded in publishing my first two story books for young readers through the ‘Room to Read’ program. It is my goal to publish a series of small books which will also include my drawings. The books will be easy for children to read, and will tell about real life stories in Cambodia. I am working on a novel, but it is a bigger project for the future.</span></p><p style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">Not only that, I also always love writing the short articles, and has been writing my diary since 2007. I found out that writing is always something for me to enjoy and I can remember every moment whenever I write them down.</span></p><p style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><strong style="text-size-adjust: none;"><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">I love travelling</span></strong></p><p style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">Travelling is the best way to see the world, and make myself stronger. I always enjoyed and love travelling. It is one big part of my dream. It does not matter if I travel in the local or out side of the country. I always enjoyed learning new things. Sometimes it is not predictable, We do not know what will happen while we are travelling, We have to be ready to accept whatever will happen. And through all of these things will make us grow stronger and more confident. This is what I learn from travel.</span></p>     \r\n            	2016-12-21 06:32:09.371517	1
2	CONTACT ME	contact-me	<p style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">My name is Thavry Thun (pronounced tah-vree toon). My home is in the countryside, and I am from a simple farming family. We are a happy, hard-working family. I have two brothers and no sisters. When I was a young child, I enjoyed drawing, especially drawing portraits of people. I hope you will enjoy my website and be my friend.</span></p><p style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><strong style="text-size-adjust: none;"><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">Study history</span></strong></p><p style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><strong style="text-size-adjust: none;"><em style="text-size-adjust: none;"><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">Pre-School: </span></em></strong><span style="text-size-adjust: none; font-family: Verdana, sans-serif;">I am the only one daughter in my family, and my parents always support three of us to go to school. They believe in education that change someone’s life. Compare to the other kids in my village their parents most would ask them to stop study and go to work as the garment works or the low job workers in the city. I was sent to school in 1994 to 2001.The different from my parents is that, they value in education even they have to work so hard in the rice field, and just get enough to eat and support hardly  for us to go to school. I went to school since I was five years old. My mother did not value material world very much, we grown up from a simple life style. I was not a very excellent student, but I never made my mom disappointed because o f me. I always tried hard to get a better grade. When I got free time from school, I helped taking care of my little brother, and my older brother helped my parents in the field as we need to helped each other to make a living. I knew how to make easy money since I were young by bringing my family’s fruits and vegetables to sell at the market. </span></p>     \r\n            	2016-12-21 23:10:33.29044	0
3	The Book	the-book	<span id="docs-internal-guid-603d2364-6e05-d813-1950-f9f5e2e82a74"><span style="font-size: 14.6667px; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; vertical-align: baseline; white-space: pre-wrap;">A Proper Woman" is a refreshing story that encapsulates the resilience and determination of a woman as she challenges gender inequity. Thavry's journey plants a seed in readers, inspiring them to confront injustice and work diligently towards changeA proper woman – The story of one woman’s struggle to live her dreams</span></span>     \r\n            	2017-01-05 16:46:40.314687	0
4	The Author	the-author	<span id="docs-internal-guid-2cb94144-7348-8230-2c90-725896e0cf5c"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size: 14.6667px; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; vertical-align: baseline; white-space: pre-wrap;">Thavry Thon has received her bachelor degree from the University of Hradec Kralove, Czech Republic with a major in Information Management. She was born and raised in a very simple farming family on a remote small island on the Bassac River in Cambodia. Her family always supported her and valued education very much. They encouraged her to pursue higher education, and has given her the freedom to do what she loves. Her parents always told her that ‘education’ is the key to success and will reduce poverty in Cambodia.</span></p><br><span style="font-size: 14.6667px; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; vertical-align: baseline; white-space: pre-wrap;">Thavry is currently managing director at Toursanak Adventures tour agency. She is also an author, travel blogger, translator and trip leader. Since childhood she dreamed of becoming a writer, and travel the world. She has published two children’s books in 2010 and 2011 with Room to Read, and an inspirational book with a Taiwanese company in 2013. She has always enjoyed traveling within Cambodia and abroad. </span></span>     \r\n            	2017-01-06 17:17:31.850177	0
5	Editor	editor	<span id="docs-internal-guid-2cb94144-7348-a56b-a792-36543374dcdd"><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size: 14.6667px; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; vertical-align: baseline; white-space: pre-wrap;">Peter Ford came to Cambodia in 2014 to work at the Khmer Rouge tribunal. He stayed, and has spent much of the past two years as a journalist and editor.</span></p><br><p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size: 14.6667px; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; vertical-align: baseline; white-space: pre-wrap;">He grew up in England and has a Masters degree in Geopolitics and Security from King’s College, London. He has lived in Japan, Kazakhstan, Sierra Leone and Senegal, has travelled to almost 50 countries, and is well aware he has many more to go . He has seen more of Asia than Thavry, although she is quickly catching up. He can often be found on a bicycle looking hot and tired.</span></p><div><span style="font-size: 14.6667px; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; vertical-align: baseline; white-space: pre-wrap;"><br></span></div></span>     \r\n            	2017-01-06 17:17:49.017347	0
\.


--
-- Name: page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('page_id_seq', 5, true);


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY post (id, title, description, feature_image, slug, category_id, images, price, user_id, published_at, views) FROM stdin;
2	The proper woman	<div>THE AMAZING STORY OF HUXIHope's Magic Sparkles is our second book in our Hope the Optimist Bear collection. Our first book was published last spring called Hope the Optimist Bear. This is our second book and bear we will be delivering to local hospitals for pediatric patients. The main character in this years book 'Christopher' was based on a little boy who actually received last years Hope the Optimist Bear book and Hope Bear. Please know it was made with love and our students are always so proud to see that their hard work will touch the lives of so many sick children. The main character in this years book 'Christopher' was based on a little boy who actually received last years Hope the Optimist Bear book and Hope Bear. Please know it was made with love and our students are always so proud to see that their hard work will touch the lives of so many sick children.<br></div><div>THE AMAZING STORY OF HUXIHope's Magic Sparkles is our second book in our Hope the Optimist Bear collection. Our first book was published last spring called Hope the Optimist Bear. This is our second book and bear we will be delivering to local hospitals for pediatric patients. The main character in this years book 'Christopher' was based on a little boy who actually received last years Hope the Optimist Bear book and Hope Bear. Please know it was made with love and our students are always so proud to see that their hard work will touch the lives of so many sick children. The main character in this years book 'Christopher' was based on a little boy who actually received last years Hope the Optimist Bear book and Hope Bear. Please know it was made with love and our students are always so proud to see that their hard work will touch the lives of so many sick children.<br></div><div>THE AMAZING STORY OF HUXIHope's Magic Sparkles is our second book in our Hope the Optimist Bear collection. Our first book was published last spring called Hope the Optimist Bear. This is our second book and bear we will be delivering to local hospitals for pediatric patients. The main character in this years book 'Christopher' was based on a little boy who actually received last years Hope the Optimist Bear book and Hope Bear. Please know it was made with love and our students are always so proud to see that their hard work will touch the lives of so many sick children. The main character in this years book 'Christopher' was based on a little boy who actually received last years Hope the Optimist Bear book and Hope Bear. Please know it was made with love and our students are always so proud to see that their hard work will touch the lives of so many sick children.<br></div><div>THE AMAZING STORY OF HUXIHope's Magic Sparkles is our second book in our Hope the Optimist Bear collection. Our first book was published last spring called Hope the Optimist Bear. This is our second book and bear we will be delivering to local hospitals for pediatric patients. The main character in this years book 'Christopher' was based on a little boy who actually received last years Hope the Optimist Bear book and Hope Bear. Please know it was made with love and our students are always so proud to see that their hard work will touch the lives of so many sick children. The main character in this years book 'Christopher' was based on a little boy who actually received last years Hope the Optimist Bear book and Hope Bear. Please know it was made with love and our students are always so proud to see that their hard work will touch the lives of so many sick children.<br></div><div><br></div>	data:image/jpeg;base64,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	the-proper-woman	2	20161221103305369807-logo.png$$$$$20161221103305369807-twitter.png$$$$$20161221103305369807-book2.jpg	10	1	2016-12-21 05:07:45.819629	5
4	test	<p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;">Traveling is the best way to explore the world that is different than our own. And that is very true. I have enjoyed every single time of my travel even though, I had always carry my lower back pain. I never let it destroy the joy and experiences I am going to earn. One other thing I do enjoy is coming home in my village.</p><p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><a href="http://thavry.com/wp-content/uploads/2016/12/girl-watching-life.jpg" style="text-size-adjust: none; color: rgb(51, 51, 51); text-decoration: underline;"></a></p><div class="pinterest-wrap alignnone" style="text-size-adjust: none; position: relative; text-align: center;"><a href="http://thavry.com/wp-content/uploads/2016/12/girl-watching-life.jpg" style="text-size-adjust: none; color: rgb(51, 51, 51); text-decoration: underline;"><img class="alignnone size-full wp-image-1101" src="http://thavry.com/wp-content/uploads/2016/12/girl-watching-life.jpg" alt="girl-watching-life" width="1280" height="720" srcset="http://thavry.com/wp-content/uploads/2016/12/girl-watching-life.jpg 1280w, http://thavry.com/wp-content/uploads/2016/12/girl-watching-life-300x169.jpg 300w, http://thavry.com/wp-content/uploads/2016/12/girl-watching-life-768x432.jpg 768w, http://thavry.com/wp-content/uploads/2016/12/girl-watching-life-1024x576.jpg 1024w, http://thavry.com/wp-content/uploads/2016/12/girl-watching-life-200x113.jpg 200w" sizes="(max-width: 1280px) 100vw, 1280px" style="text-size-adjust: none; height: auto; max-width: 100%;"></a></div><p></p><p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;">Coming back home to do the homestay with 10 – 12 students and by staying with the local people, the people I know ever since I was born. It has given me very privilege to come back and work with them. I have always enjoy being home.</p><p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;">You would not imagine that from this poor community on the remote island has so much joy and laughter. They are just very simple people live day to day fill with simple food on the table, earn some money to support life and so much laugh out together. I would say, we are happy people. Even we don’t own like one million dollar house, or paying ten thousand dollars holiday, but one thing we own is happiness, freedom and laughter.</p><p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><a href="http://thavry.com/wp-content/uploads/2016/12/movie-kids.jpg" style="text-size-adjust: none; color: rgb(51, 51, 51); text-decoration: underline;"></a></p><div class="pinterest-wrap alignnone" style="text-size-adjust: none; position: relative; text-align: center;"><a href="http://thavry.com/wp-content/uploads/2016/12/movie-kids.jpg" style="text-size-adjust: none; color: rgb(51, 51, 51); text-decoration: underline;"><img class="alignnone size-full wp-image-1102" src="http://thavry.com/wp-content/uploads/2016/12/movie-kids.jpg" alt="movie-kids" width="960" height="525" srcset="http://thavry.com/wp-content/uploads/2016/12/movie-kids.jpg 960w, http://thavry.com/wp-content/uploads/2016/12/movie-kids-300x164.jpg 300w, http://thavry.com/wp-content/uploads/2016/12/movie-kids-768x420.jpg 768w, http://thavry.com/wp-content/uploads/2016/12/movie-kids-200x109.jpg 200w" sizes="(max-width: 960px) 100vw, 960px" style="text-size-adjust: none; height: auto; max-width: 100%;"></a></div><p></p><p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;">I love the island life. The carefree life style, the place I feel safe, and love. The home made food, the fresh fruits from the tree, the many cups of coffee and tea made in my own kitchen. I just can’t find any other place like this.</p><p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;">I love whenever we finish the dinner, the villagers came to hangout, sit around our dinner table, and laugh from every little thing we talk about. We laugh so hard so much all the time. We flash at each other’s smile. We have so much fun being together. We laugh hours after hours from every crazy funny jokes. I just love the island life.</p><p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><a href="http://thavry.com/wp-content/uploads/2016/12/laugh-is-simple.jpg" style="text-size-adjust: none; color: rgb(51, 51, 51); text-decoration: underline;"></a></p><div class="pinterest-wrap alignnone" style="text-size-adjust: none; position: relative; text-align: center;"><a href="http://thavry.com/wp-content/uploads/2016/12/laugh-is-simple.jpg" style="text-size-adjust: none; color: rgb(51, 51, 51); text-decoration: underline;"><img class="alignnone size-full wp-image-1103" src="http://thavry.com/wp-content/uploads/2016/12/laugh-is-simple.jpg" alt="laugh-is-simple" width="1280" height="720" srcset="http://thavry.com/wp-content/uploads/2016/12/laugh-is-simple.jpg 1280w, http://thavry.com/wp-content/uploads/2016/12/laugh-is-simple-300x169.jpg 300w, http://thavry.com/wp-content/uploads/2016/12/laugh-is-simple-768x432.jpg 768w, http://thavry.com/wp-content/uploads/2016/12/laugh-is-simple-1024x576.jpg 1024w, http://thavry.com/wp-content/uploads/2016/12/laugh-is-simple-200x113.jpg 200w" sizes="(max-width: 1280px) 100vw, 1280px" style="text-size-adjust: none; height: auto; max-width: 100%;"></a></div><p></p><p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;">What does it take to make the life full of laughter and joy with carefree lifestyle? I just love every minutes of my life. The very happy and freedom life. The sense of community, sharing, love, laughter, and that what makes my returning home with so much fun and enjoyable.</p><p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;">I never feel like working, I never stress out myself to looking forward to holidays. I don’t need to wait to the end of the year to get 3 to 4 weeks holidays break. When everyday I live my life the way I want it to be, and I have everyday is a holiday.</p>	data:image/jpeg;base64,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	test	6		0	1	2016-12-21 21:39:34.082633	2
1	This is my text	<p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;">Traveling is the best way to explore the world that is different than our own. And that is very true. I have enjoyed every single time of my travel even though, I had always carry my lower back pain. I never let it destroy the joy and experiences I am going to earn. One other thing I do enjoy is coming home in my village.</p><p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><a href="http://thavry.com/wp-content/uploads/2016/12/girl-watching-life.jpg" style="text-size-adjust: none; color: rgb(51, 51, 51); text-decoration: underline;"></a></p><div class="pinterest-wrap alignnone" style="text-size-adjust: none; position: relative; text-align: center;"><a href="http://thavry.com/wp-content/uploads/2016/12/girl-watching-life.jpg" style="text-size-adjust: none; color: rgb(51, 51, 51); text-decoration: underline;"><img class="alignnone size-full wp-image-1101" src="http://thavry.com/wp-content/uploads/2016/12/girl-watching-life.jpg" alt="girl-watching-life" width="1280" height="720" srcset="http://thavry.com/wp-content/uploads/2016/12/girl-watching-life.jpg 1280w, http://thavry.com/wp-content/uploads/2016/12/girl-watching-life-300x169.jpg 300w, http://thavry.com/wp-content/uploads/2016/12/girl-watching-life-768x432.jpg 768w, http://thavry.com/wp-content/uploads/2016/12/girl-watching-life-1024x576.jpg 1024w, http://thavry.com/wp-content/uploads/2016/12/girl-watching-life-200x113.jpg 200w" sizes="(max-width: 1280px) 100vw, 1280px" style="text-size-adjust: none; height: auto; max-width: 100%;"></a></div><p></p><p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;">Coming back home to do the homestay with 10 – 12 students and by staying with the local people, the people I know ever since I was born. It has given me very privilege to come back and work with them. I have always enjoy being home.</p><p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;">You would not imagine that from this poor community on the remote island has so much joy and laughter. They are just very simple people live day to day fill with simple food on the table, earn some money to support life and so much laugh out together. I would say, we are happy people. Even we don’t own like one million dollar house, or paying ten thousand dollars holiday, but one thing we own is happiness, freedom and laughter.</p><p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><a href="http://thavry.com/wp-content/uploads/2016/12/movie-kids.jpg" style="text-size-adjust: none; color: rgb(51, 51, 51); text-decoration: underline;"></a></p><div class="pinterest-wrap alignnone" style="text-size-adjust: none; position: relative; text-align: center;"><a href="http://thavry.com/wp-content/uploads/2016/12/movie-kids.jpg" style="text-size-adjust: none; color: rgb(51, 51, 51); text-decoration: underline;"><img class="alignnone size-full wp-image-1102" src="http://thavry.com/wp-content/uploads/2016/12/movie-kids.jpg" alt="movie-kids" width="960" height="525" srcset="http://thavry.com/wp-content/uploads/2016/12/movie-kids.jpg 960w, http://thavry.com/wp-content/uploads/2016/12/movie-kids-300x164.jpg 300w, http://thavry.com/wp-content/uploads/2016/12/movie-kids-768x420.jpg 768w, http://thavry.com/wp-content/uploads/2016/12/movie-kids-200x109.jpg 200w" sizes="(max-width: 960px) 100vw, 960px" style="text-size-adjust: none; height: auto; max-width: 100%;"></a></div><p></p><p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;">I love the island life. The carefree life style, the place I feel safe, and love. The home made food, the fresh fruits from the tree, the many cups of coffee and tea made in my own kitchen. I just can’t find any other place like this.</p><p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;">I love whenever we finish the dinner, the villagers came to hangout, sit around our dinner table, and laugh from every little thing we talk about. We laugh so hard so much all the time. We flash at each other’s smile. We have so much fun being together. We laugh hours after hours from every crazy funny jokes. I just love the island life.</p><p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;"><a href="http://thavry.com/wp-content/uploads/2016/12/laugh-is-simple.jpg" style="text-size-adjust: none; color: rgb(51, 51, 51); text-decoration: underline;"></a></p><div class="pinterest-wrap alignnone" style="text-size-adjust: none; position: relative; text-align: center;"><a href="http://thavry.com/wp-content/uploads/2016/12/laugh-is-simple.jpg" style="text-size-adjust: none; color: rgb(51, 51, 51); text-decoration: underline;"><img class="alignnone size-full wp-image-1103" src="http://thavry.com/wp-content/uploads/2016/12/laugh-is-simple.jpg" alt="laugh-is-simple" width="1280" height="720" srcset="http://thavry.com/wp-content/uploads/2016/12/laugh-is-simple.jpg 1280w, http://thavry.com/wp-content/uploads/2016/12/laugh-is-simple-300x169.jpg 300w, http://thavry.com/wp-content/uploads/2016/12/laugh-is-simple-768x432.jpg 768w, http://thavry.com/wp-content/uploads/2016/12/laugh-is-simple-1024x576.jpg 1024w, http://thavry.com/wp-content/uploads/2016/12/laugh-is-simple-200x113.jpg 200w" sizes="(max-width: 1280px) 100vw, 1280px" style="text-size-adjust: none; height: auto; max-width: 100%;"></a></div><p></p><p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;">What does it take to make the life full of laughter and joy with carefree lifestyle? I just love every minutes of my life. The very happy and freedom life. The sense of community, sharing, love, laughter, and that what makes my returning home with so much fun and enjoyable.</p><p lang="zxx" style="text-size-adjust: none; margin-bottom: 0px; padding-bottom: 20px; color: rgb(1, 1, 1); font-family: "Open Sans"; font-size: 16px;">I never feel like working, I never stress out myself to looking forward to holidays. I don’t need to wait to the end of the year to get 3 to 4 weeks holidays break. When everyday I live my life the way I want it to be, and I have everyday is a holiday.</p>	data:image/jpeg;base64,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	this-is-my-text	2		0	1	2016-12-21 04:14:39.228755	1
\.


--
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('post_id_seq', 4, true);


--
-- Data for Name: request_trail; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY request_trail (id, name, slug, email, comment, published_at) FROM stdin;
1	Kimsal	kimsal	kimsalsan007@gmail.com	gttdfdf	2017-01-06 17:09:31.179578
\.


--
-- Name: request_trail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('request_trail_id_seq', 2, true);


--
-- Data for Name: user_member; Type: TABLE DATA; Schema: public; Owner: blog
--

COPY user_member (id, name, email, password, password2, created_at) FROM stdin;
1	kimsal	kimsalsan007@gmail.com	$6$rounds=656000$1Xy2O.A8Cp311rSg$ytXiaFVk21i0Bd0DnzaGfxzmDxed89scxIi4P/cnNBxCMSB4OqWxhhXkQ7RnXTzGS7PXt82JbQoUF9uePhRkT0	123	2016-12-21 04:08:07.343226
\.


--
-- Name: user_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog
--

SELECT pg_catalog.setval('user_member_id_seq', 1, true);


--
-- Name: booking_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id);


--
-- Name: category_name_key; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_name_key UNIQUE (name);


--
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: page_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_pkey PRIMARY KEY (id);


--
-- Name: page_title_key; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_title_key UNIQUE (title);


--
-- Name: post_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- Name: post_slug_key; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_slug_key UNIQUE (slug);


--
-- Name: post_title_key; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_title_key UNIQUE (title);


--
-- Name: request_trail_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY request_trail
    ADD CONSTRAINT request_trail_pkey PRIMARY KEY (id);


--
-- Name: user_member_email_key; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY user_member
    ADD CONSTRAINT user_member_email_key UNIQUE (email);


--
-- Name: user_member_pkey; Type: CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY user_member
    ADD CONSTRAINT user_member_pkey PRIMARY KEY (id);


--
-- Name: booking_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY booking
    ADD CONSTRAINT booking_post_id_fkey FOREIGN KEY (post_id) REFERENCES post(id);


--
-- Name: post_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_category_id_fkey FOREIGN KEY (category_id) REFERENCES category(id);


--
-- Name: post_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blog
--

ALTER TABLE ONLY post
    ADD CONSTRAINT post_user_id_fkey FOREIGN KEY (user_id) REFERENCES user_member(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

