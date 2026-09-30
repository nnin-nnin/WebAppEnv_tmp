--
-- PostgreSQL database dump
--

\restrict UsYjKOyKrkKJWHWJ85AroeAc0OXmDT7Ubdan8M6Or4chG2KzXbYRGGiAKeMZjX2

-- Dumped from database version 16.15
-- Dumped by pg_dump version 16.15

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

ALTER TABLE IF EXISTS ONLY public.thredded_messageboard_users DROP CONSTRAINT IF EXISTS fk_rails_966803d714;
ALTER TABLE IF EXISTS ONLY public.thredded_user_post_notifications DROP CONSTRAINT IF EXISTS fk_rails_5908eec802;
ALTER TABLE IF EXISTS ONLY public.thredded_user_post_notifications DROP CONSTRAINT IF EXISTS fk_rails_364d7e370a;
ALTER TABLE IF EXISTS ONLY public.thredded_messageboard_users DROP CONSTRAINT IF EXISTS fk_rails_06e42c62f5;
DROP INDEX IF EXISTS public.users_name_lower;
DROP INDEX IF EXISTS public.thredded_user_topic_read_states_user_postable;
DROP INDEX IF EXISTS public.thredded_user_topic_read_states_user_messageboard;
DROP INDEX IF EXISTS public.thredded_user_topic_follows_user_topic;
DROP INDEX IF EXISTS public.thredded_user_private_topic_read_states_user_postable;
DROP INDEX IF EXISTS public.thredded_user_messageboard_preferences_user_id_messageboard_id;
DROP INDEX IF EXISTS public.thredded_topics_title_fts;
DROP INDEX IF EXISTS public.thredded_posts_content_fts;
DROP INDEX IF EXISTS public.thredded_notifications_for_private_topics_unique;
DROP INDEX IF EXISTS public.thredded_notifications_for_followed_topics_unique;
DROP INDEX IF EXISTS public.thredded_messageboard_notifications_for_followed_topics_unique;
DROP INDEX IF EXISTS public.thredded_categories_name_ci;
DROP INDEX IF EXISTS public.index_thredded_user_topic_read_states_on_messageboard_id;
DROP INDEX IF EXISTS public.index_thredded_user_preferences_on_user_id;
DROP INDEX IF EXISTS public.index_thredded_user_post_notifications_on_user_id_and_post_id;
DROP INDEX IF EXISTS public.index_thredded_user_post_notifications_on_post_id;
DROP INDEX IF EXISTS public.index_thredded_user_details_on_user_id;
DROP INDEX IF EXISTS public.index_thredded_user_details_on_latest_activity_at;
DROP INDEX IF EXISTS public.index_thredded_user_details_for_moderations;
DROP INDEX IF EXISTS public.index_thredded_topics_on_user_id;
DROP INDEX IF EXISTS public.index_thredded_topics_on_slug;
DROP INDEX IF EXISTS public.index_thredded_topics_on_messageboard_id;
DROP INDEX IF EXISTS public.index_thredded_topics_on_last_post_at;
DROP INDEX IF EXISTS public.index_thredded_topics_on_hash_id;
DROP INDEX IF EXISTS public.index_thredded_topics_for_display;
DROP INDEX IF EXISTS public.index_thredded_topic_categories_on_topic_id;
DROP INDEX IF EXISTS public.index_thredded_topic_categories_on_category_id;
DROP INDEX IF EXISTS public.index_thredded_private_users_on_user_id;
DROP INDEX IF EXISTS public.index_thredded_private_users_on_private_topic_id;
DROP INDEX IF EXISTS public.index_thredded_private_topics_on_slug;
DROP INDEX IF EXISTS public.index_thredded_private_topics_on_last_post_at;
DROP INDEX IF EXISTS public.index_thredded_private_topics_on_hash_id;
DROP INDEX IF EXISTS public.index_thredded_private_posts_on_postable_id_and_created_at;
DROP INDEX IF EXISTS public.index_thredded_posts_on_user_id;
DROP INDEX IF EXISTS public.index_thredded_posts_on_postable_id_and_created_at;
DROP INDEX IF EXISTS public.index_thredded_posts_on_postable_id;
DROP INDEX IF EXISTS public.index_thredded_posts_on_messageboard_id;
DROP INDEX IF EXISTS public.index_thredded_posts_for_display;
DROP INDEX IF EXISTS public.index_thredded_moderation_records_for_display;
DROP INDEX IF EXISTS public.index_thredded_messageboards_on_slug;
DROP INDEX IF EXISTS public.index_thredded_messageboards_on_messageboard_group_id;
DROP INDEX IF EXISTS public.index_thredded_messageboard_users_primary;
DROP INDEX IF EXISTS public.index_thredded_messageboard_users_for_recently_active;
DROP INDEX IF EXISTS public.index_thredded_categories_on_messageboard_id_and_slug;
DROP INDEX IF EXISTS public.index_thredded_categories_on_messageboard_id;
DROP INDEX IF EXISTS public.index_friendly_id_slugs_on_sluggable_type;
DROP INDEX IF EXISTS public.index_friendly_id_slugs_on_sluggable_id;
DROP INDEX IF EXISTS public.index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope;
DROP INDEX IF EXISTS public.index_friendly_id_slugs_on_slug_and_sluggable_type;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_user_topic_read_states DROP CONSTRAINT IF EXISTS thredded_user_topic_read_states_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_user_topic_follows DROP CONSTRAINT IF EXISTS thredded_user_topic_follows_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_user_private_topic_read_states DROP CONSTRAINT IF EXISTS thredded_user_private_topic_read_states_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_user_preferences DROP CONSTRAINT IF EXISTS thredded_user_preferences_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_user_post_notifications DROP CONSTRAINT IF EXISTS thredded_user_post_notifications_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_user_messageboard_preferences DROP CONSTRAINT IF EXISTS thredded_user_messageboard_preferences_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_user_details DROP CONSTRAINT IF EXISTS thredded_user_details_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_topics DROP CONSTRAINT IF EXISTS thredded_topics_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_topic_categories DROP CONSTRAINT IF EXISTS thredded_topic_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_private_users DROP CONSTRAINT IF EXISTS thredded_private_users_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_private_topics DROP CONSTRAINT IF EXISTS thredded_private_topics_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_private_posts DROP CONSTRAINT IF EXISTS thredded_private_posts_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_posts DROP CONSTRAINT IF EXISTS thredded_posts_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_post_moderation_records DROP CONSTRAINT IF EXISTS thredded_post_moderation_records_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_notifications_for_private_topics DROP CONSTRAINT IF EXISTS thredded_notifications_for_private_topics_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_notifications_for_followed_topics DROP CONSTRAINT IF EXISTS thredded_notifications_for_followed_topics_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_messageboards DROP CONSTRAINT IF EXISTS thredded_messageboards_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_messageboard_users DROP CONSTRAINT IF EXISTS thredded_messageboard_users_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_messageboard_notifications_for_followed_topics DROP CONSTRAINT IF EXISTS thredded_messageboard_notifications_for_followed_topics_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_messageboard_groups DROP CONSTRAINT IF EXISTS thredded_messageboard_groups_pkey;
ALTER TABLE IF EXISTS ONLY public.thredded_categories DROP CONSTRAINT IF EXISTS thredded_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.schema_migrations DROP CONSTRAINT IF EXISTS schema_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.friendly_id_slugs DROP CONSTRAINT IF EXISTS friendly_id_slugs_pkey;
ALTER TABLE IF EXISTS ONLY public.ar_internal_metadata DROP CONSTRAINT IF EXISTS ar_internal_metadata_pkey;
ALTER TABLE IF EXISTS public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_user_topic_read_states ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_user_topic_follows ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_user_private_topic_read_states ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_user_preferences ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_user_post_notifications ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_user_messageboard_preferences ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_user_details ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_topics ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_topic_categories ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_private_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_private_topics ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_private_posts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_posts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_post_moderation_records ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_notifications_for_private_topics ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_notifications_for_followed_topics ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_messageboards ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_messageboard_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_messageboard_notifications_for_followed_topics ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_messageboard_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.thredded_categories ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.friendly_id_slugs ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.users_id_seq;
DROP TABLE IF EXISTS public.users;
DROP SEQUENCE IF EXISTS public.thredded_user_topic_read_states_id_seq;
DROP TABLE IF EXISTS public.thredded_user_topic_read_states;
DROP SEQUENCE IF EXISTS public.thredded_user_topic_follows_id_seq;
DROP TABLE IF EXISTS public.thredded_user_topic_follows;
DROP SEQUENCE IF EXISTS public.thredded_user_private_topic_read_states_id_seq;
DROP TABLE IF EXISTS public.thredded_user_private_topic_read_states;
DROP SEQUENCE IF EXISTS public.thredded_user_preferences_id_seq;
DROP TABLE IF EXISTS public.thredded_user_preferences;
DROP SEQUENCE IF EXISTS public.thredded_user_post_notifications_id_seq;
DROP TABLE IF EXISTS public.thredded_user_post_notifications;
DROP SEQUENCE IF EXISTS public.thredded_user_messageboard_preferences_id_seq;
DROP TABLE IF EXISTS public.thredded_user_messageboard_preferences;
DROP SEQUENCE IF EXISTS public.thredded_user_details_id_seq;
DROP TABLE IF EXISTS public.thredded_user_details;
DROP SEQUENCE IF EXISTS public.thredded_topics_id_seq;
DROP TABLE IF EXISTS public.thredded_topics;
DROP SEQUENCE IF EXISTS public.thredded_topic_categories_id_seq;
DROP TABLE IF EXISTS public.thredded_topic_categories;
DROP SEQUENCE IF EXISTS public.thredded_private_users_id_seq;
DROP TABLE IF EXISTS public.thredded_private_users;
DROP SEQUENCE IF EXISTS public.thredded_private_topics_id_seq;
DROP TABLE IF EXISTS public.thredded_private_topics;
DROP SEQUENCE IF EXISTS public.thredded_private_posts_id_seq;
DROP TABLE IF EXISTS public.thredded_private_posts;
DROP SEQUENCE IF EXISTS public.thredded_posts_id_seq;
DROP TABLE IF EXISTS public.thredded_posts;
DROP SEQUENCE IF EXISTS public.thredded_post_moderation_records_id_seq;
DROP TABLE IF EXISTS public.thredded_post_moderation_records;
DROP SEQUENCE IF EXISTS public.thredded_notifications_for_private_topics_id_seq;
DROP TABLE IF EXISTS public.thredded_notifications_for_private_topics;
DROP SEQUENCE IF EXISTS public.thredded_notifications_for_followed_topics_id_seq;
DROP TABLE IF EXISTS public.thredded_notifications_for_followed_topics;
DROP SEQUENCE IF EXISTS public.thredded_messageboards_id_seq;
DROP TABLE IF EXISTS public.thredded_messageboards;
DROP SEQUENCE IF EXISTS public.thredded_messageboard_users_id_seq;
DROP TABLE IF EXISTS public.thredded_messageboard_users;
DROP SEQUENCE IF EXISTS public.thredded_messageboard_notifications_for_followed_topics_id_seq;
DROP TABLE IF EXISTS public.thredded_messageboard_notifications_for_followed_topics;
DROP SEQUENCE IF EXISTS public.thredded_messageboard_groups_id_seq;
DROP TABLE IF EXISTS public.thredded_messageboard_groups;
DROP SEQUENCE IF EXISTS public.thredded_categories_id_seq;
DROP TABLE IF EXISTS public.thredded_categories;
DROP TABLE IF EXISTS public.schema_migrations;
DROP SEQUENCE IF EXISTS public.friendly_id_slugs_id_seq;
DROP TABLE IF EXISTS public.friendly_id_slugs;
DROP TABLE IF EXISTS public.ar_internal_metadata;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friendly_id_slugs (
    id bigint NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);


ALTER TABLE public.friendly_id_slugs OWNER TO postgres;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNER TO postgres;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: thredded_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_categories (
    id bigint NOT NULL,
    messageboard_id bigint NOT NULL,
    name text NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug text NOT NULL
);


ALTER TABLE public.thredded_categories OWNER TO postgres;

--
-- Name: thredded_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_categories_id_seq OWNER TO postgres;

--
-- Name: thredded_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_categories_id_seq OWNED BY public.thredded_categories.id;


--
-- Name: thredded_messageboard_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_messageboard_groups (
    id bigint NOT NULL,
    name character varying,
    "position" integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.thredded_messageboard_groups OWNER TO postgres;

--
-- Name: thredded_messageboard_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_messageboard_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_messageboard_groups_id_seq OWNER TO postgres;

--
-- Name: thredded_messageboard_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_messageboard_groups_id_seq OWNED BY public.thredded_messageboard_groups.id;


--
-- Name: thredded_messageboard_notifications_for_followed_topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_messageboard_notifications_for_followed_topics (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    messageboard_id bigint NOT NULL,
    notifier_key character varying(90) NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.thredded_messageboard_notifications_for_followed_topics OWNER TO postgres;

--
-- Name: thredded_messageboard_notifications_for_followed_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_messageboard_notifications_for_followed_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_messageboard_notifications_for_followed_topics_id_seq OWNER TO postgres;

--
-- Name: thredded_messageboard_notifications_for_followed_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_messageboard_notifications_for_followed_topics_id_seq OWNED BY public.thredded_messageboard_notifications_for_followed_topics.id;


--
-- Name: thredded_messageboard_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_messageboard_users (
    id bigint NOT NULL,
    thredded_user_detail_id bigint NOT NULL,
    thredded_messageboard_id bigint NOT NULL,
    last_seen_at timestamp without time zone NOT NULL
);


ALTER TABLE public.thredded_messageboard_users OWNER TO postgres;

--
-- Name: thredded_messageboard_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_messageboard_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_messageboard_users_id_seq OWNER TO postgres;

--
-- Name: thredded_messageboard_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_messageboard_users_id_seq OWNED BY public.thredded_messageboard_users.id;


--
-- Name: thredded_messageboards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_messageboards (
    id bigint NOT NULL,
    name text NOT NULL,
    slug text,
    description text,
    topics_count integer DEFAULT 0,
    posts_count integer DEFAULT 0,
    "position" integer NOT NULL,
    last_topic_id bigint,
    messageboard_group_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    locked boolean DEFAULT false NOT NULL
);


ALTER TABLE public.thredded_messageboards OWNER TO postgres;

--
-- Name: thredded_messageboards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_messageboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_messageboards_id_seq OWNER TO postgres;

--
-- Name: thredded_messageboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_messageboards_id_seq OWNED BY public.thredded_messageboards.id;


--
-- Name: thredded_notifications_for_followed_topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_notifications_for_followed_topics (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    notifier_key character varying(90) NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.thredded_notifications_for_followed_topics OWNER TO postgres;

--
-- Name: thredded_notifications_for_followed_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_notifications_for_followed_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_notifications_for_followed_topics_id_seq OWNER TO postgres;

--
-- Name: thredded_notifications_for_followed_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_notifications_for_followed_topics_id_seq OWNED BY public.thredded_notifications_for_followed_topics.id;


--
-- Name: thredded_notifications_for_private_topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_notifications_for_private_topics (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    notifier_key character varying(90) NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.thredded_notifications_for_private_topics OWNER TO postgres;

--
-- Name: thredded_notifications_for_private_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_notifications_for_private_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_notifications_for_private_topics_id_seq OWNER TO postgres;

--
-- Name: thredded_notifications_for_private_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_notifications_for_private_topics_id_seq OWNED BY public.thredded_notifications_for_private_topics.id;


--
-- Name: thredded_post_moderation_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_post_moderation_records (
    id bigint NOT NULL,
    post_id bigint,
    messageboard_id bigint,
    post_content text,
    post_user_id bigint,
    post_user_name text,
    moderator_id bigint,
    moderation_state integer NOT NULL,
    previous_moderation_state integer NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.thredded_post_moderation_records OWNER TO postgres;

--
-- Name: thredded_post_moderation_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_post_moderation_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_post_moderation_records_id_seq OWNER TO postgres;

--
-- Name: thredded_post_moderation_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_post_moderation_records_id_seq OWNED BY public.thredded_post_moderation_records.id;


--
-- Name: thredded_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_posts (
    id bigint NOT NULL,
    user_id bigint,
    content text,
    source character varying(191) DEFAULT 'web'::character varying,
    postable_id bigint NOT NULL,
    messageboard_id bigint NOT NULL,
    moderation_state integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.thredded_posts OWNER TO postgres;

--
-- Name: thredded_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_posts_id_seq OWNER TO postgres;

--
-- Name: thredded_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_posts_id_seq OWNED BY public.thredded_posts.id;


--
-- Name: thredded_private_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_private_posts (
    id bigint NOT NULL,
    user_id bigint,
    content text,
    postable_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.thredded_private_posts OWNER TO postgres;

--
-- Name: thredded_private_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_private_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_private_posts_id_seq OWNER TO postgres;

--
-- Name: thredded_private_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_private_posts_id_seq OWNED BY public.thredded_private_posts.id;


--
-- Name: thredded_private_topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_private_topics (
    id bigint NOT NULL,
    user_id bigint,
    last_user_id bigint,
    title text NOT NULL,
    slug text NOT NULL,
    posts_count integer DEFAULT 0,
    hash_id character varying(20) NOT NULL,
    last_post_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.thredded_private_topics OWNER TO postgres;

--
-- Name: thredded_private_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_private_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_private_topics_id_seq OWNER TO postgres;

--
-- Name: thredded_private_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_private_topics_id_seq OWNED BY public.thredded_private_topics.id;


--
-- Name: thredded_private_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_private_users (
    id bigint NOT NULL,
    private_topic_id bigint,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.thredded_private_users OWNER TO postgres;

--
-- Name: thredded_private_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_private_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_private_users_id_seq OWNER TO postgres;

--
-- Name: thredded_private_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_private_users_id_seq OWNED BY public.thredded_private_users.id;


--
-- Name: thredded_topic_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_topic_categories (
    id bigint NOT NULL,
    topic_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.thredded_topic_categories OWNER TO postgres;

--
-- Name: thredded_topic_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_topic_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_topic_categories_id_seq OWNER TO postgres;

--
-- Name: thredded_topic_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_topic_categories_id_seq OWNED BY public.thredded_topic_categories.id;


--
-- Name: thredded_topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_topics (
    id bigint NOT NULL,
    user_id bigint,
    last_user_id bigint,
    title text NOT NULL,
    slug text NOT NULL,
    messageboard_id bigint NOT NULL,
    posts_count integer DEFAULT 0 NOT NULL,
    sticky boolean DEFAULT false NOT NULL,
    locked boolean DEFAULT false NOT NULL,
    hash_id character varying(20) NOT NULL,
    moderation_state integer NOT NULL,
    last_post_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.thredded_topics OWNER TO postgres;

--
-- Name: thredded_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_topics_id_seq OWNER TO postgres;

--
-- Name: thredded_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_topics_id_seq OWNED BY public.thredded_topics.id;


--
-- Name: thredded_user_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_user_details (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    latest_activity_at timestamp without time zone,
    posts_count integer DEFAULT 0,
    topics_count integer DEFAULT 0,
    last_seen_at timestamp without time zone,
    moderation_state integer DEFAULT 0 NOT NULL,
    moderation_state_changed_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.thredded_user_details OWNER TO postgres;

--
-- Name: thredded_user_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_user_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_user_details_id_seq OWNER TO postgres;

--
-- Name: thredded_user_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_user_details_id_seq OWNED BY public.thredded_user_details.id;


--
-- Name: thredded_user_messageboard_preferences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_user_messageboard_preferences (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    messageboard_id bigint NOT NULL,
    follow_topics_on_mention boolean DEFAULT true NOT NULL,
    auto_follow_topics boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.thredded_user_messageboard_preferences OWNER TO postgres;

--
-- Name: thredded_user_messageboard_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_user_messageboard_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_user_messageboard_preferences_id_seq OWNER TO postgres;

--
-- Name: thredded_user_messageboard_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_user_messageboard_preferences_id_seq OWNED BY public.thredded_user_messageboard_preferences.id;


--
-- Name: thredded_user_post_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_user_post_notifications (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    post_id bigint NOT NULL,
    notified_at timestamp without time zone NOT NULL
);


ALTER TABLE public.thredded_user_post_notifications OWNER TO postgres;

--
-- Name: thredded_user_post_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_user_post_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_user_post_notifications_id_seq OWNER TO postgres;

--
-- Name: thredded_user_post_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_user_post_notifications_id_seq OWNED BY public.thredded_user_post_notifications.id;


--
-- Name: thredded_user_preferences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_user_preferences (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    follow_topics_on_mention boolean DEFAULT true NOT NULL,
    auto_follow_topics boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.thredded_user_preferences OWNER TO postgres;

--
-- Name: thredded_user_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_user_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_user_preferences_id_seq OWNER TO postgres;

--
-- Name: thredded_user_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_user_preferences_id_seq OWNED BY public.thredded_user_preferences.id;


--
-- Name: thredded_user_private_topic_read_states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_user_private_topic_read_states (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    postable_id bigint NOT NULL,
    unread_posts_count integer DEFAULT 0 NOT NULL,
    read_posts_count integer DEFAULT 0 NOT NULL,
    "integer" integer DEFAULT 0 NOT NULL,
    read_at timestamp without time zone NOT NULL
);


ALTER TABLE public.thredded_user_private_topic_read_states OWNER TO postgres;

--
-- Name: thredded_user_private_topic_read_states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_user_private_topic_read_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_user_private_topic_read_states_id_seq OWNER TO postgres;

--
-- Name: thredded_user_private_topic_read_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_user_private_topic_read_states_id_seq OWNED BY public.thredded_user_private_topic_read_states.id;


--
-- Name: thredded_user_topic_follows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_user_topic_follows (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    topic_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    reason smallint
);


ALTER TABLE public.thredded_user_topic_follows OWNER TO postgres;

--
-- Name: thredded_user_topic_follows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_user_topic_follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_user_topic_follows_id_seq OWNER TO postgres;

--
-- Name: thredded_user_topic_follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_user_topic_follows_id_seq OWNED BY public.thredded_user_topic_follows.id;


--
-- Name: thredded_user_topic_read_states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.thredded_user_topic_read_states (
    id bigint NOT NULL,
    messageboard_id bigint NOT NULL,
    user_id bigint NOT NULL,
    postable_id bigint NOT NULL,
    unread_posts_count integer DEFAULT 0 NOT NULL,
    read_posts_count integer DEFAULT 0 NOT NULL,
    "integer" integer DEFAULT 0 NOT NULL,
    read_at timestamp without time zone NOT NULL
);


ALTER TABLE public.thredded_user_topic_read_states OWNER TO postgres;

--
-- Name: thredded_user_topic_read_states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.thredded_user_topic_read_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.thredded_user_topic_read_states_id_seq OWNER TO postgres;

--
-- Name: thredded_user_topic_read_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.thredded_user_topic_read_states_id_seq OWNED BY public.thredded_user_topic_read_states.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name text NOT NULL,
    email text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    admin boolean DEFAULT false NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);


--
-- Name: thredded_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_categories ALTER COLUMN id SET DEFAULT nextval('public.thredded_categories_id_seq'::regclass);


--
-- Name: thredded_messageboard_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_messageboard_groups ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboard_groups_id_seq'::regclass);


--
-- Name: thredded_messageboard_notifications_for_followed_topics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_messageboard_notifications_for_followed_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboard_notifications_for_followed_topics_id_seq'::regclass);


--
-- Name: thredded_messageboard_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_messageboard_users ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboard_users_id_seq'::regclass);


--
-- Name: thredded_messageboards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_messageboards ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboards_id_seq'::regclass);


--
-- Name: thredded_notifications_for_followed_topics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_notifications_for_followed_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_notifications_for_followed_topics_id_seq'::regclass);


--
-- Name: thredded_notifications_for_private_topics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_notifications_for_private_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_notifications_for_private_topics_id_seq'::regclass);


--
-- Name: thredded_post_moderation_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_post_moderation_records ALTER COLUMN id SET DEFAULT nextval('public.thredded_post_moderation_records_id_seq'::regclass);


--
-- Name: thredded_posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_posts ALTER COLUMN id SET DEFAULT nextval('public.thredded_posts_id_seq'::regclass);


--
-- Name: thredded_private_posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_private_posts ALTER COLUMN id SET DEFAULT nextval('public.thredded_private_posts_id_seq'::regclass);


--
-- Name: thredded_private_topics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_private_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_private_topics_id_seq'::regclass);


--
-- Name: thredded_private_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_private_users ALTER COLUMN id SET DEFAULT nextval('public.thredded_private_users_id_seq'::regclass);


--
-- Name: thredded_topic_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_topic_categories ALTER COLUMN id SET DEFAULT nextval('public.thredded_topic_categories_id_seq'::regclass);


--
-- Name: thredded_topics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_topics_id_seq'::regclass);


--
-- Name: thredded_user_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_user_details ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_details_id_seq'::regclass);


--
-- Name: thredded_user_messageboard_preferences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_user_messageboard_preferences ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_messageboard_preferences_id_seq'::regclass);


--
-- Name: thredded_user_post_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_user_post_notifications ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_post_notifications_id_seq'::regclass);


--
-- Name: thredded_user_preferences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_user_preferences ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_preferences_id_seq'::regclass);


--
-- Name: thredded_user_private_topic_read_states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_user_private_topic_read_states ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_private_topic_read_states_id_seq'::regclass);


--
-- Name: thredded_user_topic_follows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_user_topic_follows ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_topic_follows_id_seq'::regclass);


--
-- Name: thredded_user_topic_read_states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_user_topic_read_states ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_topic_read_states_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2026-09-30 13:52:36.147924	2026-09-30 13:52:36.147927
\.


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
1	welcome-to-thredded	1	Thredded::Topic	\N	2026-09-30 13:52:37.245576
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20130430210842
20160308104204
20160329231848
\.


--
-- Data for Name: thredded_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_categories (id, messageboard_id, name, description, created_at, updated_at, slug) FROM stdin;
\.


--
-- Data for Name: thredded_messageboard_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_messageboard_groups (id, name, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: thredded_messageboard_notifications_for_followed_topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_messageboard_notifications_for_followed_topics (id, user_id, messageboard_id, notifier_key, enabled) FROM stdin;
\.


--
-- Data for Name: thredded_messageboard_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_messageboard_users (id, thredded_user_detail_id, thredded_messageboard_id, last_seen_at) FROM stdin;
\.


--
-- Data for Name: thredded_messageboards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_messageboards (id, name, slug, description, topics_count, posts_count, "position", last_topic_id, messageboard_group_id, created_at, updated_at, locked) FROM stdin;
1	General Discussion	general	Welcome to the Thredded benchmark forum!	1	1	1790776356	1	\N	2026-09-30 13:52:36.708027	2026-09-30 13:52:37.887585	f
\.


--
-- Data for Name: thredded_notifications_for_followed_topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_notifications_for_followed_topics (id, user_id, notifier_key, enabled) FROM stdin;
\.


--
-- Data for Name: thredded_notifications_for_private_topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_notifications_for_private_topics (id, user_id, notifier_key, enabled) FROM stdin;
\.


--
-- Data for Name: thredded_post_moderation_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_post_moderation_records (id, post_id, messageboard_id, post_content, post_user_id, post_user_name, moderator_id, moderation_state, previous_moderation_state, created_at) FROM stdin;
\.


--
-- Data for Name: thredded_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_posts (id, user_id, content, source, postable_id, messageboard_id, moderation_state, created_at, updated_at) FROM stdin;
1	1	Welcome to the standardized Thredded benchmark environment!	web	1	1	0	2026-09-30 13:52:37.570087	2026-09-30 13:52:37.570087
\.


--
-- Data for Name: thredded_private_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_private_posts (id, user_id, content, postable_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: thredded_private_topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_private_topics (id, user_id, last_user_id, title, slug, posts_count, hash_id, last_post_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: thredded_private_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_private_users (id, private_topic_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: thredded_topic_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_topic_categories (id, topic_id, category_id) FROM stdin;
\.


--
-- Data for Name: thredded_topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_topics (id, user_id, last_user_id, title, slug, messageboard_id, posts_count, sticky, locked, hash_id, moderation_state, last_post_at, created_at, updated_at) FROM stdin;
1	1	1	Welcome to Thredded	welcome-to-thredded	1	1	f	f	3885eb733a16b0fe01df	0	2026-09-30 13:52:37.570087	2026-09-30 13:52:37.111328	2026-09-30 13:52:37.769846
\.


--
-- Data for Name: thredded_user_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_user_details (id, user_id, latest_activity_at, posts_count, topics_count, last_seen_at, moderation_state, moderation_state_changed_at, created_at, updated_at) FROM stdin;
1	1	\N	1	1	\N	0	\N	2026-09-30 13:52:37.00174	2026-09-30 13:52:37.00174
\.


--
-- Data for Name: thredded_user_messageboard_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_user_messageboard_preferences (id, user_id, messageboard_id, follow_topics_on_mention, auto_follow_topics, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: thredded_user_post_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_user_post_notifications (id, user_id, post_id, notified_at) FROM stdin;
\.


--
-- Data for Name: thredded_user_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_user_preferences (id, user_id, follow_topics_on_mention, auto_follow_topics, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: thredded_user_private_topic_read_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_user_private_topic_read_states (id, user_id, postable_id, unread_posts_count, read_posts_count, "integer", read_at) FROM stdin;
\.


--
-- Data for Name: thredded_user_topic_follows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_user_topic_follows (id, user_id, topic_id, created_at, reason) FROM stdin;
1	1	1	2026-09-30 13:52:38.193824	1
\.


--
-- Data for Name: thredded_user_topic_read_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.thredded_user_topic_read_states (id, messageboard_id, user_id, postable_id, unread_posts_count, read_posts_count, "integer", read_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, created_at, updated_at, admin) FROM stdin;
1	admin	admin@example.com	2026-09-30 13:52:36.617589	2026-09-30 13:52:36.617589	t
\.


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.friendly_id_slugs_id_seq', 1, true);


--
-- Name: thredded_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_categories_id_seq', 1, false);


--
-- Name: thredded_messageboard_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_messageboard_groups_id_seq', 1, false);


--
-- Name: thredded_messageboard_notifications_for_followed_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_messageboard_notifications_for_followed_topics_id_seq', 1, false);


--
-- Name: thredded_messageboard_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_messageboard_users_id_seq', 1, false);


--
-- Name: thredded_messageboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_messageboards_id_seq', 1, true);


--
-- Name: thredded_notifications_for_followed_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_notifications_for_followed_topics_id_seq', 1, false);


--
-- Name: thredded_notifications_for_private_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_notifications_for_private_topics_id_seq', 1, false);


--
-- Name: thredded_post_moderation_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_post_moderation_records_id_seq', 1, false);


--
-- Name: thredded_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_posts_id_seq', 1, true);


--
-- Name: thredded_private_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_private_posts_id_seq', 1, false);


--
-- Name: thredded_private_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_private_topics_id_seq', 1, false);


--
-- Name: thredded_private_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_private_users_id_seq', 1, false);


--
-- Name: thredded_topic_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_topic_categories_id_seq', 1, false);


--
-- Name: thredded_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_topics_id_seq', 1, true);


--
-- Name: thredded_user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_user_details_id_seq', 1, true);


--
-- Name: thredded_user_messageboard_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_user_messageboard_preferences_id_seq', 1, false);


--
-- Name: thredded_user_post_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_user_post_notifications_id_seq', 1, false);


--
-- Name: thredded_user_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_user_preferences_id_seq', 1, false);


--
-- Name: thredded_user_private_topic_read_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_user_private_topic_read_states_id_seq', 1, false);


--
-- Name: thredded_user_topic_follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_user_topic_follows_id_seq', 1, true);


--
-- Name: thredded_user_topic_read_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thredded_user_topic_read_states_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: thredded_categories thredded_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_categories
    ADD CONSTRAINT thredded_categories_pkey PRIMARY KEY (id);


--
-- Name: thredded_messageboard_groups thredded_messageboard_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_messageboard_groups
    ADD CONSTRAINT thredded_messageboard_groups_pkey PRIMARY KEY (id);


--
-- Name: thredded_messageboard_notifications_for_followed_topics thredded_messageboard_notifications_for_followed_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_messageboard_notifications_for_followed_topics
    ADD CONSTRAINT thredded_messageboard_notifications_for_followed_topics_pkey PRIMARY KEY (id);


--
-- Name: thredded_messageboard_users thredded_messageboard_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_messageboard_users
    ADD CONSTRAINT thredded_messageboard_users_pkey PRIMARY KEY (id);


--
-- Name: thredded_messageboards thredded_messageboards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_messageboards
    ADD CONSTRAINT thredded_messageboards_pkey PRIMARY KEY (id);


--
-- Name: thredded_notifications_for_followed_topics thredded_notifications_for_followed_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_notifications_for_followed_topics
    ADD CONSTRAINT thredded_notifications_for_followed_topics_pkey PRIMARY KEY (id);


--
-- Name: thredded_notifications_for_private_topics thredded_notifications_for_private_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_notifications_for_private_topics
    ADD CONSTRAINT thredded_notifications_for_private_topics_pkey PRIMARY KEY (id);


--
-- Name: thredded_post_moderation_records thredded_post_moderation_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_post_moderation_records
    ADD CONSTRAINT thredded_post_moderation_records_pkey PRIMARY KEY (id);


--
-- Name: thredded_posts thredded_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_posts
    ADD CONSTRAINT thredded_posts_pkey PRIMARY KEY (id);


--
-- Name: thredded_private_posts thredded_private_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_private_posts
    ADD CONSTRAINT thredded_private_posts_pkey PRIMARY KEY (id);


--
-- Name: thredded_private_topics thredded_private_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_private_topics
    ADD CONSTRAINT thredded_private_topics_pkey PRIMARY KEY (id);


--
-- Name: thredded_private_users thredded_private_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_private_users
    ADD CONSTRAINT thredded_private_users_pkey PRIMARY KEY (id);


--
-- Name: thredded_topic_categories thredded_topic_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_topic_categories
    ADD CONSTRAINT thredded_topic_categories_pkey PRIMARY KEY (id);


--
-- Name: thredded_topics thredded_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_topics
    ADD CONSTRAINT thredded_topics_pkey PRIMARY KEY (id);


--
-- Name: thredded_user_details thredded_user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_user_details
    ADD CONSTRAINT thredded_user_details_pkey PRIMARY KEY (id);


--
-- Name: thredded_user_messageboard_preferences thredded_user_messageboard_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_user_messageboard_preferences
    ADD CONSTRAINT thredded_user_messageboard_preferences_pkey PRIMARY KEY (id);


--
-- Name: thredded_user_post_notifications thredded_user_post_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_user_post_notifications
    ADD CONSTRAINT thredded_user_post_notifications_pkey PRIMARY KEY (id);


--
-- Name: thredded_user_preferences thredded_user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_user_preferences
    ADD CONSTRAINT thredded_user_preferences_pkey PRIMARY KEY (id);


--
-- Name: thredded_user_private_topic_read_states thredded_user_private_topic_read_states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_user_private_topic_read_states
    ADD CONSTRAINT thredded_user_private_topic_read_states_pkey PRIMARY KEY (id);


--
-- Name: thredded_user_topic_follows thredded_user_topic_follows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_user_topic_follows
    ADD CONSTRAINT thredded_user_topic_follows_pkey PRIMARY KEY (id);


--
-- Name: thredded_user_topic_read_states thredded_user_topic_read_states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_user_topic_read_states
    ADD CONSTRAINT thredded_user_topic_read_states_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON public.friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_thredded_categories_on_messageboard_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_categories_on_messageboard_id ON public.thredded_categories USING btree (messageboard_id);


--
-- Name: index_thredded_categories_on_messageboard_id_and_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_thredded_categories_on_messageboard_id_and_slug ON public.thredded_categories USING btree (messageboard_id, slug);


--
-- Name: index_thredded_messageboard_users_for_recently_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_messageboard_users_for_recently_active ON public.thredded_messageboard_users USING btree (thredded_messageboard_id, last_seen_at);


--
-- Name: index_thredded_messageboard_users_primary; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_thredded_messageboard_users_primary ON public.thredded_messageboard_users USING btree (thredded_messageboard_id, thredded_user_detail_id);


--
-- Name: index_thredded_messageboards_on_messageboard_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_messageboards_on_messageboard_group_id ON public.thredded_messageboards USING btree (messageboard_group_id);


--
-- Name: index_thredded_messageboards_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_thredded_messageboards_on_slug ON public.thredded_messageboards USING btree (slug);


--
-- Name: index_thredded_moderation_records_for_display; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_moderation_records_for_display ON public.thredded_post_moderation_records USING btree (messageboard_id, created_at DESC);


--
-- Name: index_thredded_posts_for_display; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_posts_for_display ON public.thredded_posts USING btree (moderation_state, updated_at);


--
-- Name: index_thredded_posts_on_messageboard_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_posts_on_messageboard_id ON public.thredded_posts USING btree (messageboard_id);


--
-- Name: index_thredded_posts_on_postable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_posts_on_postable_id ON public.thredded_posts USING btree (postable_id);


--
-- Name: index_thredded_posts_on_postable_id_and_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_posts_on_postable_id_and_created_at ON public.thredded_posts USING btree (postable_id, created_at);


--
-- Name: index_thredded_posts_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_posts_on_user_id ON public.thredded_posts USING btree (user_id);


--
-- Name: index_thredded_private_posts_on_postable_id_and_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_private_posts_on_postable_id_and_created_at ON public.thredded_private_posts USING btree (postable_id, created_at);


--
-- Name: index_thredded_private_topics_on_hash_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_private_topics_on_hash_id ON public.thredded_private_topics USING btree (hash_id);


--
-- Name: index_thredded_private_topics_on_last_post_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_private_topics_on_last_post_at ON public.thredded_private_topics USING btree (last_post_at);


--
-- Name: index_thredded_private_topics_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_thredded_private_topics_on_slug ON public.thredded_private_topics USING btree (slug);


--
-- Name: index_thredded_private_users_on_private_topic_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_private_users_on_private_topic_id ON public.thredded_private_users USING btree (private_topic_id);


--
-- Name: index_thredded_private_users_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_private_users_on_user_id ON public.thredded_private_users USING btree (user_id);


--
-- Name: index_thredded_topic_categories_on_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_topic_categories_on_category_id ON public.thredded_topic_categories USING btree (category_id);


--
-- Name: index_thredded_topic_categories_on_topic_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_topic_categories_on_topic_id ON public.thredded_topic_categories USING btree (topic_id);


--
-- Name: index_thredded_topics_for_display; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_topics_for_display ON public.thredded_topics USING btree (moderation_state, sticky DESC, updated_at DESC);


--
-- Name: index_thredded_topics_on_hash_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_topics_on_hash_id ON public.thredded_topics USING btree (hash_id);


--
-- Name: index_thredded_topics_on_last_post_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_topics_on_last_post_at ON public.thredded_topics USING btree (last_post_at);


--
-- Name: index_thredded_topics_on_messageboard_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_topics_on_messageboard_id ON public.thredded_topics USING btree (messageboard_id);


--
-- Name: index_thredded_topics_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_thredded_topics_on_slug ON public.thredded_topics USING btree (slug);


--
-- Name: index_thredded_topics_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_topics_on_user_id ON public.thredded_topics USING btree (user_id);


--
-- Name: index_thredded_user_details_for_moderations; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_user_details_for_moderations ON public.thredded_user_details USING btree (moderation_state, moderation_state_changed_at DESC);


--
-- Name: index_thredded_user_details_on_latest_activity_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_user_details_on_latest_activity_at ON public.thredded_user_details USING btree (latest_activity_at);


--
-- Name: index_thredded_user_details_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_thredded_user_details_on_user_id ON public.thredded_user_details USING btree (user_id);


--
-- Name: index_thredded_user_post_notifications_on_post_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_user_post_notifications_on_post_id ON public.thredded_user_post_notifications USING btree (post_id);


--
-- Name: index_thredded_user_post_notifications_on_user_id_and_post_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_thredded_user_post_notifications_on_user_id_and_post_id ON public.thredded_user_post_notifications USING btree (user_id, post_id);


--
-- Name: index_thredded_user_preferences_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_thredded_user_preferences_on_user_id ON public.thredded_user_preferences USING btree (user_id);


--
-- Name: index_thredded_user_topic_read_states_on_messageboard_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_thredded_user_topic_read_states_on_messageboard_id ON public.thredded_user_topic_read_states USING btree (messageboard_id);


--
-- Name: thredded_categories_name_ci; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX thredded_categories_name_ci ON public.thredded_categories USING btree (lower(name) text_pattern_ops);


--
-- Name: thredded_messageboard_notifications_for_followed_topics_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX thredded_messageboard_notifications_for_followed_topics_unique ON public.thredded_messageboard_notifications_for_followed_topics USING btree (user_id, messageboard_id, notifier_key);


--
-- Name: thredded_notifications_for_followed_topics_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX thredded_notifications_for_followed_topics_unique ON public.thredded_notifications_for_followed_topics USING btree (user_id, notifier_key);


--
-- Name: thredded_notifications_for_private_topics_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX thredded_notifications_for_private_topics_unique ON public.thredded_notifications_for_private_topics USING btree (user_id, notifier_key);


--
-- Name: thredded_posts_content_fts; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX thredded_posts_content_fts ON public.thredded_posts USING gist (to_tsvector('english'::regconfig, content));


--
-- Name: thredded_topics_title_fts; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX thredded_topics_title_fts ON public.thredded_topics USING gist (to_tsvector('english'::regconfig, title));


--
-- Name: thredded_user_messageboard_preferences_user_id_messageboard_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX thredded_user_messageboard_preferences_user_id_messageboard_id ON public.thredded_user_messageboard_preferences USING btree (user_id, messageboard_id);


--
-- Name: thredded_user_private_topic_read_states_user_postable; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX thredded_user_private_topic_read_states_user_postable ON public.thredded_user_private_topic_read_states USING btree (user_id, postable_id);


--
-- Name: thredded_user_topic_follows_user_topic; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX thredded_user_topic_follows_user_topic ON public.thredded_user_topic_follows USING btree (user_id, topic_id);


--
-- Name: thredded_user_topic_read_states_user_messageboard; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX thredded_user_topic_read_states_user_messageboard ON public.thredded_user_topic_read_states USING btree (user_id, messageboard_id);


--
-- Name: thredded_user_topic_read_states_user_postable; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX thredded_user_topic_read_states_user_postable ON public.thredded_user_topic_read_states USING btree (user_id, postable_id);


--
-- Name: users_name_lower; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_name_lower ON public.users USING btree (lower(name) text_pattern_ops);


--
-- Name: thredded_messageboard_users fk_rails_06e42c62f5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_messageboard_users
    ADD CONSTRAINT fk_rails_06e42c62f5 FOREIGN KEY (thredded_user_detail_id) REFERENCES public.thredded_user_details(id) ON DELETE CASCADE;


--
-- Name: thredded_user_post_notifications fk_rails_364d7e370a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_user_post_notifications
    ADD CONSTRAINT fk_rails_364d7e370a FOREIGN KEY (post_id) REFERENCES public.thredded_posts(id) ON DELETE CASCADE;


--
-- Name: thredded_user_post_notifications fk_rails_5908eec802; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_user_post_notifications
    ADD CONSTRAINT fk_rails_5908eec802 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: thredded_messageboard_users fk_rails_966803d714; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.thredded_messageboard_users
    ADD CONSTRAINT fk_rails_966803d714 FOREIGN KEY (thredded_messageboard_id) REFERENCES public.thredded_messageboards(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict UsYjKOyKrkKJWHWJ85AroeAc0OXmDT7Ubdan8M6Or4chG2KzXbYRGGiAKeMZjX2

