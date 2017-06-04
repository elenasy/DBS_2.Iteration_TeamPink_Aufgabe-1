-- Table: public.hashtag

-- DROP TABLE public.hashtag;

CREATE TABLE public.hashtag
(
    "ID_hashtag" integer NOT NULL,
    "h_text" character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT hashtag_pkey PRIMARY KEY ("ID_hashtag")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.hashtag
    OWNER to student;





-- Table: public.text

-- DROP TABLE public.text;

CREATE TABLE public.text
(
    retweet_count integer,
    favorite_count integer,
    date date,
    "time" timestamp without time zone,
    "ID_text" integer NOT NULL,
    CONSTRAINT text_pkey PRIMARY KEY ("ID_text")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.text
    OWNER to student;






-- Table: public.includes

-- DROP TABLE public.includes;

CREATE TABLE public.includes
(
    "ID_text" integer NOT NULL,
    "ID_hashtag" integer NOT NULL,
    CONSTRAINT includes_pkey PRIMARY KEY ("ID_hashtag", "ID_text"),
    CONSTRAINT "ID_hashtag" FOREIGN KEY ("ID_hashtag")
        REFERENCES public.hashtag ("ID_hashtag") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "ID_text" FOREIGN KEY ("ID_text")
        REFERENCES public.text ("ID_text") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.includes
    OWNER to student;
    
    
    
    
    
-- Table: public.is_retweet

-- DROP TABLE public.is_retweet;

CREATE TABLE public.is_retweet
(
    retweet_count integer,
    favorite_count integer,
    date date, 
    "time" time without time zone,
    "ID_text" integer,
    org_author character varying(127) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT is_retweet_pkey PRIMARY KEY (org_author),
    CONSTRAINT "ID_text" FOREIGN KEY ("ID_text")
        REFERENCES public.text ("ID_text") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
    INHERITS (public.text)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.is_retweet
    OWNER to student;
