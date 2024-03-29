PGDMP     .    9                 x         
   netfoundDB    12.4    13.0     5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    16393 
   netfoundDB    DATABASE     l   CREATE DATABASE "netfoundDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "netfoundDB";
                postgres    false            �            1259    16394    genre_id_seq    SEQUENCE     u   CREATE SEQUENCE public.genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.genre_id_seq;
       public          postgres    false            �            1259    16396    genre    TABLE     �   CREATE TABLE public.genre (
    id_genre integer DEFAULT nextval('public.genre_id_seq'::regclass) NOT NULL,
    genre_name text NOT NULL
);
    DROP TABLE public.genre;
       public         heap    postgres    false    202            �            1259    16403    movie_genre_id_seq    SEQUENCE     {   CREATE SEQUENCE public.movie_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.movie_genre_id_seq;
       public          postgres    false            �            1259    16405    movie_genre    TABLE     �   CREATE TABLE public.movie_genre (
    id_movie_genre integer DEFAULT nextval('public.movie_genre_id_seq'::regclass) NOT NULL,
    id_movie integer NOT NULL,
    id_genre integer NOT NULL
);
    DROP TABLE public.movie_genre;
       public         heap    postgres    false    204            �            1259    16409    movie_id_seq    SEQUENCE     u   CREATE SEQUENCE public.movie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.movie_id_seq;
       public          postgres    false            �            1259    16411    movies    TABLE     5  CREATE TABLE public.movies (
    uri_front_image text,
    uri_back_image text,
    title text NOT NULL,
    release_date date,
    overview text,
    original_language text,
    id_movie integer DEFAULT nextval('public.movie_id_seq'::regclass) NOT NULL,
    director text,
    popularity double precision
);
    DROP TABLE public.movies;
       public         heap    postgres    false    206            �            1259    16418    saved_movies_id_seq    SEQUENCE     |   CREATE SEQUENCE public.saved_movies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.saved_movies_id_seq;
       public          postgres    false            �            1259    16420    saved_movies    TABLE     �   CREATE TABLE public.saved_movies (
    id_saved_movies integer DEFAULT nextval('public.saved_movies_id_seq'::regclass) NOT NULL,
    id_movie integer NOT NULL,
    id_user integer NOT NULL
);
     DROP TABLE public.saved_movies;
       public         heap    postgres    false    208            �            1259    16424    saved_tvshows_id_seq    SEQUENCE     }   CREATE SEQUENCE public.saved_tvshows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.saved_tvshows_id_seq;
       public          postgres    false            �            1259    16426    saved_tv_shows    TABLE     �   CREATE TABLE public.saved_tv_shows (
    id_tv_show_saved integer DEFAULT nextval('public.saved_tvshows_id_seq'::regclass) NOT NULL,
    id_tv_show integer NOT NULL,
    id_user integer NOT NULL
);
 "   DROP TABLE public.saved_tv_shows;
       public         heap    postgres    false    210            �            1259    16430    tvshow_genre_id_seq    SEQUENCE     |   CREATE SEQUENCE public.tvshow_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tvshow_genre_id_seq;
       public          postgres    false            �            1259    16432    tv_show_genre    TABLE     �   CREATE TABLE public.tv_show_genre (
    id_tv_show_genre integer DEFAULT nextval('public.tvshow_genre_id_seq'::regclass) NOT NULL,
    id_tv_show integer NOT NULL,
    id_genre integer NOT NULL
);
 !   DROP TABLE public.tv_show_genre;
       public         heap    postgres    false    212            �            1259    16436    tvshows_id_seq    SEQUENCE     w   CREATE SEQUENCE public.tvshows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.tvshows_id_seq;
       public          postgres    false            �            1259    16438    tv_shows    TABLE     L  CREATE TABLE public.tv_shows (
    title text NOT NULL,
    overview text,
    release_date date,
    quantity_seasons integer,
    quantity_episodes integer,
    original_language text,
    uri_front_image text,
    id_tv_show integer DEFAULT nextval('public.tvshows_id_seq'::regclass) NOT NULL,
    popularity double precision
);
    DROP TABLE public.tv_shows;
       public         heap    postgres    false    214            �            1259    16445    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false            �            1259    16447    users    TABLE     �   CREATE TABLE public.users (
    id_user integer DEFAULT nextval('public.users_id_seq'::regclass) NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    flag_admin integer NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false    216           