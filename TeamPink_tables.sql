-- Table: public.hashtag

-- DROP TABLE public.hashtag;

CREATE TABLE public.hashtag
(
    h_text character varying(255) COLLATE "default".pg_catalog NOT NULL,
    CONSTRAINT hashtag_pkey PRIMARY KEY (h_text)
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
    "time" timestamp without time zone NOT NULL,
    retweet_count integer,
    favorite_count integer,
    CONSTRAINT text_pkey PRIMARY KEY ("time")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.text

-- Table: public.includes

-- DROP TABLE public.includes;

CREATE TABLE public.includes
(
    "time" timestamp without time zone NOT NULL,
    h_text character varying COLLATE "default".pg_catalog NOT NULL,
    CONSTRAINT includes_pkey PRIMARY KEY (h_text, "time"),
    CONSTRAINT h_text FOREIGN KEY (h_text)
        REFERENCES public.hashtag (h_text) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "time" FOREIGN KEY ("time")
        REFERENCES public.text ("time") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.includes
    OWNER to student;
    OWNER to student;