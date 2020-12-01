PGDMP     ,    5                 x         
   netfoundDB    10.14    10.14 8    G           0    0    ENCODING    ENCODING         SET client_encoding = 'LATIN1';
                       false            H           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            I           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            J           1262    16393 
   netfoundDB    DATABASE     �   CREATE DATABASE "netfoundDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE "netfoundDB";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            K           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            L           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    24576    genre_id_seq    SEQUENCE     u   CREATE SEQUENCE public.genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.genre_id_seq;
       public       postgres    false    3            �            1259    16402    genre    TABLE     �   CREATE TABLE public.genre (
    id_genre integer DEFAULT nextval('public.genre_id_seq'::regclass) NOT NULL,
    genre_name text NOT NULL
);
    DROP TABLE public.genre;
       public         postgres    false    204    3            �            1259    24579    movie_genre_id_seq    SEQUENCE     {   CREATE SEQUENCE public.movie_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.movie_genre_id_seq;
       public       postgres    false    3            �            1259    16410    movie_genre    TABLE     �   CREATE TABLE public.movie_genre (
    id_movie_genre integer DEFAULT nextval('public.movie_genre_id_seq'::regclass) NOT NULL,
    id_movie integer NOT NULL,
    id_genre integer NOT NULL
);
    DROP TABLE public.movie_genre;
       public         postgres    false    205    3            �            1259    24582    movie_id_seq    SEQUENCE     u   CREATE SEQUENCE public.movie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.movie_id_seq;
       public       postgres    false    3            �            1259    16394    movies    TABLE     5  CREATE TABLE public.movies (
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
       public         postgres    false    206    3            �            1259    24585    saved_movies_id_seq    SEQUENCE     |   CREATE SEQUENCE public.saved_movies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.saved_movies_id_seq;
       public       postgres    false    3            �            1259    16433    saved_movies    TABLE     �   CREATE TABLE public.saved_movies (
    id_saved_movies integer DEFAULT nextval('public.saved_movies_id_seq'::regclass) NOT NULL,
    id_movie integer NOT NULL,
    id_user integer NOT NULL
);
     DROP TABLE public.saved_movies;
       public         postgres    false    207    3            �            1259    24588    saved_tvshows_id_seq    SEQUENCE     }   CREATE SEQUENCE public.saved_tvshows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.saved_tvshows_id_seq;
       public       postgres    false    3            �            1259    16471    saved_tv_shows    TABLE     �   CREATE TABLE public.saved_tv_shows (
    id_tv_show_saved integer DEFAULT nextval('public.saved_tvshows_id_seq'::regclass) NOT NULL,
    id_tv_show integer NOT NULL,
    id_user integer NOT NULL
);
 "   DROP TABLE public.saved_tv_shows;
       public         postgres    false    208    3            �            1259    24591    tvshow_genre_id_seq    SEQUENCE     |   CREATE SEQUENCE public.tvshow_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tvshow_genre_id_seq;
       public       postgres    false    3            �            1259    16456    tv_show_genre    TABLE     �   CREATE TABLE public.tv_show_genre (
    id_tv_show_genre integer DEFAULT nextval('public.tvshow_genre_id_seq'::regclass) NOT NULL,
    id_tv_show integer NOT NULL,
    id_genre integer NOT NULL
);
 !   DROP TABLE public.tv_show_genre;
       public         postgres    false    209    3            �            1259    24594    tvshows_id_seq    SEQUENCE     w   CREATE SEQUENCE public.tvshows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.tvshows_id_seq;
       public       postgres    false    3            �            1259    16448    tv_shows    TABLE     L  CREATE TABLE public.tv_shows (
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
       public         postgres    false    210    3            �            1259    24597    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    3            �            1259    16425    users    TABLE     �   CREATE TABLE public.users (
    id_user integer DEFAULT nextval('public.users_id_seq'::regclass) NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    flag_admin integer NOT NULL
);
    DROP TABLE public.users;
       public         postgres    false    211    3            6          0    16402    genre 
   TABLE DATA               5   COPY public.genre (id_genre, genre_name) FROM stdin;
    public       postgres    false    197            7          0    16410    movie_genre 
   TABLE DATA               I   COPY public.movie_genre (id_movie_genre, id_movie, id_genre) FROM stdin;
    public       postgres    false    198            5          0    16394    movies 
   TABLE DATA               �   COPY public.movies (uri_front_image, uri_back_image, title, release_date, overview, original_language, id_movie, director, popularity) FROM stdin;
    public       postgres    false    196            9          0    16433    saved_movies 
   TABLE DATA               J   COPY public.saved_movies (id_saved_movies, id_movie, id_user) FROM stdin;
    public       postgres    false    200            <          0    16471    saved_tv_shows 
   TABLE DATA               O   COPY public.saved_tv_shows (id_tv_show_saved, id_tv_show, id_user) FROM stdin;
    public       postgres    false    203            ;          0    16456    tv_show_genre 
   TABLE DATA               O   COPY public.tv_show_genre (id_tv_show_genre, id_tv_show, id_genre) FROM stdin;
    public       postgres    false    202            :          0    16448    tv_shows 
   TABLE DATA               �   COPY public.tv_shows (title, overview, release_date, quantity_seasons, quantity_episodes, original_language, uri_front_image, id_tv_show, popularity) FROM stdin;
    public       postgres    false    201            8          0    16425    users 
   TABLE DATA               H   COPY public.users (id_user, username, password, flag_admin) FROM stdin;
    public       postgres    false    199            M           0    0    genre_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.genre_id_seq', 1, false);
            public       postgres    false    204            N           0    0    movie_genre_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.movie_genre_id_seq', 12353, true);
            public       postgres    false    205            O           0    0    movie_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.movie_id_seq', 1, false);
            public       postgres    false    206            P           0    0    saved_movies_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.saved_movies_id_seq', 2, true);
            public       postgres    false    207            Q           0    0    saved_tvshows_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.saved_tvshows_id_seq', 1, true);
            public       postgres    false    208            R           0    0    tvshow_genre_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tvshow_genre_id_seq', 4740, true);
            public       postgres    false    209            S           0    0    tvshows_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tvshows_id_seq', 1, false);
            public       postgres    false    210            T           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
            public       postgres    false    211            �
           2606    16409    genre GENRE_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.genre
    ADD CONSTRAINT "GENRE_pkey" PRIMARY KEY (id_genre);
 <   ALTER TABLE ONLY public.genre DROP CONSTRAINT "GENRE_pkey";
       public         postgres    false    197            �
           2606    16414    movie_genre MOVIE_GENRE_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT "MOVIE_GENRE_pkey" PRIMARY KEY (id_movie_genre);
 H   ALTER TABLE ONLY public.movie_genre DROP CONSTRAINT "MOVIE_GENRE_pkey";
       public         postgres    false    198            �
           2606    16437    saved_movies SAVED_MOVIES_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.saved_movies
    ADD CONSTRAINT "SAVED_MOVIES_pkey" PRIMARY KEY (id_saved_movies);
 J   ALTER TABLE ONLY public.saved_movies DROP CONSTRAINT "SAVED_MOVIES_pkey";
       public         postgres    false    200            �
           2606    16475 "   saved_tv_shows SAVED_TV_SHOWS_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.saved_tv_shows
    ADD CONSTRAINT "SAVED_TV_SHOWS_pkey" PRIMARY KEY (id_tv_show_saved);
 N   ALTER TABLE ONLY public.saved_tv_shows DROP CONSTRAINT "SAVED_TV_SHOWS_pkey";
       public         postgres    false    203            �
           2606    16455    tv_shows TV_SHOWS_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tv_shows
    ADD CONSTRAINT "TV_SHOWS_pkey" PRIMARY KEY (id_tv_show);
 B   ALTER TABLE ONLY public.tv_shows DROP CONSTRAINT "TV_SHOWS_pkey";
       public         postgres    false    201            �
           2606    16460     tv_show_genre TV_SHOW_GENRE_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.tv_show_genre
    ADD CONSTRAINT "TV_SHOW_GENRE_pkey" PRIMARY KEY (id_tv_show_genre);
 L   ALTER TABLE ONLY public.tv_show_genre DROP CONSTRAINT "TV_SHOW_GENRE_pkey";
       public         postgres    false    202            �
           2606    16432    users USER_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "USER_pkey" PRIMARY KEY (id_user);
 ;   ALTER TABLE ONLY public.users DROP CONSTRAINT "USER_pkey";
       public         postgres    false    199            �
           2606    16401    movies movies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id_movie);
 <   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_pkey;
       public         postgres    false    196            �
           2606    16415    movie_genre fk_id_genre    FK CONSTRAINT     }   ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT fk_id_genre FOREIGN KEY (id_genre) REFERENCES public.genre(id_genre);
 A   ALTER TABLE ONLY public.movie_genre DROP CONSTRAINT fk_id_genre;
       public       postgres    false    197    2727    198            �
           2606    16466    tv_show_genre fk_id_genre    FK CONSTRAINT        ALTER TABLE ONLY public.tv_show_genre
    ADD CONSTRAINT fk_id_genre FOREIGN KEY (id_genre) REFERENCES public.genre(id_genre);
 C   ALTER TABLE ONLY public.tv_show_genre DROP CONSTRAINT fk_id_genre;
       public       postgres    false    202    197    2727            �
           2606    16420    movie_genre fk_id_movie    FK CONSTRAINT     ~   ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT fk_id_movie FOREIGN KEY (id_movie) REFERENCES public.movies(id_movie);
 A   ALTER TABLE ONLY public.movie_genre DROP CONSTRAINT fk_id_movie;
       public       postgres    false    196    2725    198            �
           2606    16438    saved_movies fk_id_movie    FK CONSTRAINT        ALTER TABLE ONLY public.saved_movies
    ADD CONSTRAINT fk_id_movie FOREIGN KEY (id_movie) REFERENCES public.movies(id_movie);
 B   ALTER TABLE ONLY public.saved_movies DROP CONSTRAINT fk_id_movie;
       public       postgres    false    196    200    2725            �
           2606    16461    tv_show_genre fk_id_tv_show    FK CONSTRAINT     �   ALTER TABLE ONLY public.tv_show_genre
    ADD CONSTRAINT fk_id_tv_show FOREIGN KEY (id_tv_show) REFERENCES public.tv_shows(id_tv_show);
 E   ALTER TABLE ONLY public.tv_show_genre DROP CONSTRAINT fk_id_tv_show;
       public       postgres    false    2735    201    202            �
           2606    16481    saved_tv_shows fk_id_tv_show    FK CONSTRAINT     �   ALTER TABLE ONLY public.saved_tv_shows
    ADD CONSTRAINT fk_id_tv_show FOREIGN KEY (id_tv_show) REFERENCES public.tv_shows(id_tv_show);
 F   ALTER TABLE ONLY public.saved_tv_shows DROP CONSTRAINT fk_id_tv_show;
       public       postgres    false    201    203    2735            �
           2606    16443    saved_movies fk_id_user    FK CONSTRAINT     {   ALTER TABLE ONLY public.saved_movies
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user);
 A   ALTER TABLE ONLY public.saved_movies DROP CONSTRAINT fk_id_user;
       public       postgres    false    200    2731    199            �
           2606    16476    saved_tv_shows fk_id_user    FK CONSTRAINT     }   ALTER TABLE ONLY public.saved_tv_shows
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user);
 C   ALTER TABLE ONLY public.saved_tv_shows DROP CONSTRAINT fk_id_user;
       public       postgres    false    199    203    2731            6   �   x���n�0Eg�+��-?$���$K��Ȕ�PT��%���-:2u�&�q.�1�ߟ����Ҳ
a�B�8��^50�x�2�+`��vٯQ�oa�:�	E-�)aO�1)_��B�檅#�˟h6� �E��0p���vm�������u9R��u�g�B�:��|5����)Dڌgl*���)�[��a�!]�j"9�K�����M�      7      x�L�[��(C��&�a�k����Z}��	B@1�������?����6���vjWj��rS���{��W��Ͽa���L�-�?�r�J�C��v�J����п���y���-�����[oU�Q��E��n���7��F�Y��Sè�%��m���֨�߭��~�G��[�ULE	=�-u����5%n�ZW���nR��$�����mc�J(�QB���p	�zQ��n?��H���o��������I���K�[|��tG�����U�a�+�q3�<㖿HtO���*zdX$|���G����Z<���%��G'��U����v:/cv%�M�|\���S_�_�ʼ��6o�����q�V!�QuOv��M�>]�o��k����T�6k�wD'���2%n���U���pW%oQ����jW�޹��v%�f/4l�I��!A��[#�%��S��m;�
���J(�PByn��g)�f�[:Or	J/�cA����-�Oy���2RM)�]��7�<3�3�S����ܳ�R��9���Nܛ��[�l�).�Y���s#��)�2)ʝJ��,w
�����ܷ���',w�+u�tG�M	�@��;�ʝ�ۏ�P뼣|�4I)�"u�|�.�(�<J��;b������[S�N�r��}�*��ћR)w�o?����{p��jJ��N��g�3])��;��;�˝��O|�����~G��ดR��?�B�s��)��?��w�?Н�'���i�pw�?ȝ�g�����N��'�s���T?�Fܹ~�ɚ6˷hj�y�8�;��oS)���}Ux��R�����Q�~�%,/N6���$U��S��t���h����}��?���a*���+�
ph\<����q5 ��
`��"M�$��*�0di�)$U�Q��"���=s:I~$�&o�kB��"�߷�ӫS�|��Ҫ�+taUG��mUU���U�Q���#��7��%��G����F�f�IU5��q��ϟҪ�
=QU���Ue�wU}~��I�;ɋU�W+
#�����`�*�>��"WT��ٻ��u�TO�Y�a�sX�3l�d�D�#Q�9������q�g�jn�9)��;����Z�T�[���Uʂ?�U�Jo������R�VjC�3��䭥���dw2Zа���@�z�DICR��"����J�����D�*$�^.����Ji���[~}�o�bh���.�X�nc��n~8}���Nչ��'o^}�oR�M�y�����_]��������ٷ��s�4��==�
}�_�Ч{�}zy��z��	�o�������OU���AJ��A��J|��5��d.�n��
���X8�A�*��u��`��3C���T!Q�`uk�UP��UA�p������h��U@4����>���i���M�	�F��]��UMH4�؛�h �MH4���$Uz@�	�F��CR�	� �B��@h�5k�-�;�v���nM(�*|���"H^���)7�jA5�ZI� ���iB�	 7A�,���6���y?�o�N�uLr>����\Cg�6�o[
}jjӴ�|�Z�p��_A��9��k�|V]����:H�h�5?|Awk*X�m�3��Am�i\O/�4f��ϋ��Y�t/�n�wvj٥��M`��i`�s��mԐ�*�46VM�IZ��].�OaѪ.\U6/�'o^a���zL��&I�VOG}n������7V���`�e��ǯ�h�3���mj�Mz���e�
^@g�}˝/ �r���:λI����CR�
�v:V��كQd�	��;�Q��oB��y���.���@�Jmw� h{��f 
��;Hd��	���}�$�m�n�%���6S��F�dtt��d#I�N���x��x��$I�����:7��:�����]�s��]�s�yڅ9g������I��>
]�c�vΌIA��م;t�Mv�W����ꂞ�]�"�^P����V��ʥ{���ɐ��[#M�N�̃$���~J2/�d�$�|H*�Ŝj-�_̩��;���_I�v�zK����0I��e?y^�H��Σ
�S����˔bŹ˒bm�˖RXPv}�J[]ߟ�W,kJ���&I~�$���W��{!��b�7U����T/MU��$U���i�F�A}n��v�t5�X�.�ԟ�IY��m�G�%D��t��Q��CUߧ_A��xS��v��e�7
vl�껐�W���Z|[�[�y�j�m]�oշ�Tm���P�.�_I�A�fSٝ�J��;aQ��뭭�9�DYWr�T�Z7�8M'k�]��橨	�lr�p�
<4��r<տ����B��m`�xIx��]u�"�l��Q���Q�1�i��)���j�w�Y���^�$Ղ;ڪ�ݡ!֫3l��zH*�VL�ZY�Z�W��E�]�R�.����$o7��:݋u����_]dS��ސ�ǤYIV%U�{Qo�j��tw� ��rC�c�xq�{S�ә)C�c�wq��!���!�,�b��8�]�V���0g�����R=;�o`�`\>C�3���L�!رj<:Ý*б�<:�=)б�<:��T�5�!бF<:�F<�;��*��W��X�3z�!�p�
y���Q��h!���!�ߘ��(C�3�Za�t{�ו����Xi��ٿ�?������^dw���A����P��!by����Y(d�
M�!Z4B![h�P��M�
�!��:�BˣJ(d�V, ��:D�T@���"�S@�@�) ZݿV��A�Ph1�Ph�$�;I�W�M��I�p/b��o
���n@!��>��N�������W�ob
��N>q��$�r mpkb���&�k;so
~6��d��= �ٯ�5?6�N�K��$����ɛWس��7
���e��!��|������)�����>ߝ�N�w���&o�6�N!�adO!���St^����;B��)��)�1w
�J�EY���) ��8@�{Pa���3�A�*��5w
��q�I2mYA�l%���L�3k7�aRL�'�!�f�}�Q>�����Z�>��A���n���l���Ny<b����cL�K�yS���x.U���H������D�Ϧ����S���G�У$��*�9���T�[{fտj��k�VM��N����;�Pܢ�`T�m�p,�����}H�v��g?��Jֈ�au�FRϮ�H�k�a}rj]����E�_7IզW���Ko��q\z�50��]�G������$�{o��:�$I1�dQ!�dJ��2}�-u�U�%}�2���tk�K��5K�%k�Uʥ^�J��Ku�F���fɤ\��YҤ���[�Ipp��$9�c��F���J���J2�
���[/6ݷI�s��`�j��ki��
�R���XK�۷/í�٥�V�[7�j����O�T�v釤~�����z!ɯ�����F�_omV)�4��g��Ӭ<��;���e�qI��4�%��Ѻ�LR�#e��K�A�kt��V)8=;�K����5Ir�J?�P�cJ^B��g��U��.�'�ز�0��ˣ����­q�q;�{!��3y&3x	y�Kȳ��B���q�晛�$����q�@���K��/�RA�".�Ύڹ;��dB ��Ǧ�%������`g���%��n���۶�;��-�?sK�����|	w�5[��R��N�}�M��Ǜ�K�c���x�r	z�o�<�����T���-�9|��`���m���j[����}a����$�p�d<R!tlG���˻�����w�������nr���t��&�;PT�[T�r�TqUU�{�Z��7Y�'vU���]��nV�t_������}�7�E�n�}ч�K��tk����Y�}����N�j_̑9��rA����$I��T�m�T�^�w��Ŕ�Oľ��m��H�������¾��m��H����6>�;��Nw~MՉ?�I�9����j�f�6ߑ=:B�w$�ET�G�P�Pc;���hV�B��)�� �j���P��c_L��p�#J��V��¾0�[�n^�ng]���Cݦ��T�_�*$�������H�Y    uzh�A�_'I����<J�&�"i�u���
�\����[uzh�NRu^ ��OsQK�~]$]�&M�9n�^�h�AJ��6�ߧ}1����/��#��@��IR%U�^�(�GJ>N�b�
��s!�{!.t�x����:�W�� �\��z�~E^�Aѷp?B��@;B#/ʏ�h��v�F^�����GX�-ʏ��[~!���G�4X�!�||��k�#D����@��NG��ݨ#D"NQ%�Ï�[�!���:¤� ;¤�H	��%%@�|D� )�T�� y���&c���K%<��� �G�d:�#�ȏ�hžy�H^d!�jv��y}�H^C!��Gp�-�#8�o�������?�"���h��D�����t�D�������`��NG0�-�#���m��Gd�#��8��t�A��A;�79�ԯ�ޏ ǟ�#�a[�����~9�9���uY:ӝe���IR-��7�ܨY�A�W�G��U��)��Gxc_�s�f�����݊�ͣ�u���c���m"���a��m9qd�U��S�����X8z�c���?�����Q�SZk[M8ZG{[��*�M��zԤ�sN{TO���<v�z�AڅM�.l�v~ս�I�ҟ��cQ�ț�S7�X�K�!�ez�����(�V�c��Unz�Σh%ZⲨ��Z.�����a���4M�2��0�EXW���ߧҷ�b��v�{�
�'�Mߪ���rŃH��!M/�+]���4Umϯ�5��Ҫ:��W�I�鴚��I���]1�q&��=|����`��<��ip՟�-r� ��Ԃ��`%oɳI;���)
���=��_��Qx	ب��G�񽷡*�O\ɩZ�_~�7��K�߄����5�yE􌧋Q�S�ũ�3
�e�|v�xk�K�&�Znm�w����Hw,5 �Nn=��Ǡ��K�־�6�R{�����~Ƿ��=O�=�ng�G_���"c����۰��#Tyb���v���
�F޵�l�]�6�$��F�A�6�B5�(7]H�<���u��m�{�lv��iվ<�m#�#p���Mo�<��ͮ�EN�ګp��V~yy�{U��;�,��t��Esx��~靃"�KҔ�Ik����=��M��$9=;��Nyi����,P�=7LҾa�wܨU�pł�9^�i!ڌӴ�l~���4k?EބcƋZ���A�[w��E�Ɗ��i��&��z��O��<�=VO�潄"'��̈́"@�S�@-^�r�V�������\��[C�h2/,Q?��g�١�ȳNijִ\�� ({}�e˃GNp���g�v��w?�sH�p,��r�;�D0��ۦy`ח��Y��'�&U�:�&yi�,0����f�Y��4�
���O,?/�,�R#M�³8��?�����l��4pv�HH�_����d`ȎqBRJ'�±��|���c뵞o��e��\NH�#����eS܅���Q��?�2��|�NVPv�P��ZS�4�@0I�vU~����O�V!����{��ȯg>y�
�x�o�\t�Ŋ�x
�xjn��S���O�A��+�ڰ/J��ˌ���Zf��卭47ȳe�]N,���� �&�ܠ��#$�M:�%��QN�3z��Y�v�E%MDVi�]����i�0I��E:7�rO?��Loqy��H����Ҕ�.��hyrQ�y����_�t�V�7�t�V�;�,y�z������ǿ��VL��_x�ȴ_y����I�c���H��Ҿ{���`�r���V��T��ދ��&�J1���"W	�jҫߦ�Ӌ��IR��0m+�i��H�/ì��r� %�xHk���`��Q�ֽC��+G'�S����C�[���?��z�CU���!MuSU��_?k:rV�U�T���I��A�ǹ 7�0k#�4�n�=i��>�T��>ۯ�.��V��H7[F�j��hu��fS��1L��J.���f�s��l��Nj�2,l��w�"y�s�)H�Y������"�l%+�|��)�h�y�hV��<�oP	�AkOy��O	��T�y<�Ak�xF�����kP�6����AԆ��*�=�iG���=Z{�Jki3w�ݧhWi�Z۵�.AE��Ӟ=E��[8E۵�{�Mډ��қ����{rݟFm�*�ʄrѿ��J�L��Dq	碌k���{�V}\���W�k�sF��1P�G����E;�J�%��u����H虐nX����.g�is`���B�]�i���M�9�#��(���Q��78�N~՛����W�=8��G 7�uHS�@.��6gtmm���o�h�o&�hGO�����}�$�cߢ>k�nF��>ݜ���|c�
i�.t��&��L̞�m�˄nQ�����Q��2A�L�	�f�L�F��҅4�mQ��8W�Eж�`-y�Kr<��^@E��Ӿ?E�se�وFQ����E�se���)q��ޝ6H�K|�t�0-��ړT:�-(��8��z�Ƞ�%T>��S�i��,������8鷴�H	���M��]��J{�Ң�kcQi��E��^��$H�gѶ�.�g�v�E�yn�{�iQ���4��v�|�̋��ftpm��7�S���HO�-�E}s3K;|�mL��POA[�vm�ɋ�PQA��ʹ|F��w���h?nF�����>I����r��&��Tu�k�ٵ7�=��];o�S�`-*��Ϧ}΋6�fBC�K6���i����1���µ�Y��I��p�>EE;]���E�[�I��ŵe�m�N���mў��vl�6�V�H�儋��]\[	���z~�v���5�otoW�Y]�4��ъ..���[��+z���W��?_Q�����~kOIi�Q���I;� �<�ޒιȦ��l��s�%V�<+�Xy��h���Y_Dh�+��®���3�jWGn6�8'i3/��8i��|HS�E��3�if���p���p+J���׻uW����aW��z^�R�{�mҼ��ʗ��~HS�V�{b�/6��F_7ҔsqM��|QcE)���Ҿc����{�A��GQ��#y��Q�{%-���Ȋޠ��5�g���3�f���T��Tmt��0��!�<��X��+�ʐ7��-�S��FymP,�<mK,�m1,oCm(��sD;0"��v��(�J:w�b�[�E��k|�(9�/{y��o#�ȋ}yϲȍҷ~s=9���G��߻Ң7�z��;)}k�=�ߪcœ��>AJ/�.G�Τi�4���5�(OZ��js''�F�$zM��=�"#���q�O��""�9imd;�H?	�B!���<��l�&q���.�8IS��m��ma��Y[�L�ڢ��d����4�^�	�WY��Jw	�~ꈼ�Wl�2.��!+x[�{f!����L(��Z�1��B0!{.�S*J�ӠL�+�<���ZUd�]�"d�U�O"|{���k'�
�,��b�R!���*2�.�0�S�]��L�ˡqE��uE&Q���j�?2�~���+���"��ڙ�B����E���r�������E���q��y�/\�E+!���t!M�¹eE\�[��t(���^�Aݏ�BX��\���*�������ȼG�+]��;��nE��]n��Y�V�Y���:C���r]�MWd[�|�y/�� /V�I(�?2�x�X0'.V%�i�>�v'MXjnߤ��8����!6�:%�L�m?ˇFb����+aXT��m�Iߊt�y?�6��d���q�}F��"4��O6�m��2	���2AW�Y�����O�_� ��ۏӹ�Gz��羭֤d��v�.X+�=ɩ���퓴�Y�����n7�"���b%��_U��`����,�?֪" "<*�i5E�&�m~����v�aѢ~��:�osA������n�Uy�چ�w	��쾠����z1��<���l�]�*ϛ�M�]ܝŢU��+y�Jv�X��AU��]3�CcO򢥦Ҍe-5k:ZkE�H�������2��1Q+�m��"�{��&m�8��h)��&��/S��v�M
y���+Z-HGk-W&���eZ��o�%َUk0�y�����ֈU*��b��b8բhחT�!��%ώIU���ha��_X���vc/Z�(��h�    �[�v4���^�QڥҰ���cc��B���ZC�8hѰ�/�����a�k���T����\�Ga����a����{�����T.�r.�>�\�䣿��¸G�/�S�0I'�B�g��Y��U_i�U9���P��"*W��y�����e-#W��H嬿rؗ��ɐ6iW��_c���%�5=�S��vL�ZR�L���1�j��c��4yTu�P��O~?N+��-D"��OVOZ�����0;�!*��da�12|oY��Ⱥ���>T��%�����K������;+$��dS�pYIgW�EM�o-¸1s�v�l�4U�Fq���q�E҇�����tTT�,s���,�����]�H�ݱ�Juݿ%�4�K�4�oT�Xk�`�Xq�E*�w&�������.����M����,�����}ä������Ƀ�[�rYKI)۳�nQ�y]�iGi[�s�Y¹�b��nz�8��+�h�S�(&^�7r�����A!Ee�o�HM١$)�)�$)R-vl��v�V����Z�����>�;�]}�w���uV�rq�wG��}��!����-%�!/�-���z��)����a��f3�]|2��ڎ�,���[蛳���w&��x(7�H:��O��:�>��4�]�X���[��~g�%��q�Z�,�@묁 �Vl��y/��Y����!·�� �,}����,���E�Pmd;#!��-�@�,�I{��Z���}!ˎY�8yp�ܱ�	�?���6F^���:Sn�׶0K�r������dP�*4��a�g]���W�`΢F�qg������}�F�y~SB�5Y�h��_4����1"?y/ޙ׳B����B�'�~'�Y����^�y��d�ϚD/�<�� �{����Ѣ�rb������%�۵�|~CD��?�X���"E=|��P�xªW��aV�y~�u����<����)�(v[=�1GI�3ӑ=؉�Vs~�5���BM<���SܵT��窆��n=q�P��Ձ��8`(���Pվ��r���������
N��O��I�Aa��ҕ�TA����IS�H�B�[V��|�rZu_D;�P\���~�؂�s�P|���B'E�,,bp�Tc����dp�W�(�c�ޢ0����=Dh��*���O�P���Q�mp�U6���opjX%�����C㇡��ߋ���U2dW�vp�R8���q��䅵���Ѓ���,|p�lP���K����Z�p�O������)W�BN<��p� \�pڧ�������'[���m��h�6��K8�JQl���l��d�lSH��'�,�pzf��.^�P8�P��ޡ�Ҕ#��އbN�)�p��P���-�;i��esD�
'�ˊTP�����`.
V8qgV����c�\�wU�
'[&�V8�`Q���B!'ЊYP�"��D*p�8�*p��_��j7����"+���*f�����l��U1�[ZT�-��*l�K��yg�*f���"l��T��1�JU��1aU��1�JU���KU����JÛ���l��sH�G�6L�p�3Lߨp�3f�^Sa*\ᄇ�*^��P��XR�"��'�q���W8���C�`_i3������*b���>x45��>L�����)I#���6�0����,�yp��L���Q�p�#Rv�Lg���5�B�\���O��Z������=��&T[i�Pm��v�7��4u�]��R�Pm}L��Z8v<��Z8�񐦑B��1,T[��'g�ß|�^�Y?�,ʏ��f�������������g��~	|o�;CX�fo�p��3�i�C�
WP��,H�{rU����3=��~hA����Pm��j;�[���gB���$T��3�W�B���-T;��W����@U��9ڐ�Էc!O��R'Z�v2Ѕk'�!\;�µ����Lu��U�p���
�b!8��P cn���*`�0"���u�������̲���&�$Y��~��Y��lW�
���a39W��B���B�T�!�-���{e�%�G²�6��}�q����Y�	,,���q_�-^�Dv���k�RZ�MA:��>l��g��`<��$����t(�����=yLtG�T��o'W3�t�����]j)z[Hk�}l�@��Ao��o�XM���~;��i*��~ϓ+�3���e2����^[���y��`u{�4��I�u�&ܻO�4��I7`��,����*��gQWk��2Z��0a$���p�g��0T>��
�m�)p�9-�
}^�mhf%�Ad�!\Fe�)55�0S�@�
+����k����f�\Q3��~�̴I��bۖx���'o����K	}�"+D����qT麙U{�Z(sGH�*Ԩ��\�5DzJ�^��>�yf�P�U��C�W!<�=��(T��U���R��5����̤/�p&�$�{E�3hX���i��P�������j������Y#Pz����ն�
k}���*����
y}�B�+ğ�֫p�W{�T^N8�*<�|M�!3���Z4<����_!�+^���ǋW��3���O������K5����b3�G�3�}��Y���R�s?}�M��t�6�V���U w�}s�y��[�|��n���h�� ?�`(���	��m���\~j�b3=�zj��t�K�w 랙#��7'@5���f*ӡ�5v?l���旌O2k��JW�`]k�|�E���qy�a�ƕNe��JW�k�ME�i�p(֨���9�V��#֨����QT��]f��Y�J��]�֠��<<�����j�yl����t���[�PX�V�5{�5�A��s���z��g�T���3E��F^��VSO�f:C���3�0{��Q�#C+L�-+,��۷�Q��k��6o�T��ZVY���6} �QT���9��B�'A�#O�#��P�|: �o�F�������EZ�i�^�:
�f��
��{�B�e�	�o�S���yC���߼#R��k�C���y~���v�P��r�+��f�
!^���*<x�[&��f��
?�d�Ԯ���!pm��`�k���p�5o�T��[V�0�5SsT��Z���7ǢV�[f'��m}h�\��VX��o����2{!��W�R.�^��pU��Z�*�nm���m�C�!��p��LZ��Z�1+�n?"�
���i�p�e�����)�W�m���z���
72����]��ڷR��o�,������p����Xk��h�1f��E��F �o�e��?D`�	Rn@�_�
6����	�=�,�S��iݞT��瓁�SHs��x��|�L�s?�N�i$�a�A��T"@��T�H�o>��,�
���p�9��A�s�#�G�d����xP��(���OV�J���\��?�У�sF@�Y@���#�'=�>tr��k�rVI���G!��y%�7����R��n�� �X�3�ۉ�2zM�A�����X���mT��;Va|뎷��n��ʻ�X5a۷���gbJ5�JV�I�Q���{��j�c�j���^��e��g7�J�t�UzA��Cd���*����SM��ذ�P�uFV����к�4Wh:��9�V��/���80����Q,2eв�9=p��X(���~�RQ�j�T![�k�� ��+u��y�z�@✟�X�\t*ɞUU�W'�-��zA0�u��ԎMA�1���L���劲� >2w!�YA���t`��Ѐu�֎kJ���I�����[ܱ�a]��/�.Ƚ�"U;X�/<^}g�u;�����.�,\hX�3�:;%W��z,#��.{�`�)�gD ۴@� ��S�����h�8�ꉠ+ ۩z��㤪�3v-�U��i&��LˇǏvlg�iz��Pgu3TV�gń�G�|5U���Ґd�ͪ���:uW���7���9�����������5�f2�: ��2\{���Yu�kU����*$U�.�n���BW���#�*�R�!\��PnUH���]!�r�$n�6���x)��&o���M�5����|HC��d>�:8�    ��-��	Nf/��3�r ��'��P!�����d|��Uq!%\Eʨ�78�F��������-��mT�u�|��8�Vx�B`T��1H�FpK�"%F¥�Q�����uڱ|�[/��iG�@o|��uA���v�Z_Rx�*��Ш�]������V(KH�*�Fa;�P��`�
E?�E	7�sT;RB�Ta)#g܍m�َj��ó&�a�ƪ�_�3O��N��cEx͓F���l4�5�+����@F���GA$t���pU�{ 9�ʰ@��#��*��#���j��c��MA����1�	@�3�g�U@I	QUDI	�Q��&lF����'�6#�z
)!����c�lB���BJ|E���ΚpU�h8\�+Â��+/���V�g�e		����\��-�X�/!��{����lW!�����h�{�ȎhÉ�-&���?9�.����򥇆%�G.��L*�&�M%�Fڔct(�G�P�;���#�>���9x�=��d���u��>��NP��UI،*�##J �#�~�mdd���/�q�h���`	�Q�$G֏��B�1�!2�|���殬u�(0u���� �@V7 �'�	�f�.��WV(4B�T��������ŏ$�Bh1M]��MR��b����b�M��
'�|2j��3kR�'�cx���ɸ���-]�;Y��"1��i+43kR�"fɘĖ��h'n����D�gXp����)	jD֢�8LG�T8f�����>4�Fd�����)	�m]�-�Μ	�ë$,�g[�=jD���N!�l]�%4�OU|J��$t��6d`m�0s�6�mڐ��O���C3��N�@NM����!ة�Q!f��j�:�K´�ljD֗�ϖ���FM�g�:��ïS�͟Q�����	�D�O3YWB홬:��YT1���;��@�Y,*���f����5����@�J�;�l�M��g�*t�0��*�贫XU�J��$܆�b_�"X)_�eړ�.�g9R���-����U'��G�r�h�_�4�z��x��.�I{:�G��P�|��L6�����$.�uI]�4uqq�hN_���F{���F}C]�5���8m�=�� 3�0�G�v�����B0�564 3nF�����G��}qFn�L��g�	��O%>�+� �w�p:&�s���(����q�3�a����{�>�.�3J�8<���%p���X g�@"�g�M��$�|F#\ �����#r<�=�X����*�J�w8x�7����sE�^ :�˰���2�=���=M�]�Q��sN%�zF�#�zF�#j�c~� g�6��� �y���3��5�#�@��Yq	_�M] ��+�8�;�A�hw��L7�0�2��Ν�t�в'����jƮ��#�7�7� ���*}V�@e^��݉���ϗCac�!ȕ�Hn+�Υf!�����aAK�X:L�i:㻲Aʓւ���8�2z�!��Dz���:�3���3�Y�i����9�U�	W�lz��WBD�+`��h*��+*ђ៩�B.�pZ��\>ش*Ʊ�j�0r�m�*���l~na�2�x%rq�'�����
#C�R	@�G����*���ljC��Fm>������}����l�GH'��)�#�hE^��i��B�'0��[� Vn����J��6��Vrns6���ǳX	R[��?[>u�n�o���o��Fdي�Fh�2�x%��+o�jG��[���"̔�8g�T���i+a]�l╀�/�͡���/��j���l�T��i�+�V�f��b�W�Z�[���MCNn|ی �X�h�DC��:��$��%�\-8%�\Q%�YZ-c^X�Z`JX�LT^	aZQ�[Z����_\�VZ�	QZQ	J�J�@�_��oAP���-�D�gX������JЬ
�J%�fe������Tv
�AP���Y�#��̬l~%R�J\̊�"1,�X����|ЈM�w�Wh@v�p"L������ljA�	J%�=�Ā����r��<�{��ګH�G� �{��1+O��	.fS�ȍ�ѱU"0B^R	�Xق&F�3���&�" �o�����8�@����4q�g8���Z>X.����3s���]L�>/�E�z�*fq~��?��o�{P�>w���ѪC �h�z�S)�x���
]y�&��|D즟u��?}Ah�07�9�x��g��@Ϛ�0Ћm(��/#W�� -,�;�o����jط>���w���6l�ʛ�������W��}O������?Z�j���A�	�۫�~^Y�,R��R�0���?zͬ�JԬ��<8|�g�����B�&���ڃ�bxmq���08�loQ��ɂ����AY����+��8ٲ�l����aPz7�=���'�=��E}{N����4��0b��#ڃ�a����^x�=�a3�6;��ۃ^��w�M��O,i_|o�4{ܿk�f��^�.^����=z��=�_z��-x`����m�����ӕ|�ו�S|(v{x1�[o{�~��������:��7�+���C_����x������z�`w�$�KyyR{���{�E{h���hf����6xק=�4�J�4O�Qv���E�-�� �>��9X�Kur����l��9���s䅀���i�#pWst K�+ �	�j�i�������m����p�ܻ�7�~��\�8n��y����)���T����� �̨c�b�/@�ϱ�= �Lw �3����W�=`�L����ahXi�����3��\y�`��,(������`7D���=��ʤ%W�8(�22@ɕ� "W��\��@����+Dzӧ=@�I�Dz�� �zT+@���j�4�B+@�i�;�Gc7�uB���	�B#\gg���Oֈ���j��r�9r�{>͑�Bs��!;��>����_��F�ζ��	�B#`g{B���m�9��J\s����C)�J�0#�]� .�?6謚�D�l��݈����R#p'����84w��-m��O�k�����F�N��;�4�n#rg�r���<ӈ��v.i��l��4�v^z�F����Q#pg{O���s�F#lg�t%h_�F��>o�v9 ���O�#�wҋ��!���m��F�NQ:��x��'#�;��kĻ�ϡ�B�F|ˏѡ�r��ޱ�ۈ�9�n#P�<��ϓ�-뉠+�X��EC2MW��W��c.2~i˫ 6�u����	�C#T瘨���hD�'�yӚ���,P��)�wۈL�i���`>�1k�꜒7 P<%CQC����yJƥ����		D#T'T�P�:4BuN	��e��т<ߡ~>Bu�,�P��)čh��}�F�α���s���	�B#T�G�Ј�	�B#Z�،�Ձ�u�`��J#T'$�P�c�J#T'4�P�cu��sliDꜺ���
���9>���sl�h�������E�αKe#N�D�&N	?�w�n��ѢX��0��=ш�9>���R�F�NXa:��jSk��#��m��kk�r�4��r'��w�0��0��> &R��l҈�	�B#L
w�ГU{# =��	�9��T#V�u� �x�mp���DO�sBuΧ����F�N��:�Th���DꜞN˂�ьt:�j��F��	1[#H�|�U 5�7:�$ t.aX���S��5�s��9��R���w� ��� �3~�	���c u�85�A#H��	�/ �҃�*$�z;@������j��{C5t��ャ/'t#D�	3B$�&W#D����F��q�O#D'����U����E�4Bt�z�ё��Lg^?`:�5���Ո�9��j���"�Fp��*�W��A|N��9�@�E��sqZP�s���)'��P'[�����иF|�7�+͂_�9�6�Fx�l5�8-�����h ��=���E'1:ǎS�����㭵F�αCT#F瘄��sV�@�wT#:    �x/���� �ڍ��s^E�؜ݓ؜�n�5�s��C�;	�n����	B#:G���9�t���Ro�5"s����9�{����h��;��s���s�6�́=A� D���s�Ոʑ%Jc����$�i����U����(4Br¢��9�bn��J|��� �d΀�'s��YB��{h�J��f/.�б�L�H��'�G3��aM�9�MkN	��v��h�
�A��hf<O�_{�Otd��XHWj�����xpx��X`�b�mӎ�~D����4%=��_���Ck�Y����v"��y,ЮS,�l�&[
<�#}��D�UpL<��(8�WԈ(�
α��vD�UpN�AP����Ʀ��z,4zI
��#���`�����SmT��-x�)�Q� ,�ԥ
�AH��#�fAI1>TV�8��{�.5E� |��޲l
�O�k�XHΪv���8�R�h
�A���k|����S�/҈N�@�֓+���X�FS<�S�h��=��l
�A�ڰ@�4�n˂�� �v����H�,�&#��]A?p"9[��+#B�J��]^q?R��������\N��s�Bx�A;�k	Q�O}bW��K8�_���v�d���F�3�c�{f���˼��θ)��>ќ�c!] k�c�����81)D��DyV͒�����@�f����݁�(�H}ziP�1tP5ZxU�]wP5��F%�@�g)�j��Tc'ꉂN��zN��w�4.m��&�%������B�A�1<�@��̈́0=�nD =Q��@z�*Z�c�iAPtw@�tB��6 �� jʱ6 ��O���.�[Pyu8| h�9�|Q�m ���o5�D@���(�z �>i� �xo�Y�`�Qm �Qr0�v ��X0t��A]y6P4�m��+MCׯ!`h����j<�Е�C�N��8�6��h� ]� uPz hL� ]yD �.b���'v���.< ���@�mep �;�̡��Lam��1�%��<* �x �;� �<* ��	�`T����p�m����0p�GN��|��p�`�I7��'� �~�y�aFj����h�ޏ��� �L�����X���߀���/�.Q,O4\W�h�ĪH�����;��N������4�;d������)�EV|\g��-P�FA�Y1Р�Uz��y�аD�U�F}����6̒�7+(,?K�B2�M���"�N�@凖d���z��A[f.ҔL�s,�]�}��%�.��~�>��Ü�\|[����zԥ��\��r�r�l��K��
�0����)~*��܈�(Q��c^�*aXp��+S��+�/�0������o�]x��4��P���� s���ho������ ��る/��(������c��+iak��������_b���@UR�����CI��/�9��{��&w{��h�@��h$r�G�&!�I�P��cnY9z�<���_�SJn�%�<��X�mz�h�[Z^�P���Z���j>��G�4�m�(e6<ۤ�4r�6	�ʟӂ��\� ��I2�MV�>--�oܳj��=�B�W��!�l�]��:	+BzZ�Wz� ���r�]�n�q�f�s��'�}�4Pρ�m�z��mԋ������L�:�wm{�����]@	4%] ��|�t鿁�ضM0��W��:NL��X7�v��Y��� N�,��mx+{_QB���,oy��臆r��x�x��C.��p'[��9��� �q>��yH��K\,���b,`όh�S&Kt���d���=�9���<��q�G����.p/~��ݯ-o��@��~�f��3/Z�OW�k�b4^@^<+p�9`[@��	l�3EZ�[����ȋ���]���v�+}�������-�/�����..
��jLm�1ƙ�e�*��%W՘�09�Ɲv �?���,;�l�~��%���,��z���ӣ��}K���.���.�p{ո@BS�6N�dC6-�C���g����:, 1&UNs,�X ��O�Oz@�}u�?�����h��ē�&F�\`b� �* 1�@�yt�1��� b�� �t h�h�&�]��1���y)p�
���:J8�4�x���}��Q��Ck^Ǽ`�*�Pxy�3�B�(aY`�m��8Tm�U$�JS$�����knHW��n���p�9'��(m|W�[//]_yU[��������\Y�T9�"�	��j�I�,TV(��n�iղrV�_J�4K`�Nv�Up%Y�K���H����ZS����o��Yc���Z��B�HJ8d��g��#�1��lY�g��#��&��-���+oN*H#�c���2Ө�,�J�@\jTE����{�T=�f���Gg:���`�f�U%�'AD5r�]ii�𡐖6y�!d$�Y�pw��8˩��;/��G��ʹ)����O4���P�6y�YHnZ��ܴcG��I�[d.�)�;m�x���*f�P�}�T�������W�֟����>X5.�8Z��p��1�6�$�g��l�n����ݠ���6 ��������ƾ��,��ӻ)�'°�Ԓ�L�#.���Νj�y�m�>�u܃j౼6�G����nY}�P�݊3_j�V�Yo��&{��Rc�:����x�����UwGJT8K<5ʂ|v����i�h�{"g���l��q&�#m8�ԟS"��8%⡃��P�3W��&�i�@�l���sx ��E�Բ��SJu�c�H��S�=�[-Բ�{ ���6��A)M�#yҵ�#'kT����T	�z ��Z�� �gD��Q�/:���k��s�YH�9�,M/5^zV{~�P�٢���#F�V�f+�-{��~:���	���d�*��;��T�g[݂��o�Ԟ�V��.�lO�ಕ4ZX�b�Q��������6�ch>�q�B�V O_AP�%oL�ز�)� i��<��<���E-P����������&|{h켷��<+W���sr�
��ġ\�evm|��J���,�vt6���2�����ڡ6g+ڵCm�sn�y,Pz�-B��%Ј�+4b�sٵ�l��jG˃�7;{�����k��T�dS#�صY��=B���"�a�ag������q�l���+E�*]��\�׼�յ�	�*�z�V���L���M��<�Z�F�V�͟��梼2��^ '�Jȵ���E�ȵ�µ�0�k��Wf�-	˂�Wg��ya�.�ДoЄt�Э�.�[���BE`V�	R�B3ܵ��lj�W�]�n�@��	w�՚c�Э�"@�F�Ђ��@��ȭt���=�9�? �ݞ��Dj�����<�����N�o>�?��NW�m�}3x�*�?`�#.��3��ergSI����^�4�:D�������i'��N�/�u�ˠ��_A-��Բ3Qg/���0��mԶ�ꁭl�tv>B�۵qa�W��g�W�.aD�xm)�^�{�_�ng;�s��)ap���#P� %��]A�B5�).Y�%�ukk�T�бv����{�2T����2L�Z%l.�X�_d�6�*�z�-�2Uw�J�,�5d��q����v�@�R����1
w[h;F�n����7��]6]�F�n��A�m�����[C��e~5-+W�z[��m��2�"P�~�fp�6��S�e���5S�Y��"$���>�Z&5�M�F�;�T~\����t�����]�?�Z�sY�;<� �,�<���>��>���n�e���W��C+Ҿ5-8۲@�kGHc��f�.K��_�SJQ_���Ҭ��%D�;#V����ދ2�M��pg2V�m��KO��銤��2�8�\�P-�b�M?��(�f���ƋB	y�ao�.�����X�]��!(�"* [�\���YpᲑ!�.��J^�M̔�jC�ESX�3��C��LXf(UNiI�G    �wLQ�s��
��LN���jA��
٦��vx?�+��Qj��G��)��%�^�wS�<3��~�+���a�+��|�o���jG>ҲO!�B��ﲢ)h�Pp��.|��,MH�  ���]�5��]�.Q���a���Na�8y���vY��]ɕۊ��B��z��I�	��{�����.#Ēκ-��R����9�'|~��xf�u2J��_����ϯ˼d>�����N焜��uY��*���=��Hf����X�Yr%9'�1��p���݂k��$�nN.~EHMڲ����S�c��Y%B"D=`W@�o������&�mZvN5%�TXxs�)�������ՙ���"�Q��l�U�ŗ�a!�"L���N�J�,pZ�ʱ��Sg�+���{�����j��3�iY`���a�WԈ����(�X�B#X�v�L|�P,��e2@�*�¼�݂3����2 �w-�ΨVd�$ w	M�(������ev	͂�J�v_��"�x�3r��,��m���工�JX{Ϭ��t�=��������S�.C�ʆ>�oN�a�R<�=K�x�z,��X��FC�_X�(�5�IŸpϰ@����I4��ʋ����+��{��� ��^�� Н��ݬ7��F��@�/j�703�����7��@F��,~�qv��Ѻ�5�b]���QG�>aN��|~��p��rTmo���d�	a�RU��p���7S���9���²Չ�X5��m���NT��_ "�NTď;��jf0��5�CP{K�r��-��';��d:dS�v���6��v�V�X��z�g�'㠻N8�zaҹ�!!�Z#�ҹ��v�f���-�6��d��p��Q׉hX���D4,��t"ַ��	jX&��D4��+�"���:�L��x�eo�N<�F>+@E4���+�E4ògr'�a�odЀ�%Њ�۶ߦVd�C4��$��YK0ò�q'�a�6D$�2�e'�a�_�
��w�:�k��8)=�$�닱�3,�]t�VP�`����u�� $�ae�D<�����o�DT��Z����[հ��YO���HXQQ�HX+��I�������!�y!����~M�j�v:F�"�ND��%|��""a�`IH�ʺ���ruBV`B~�\���e/�NH�\��ٍ��`]1,����	H0-��e!%lK�I�8�v T0����=��y�v�
vl�
�	;a\�_,��b6��CU��G�MZ݉#����s%:���Y�F���C��oh��1��x���}�H��!<�[}g�0S9w/jc��Z��/�^�~Q���0u|�%��ߎa�ч��FB�����4p��1�E����E��)D
M�w<�����q�kIǙ>L!g����i������;�I���I��ϯ,�Y��R��wt|����bx��h�ǓN�f��>V7+i��N����0v<�w�:����a�8�#w	�H�Q�3���ߟ�w�%G�t��b�x������ǹt������?ٻ�8�O����������<�&�y��3�q��E��^ݥ	J��{�)�A*��o�&a��x؇��a��!���z�՟����cB��g}*:n�PR�e'�K���w|��:>�Ǳo��c�ΎO���Mǧ>�������R�/�Rb���Azh�Zgz	.�4KΧ6��ڎ7�yu �����Ҳ�Kj�عt,p	o��������+���fǗ>��_��ip�'&�J�\�ɕ�t\���̟�]v��]2;N��EU#W���=�BJ�땶%Z[�ʺ^��^�����[��I&�xmV�������ާ������'�"|�!NTmB�c��o�v�]� ��t� ��FJ������m�_���H��������~>�X���|� :�����N��,�O����;����dD�c�+��V	Ɏ����#��E �Zaz��
���'@Gӎ���.��g�׀��v5��	/��?4a12���}�:~�'o���:��pt���.�P���j������C����C}x :���8�'���P/'��r�ΑN��w��O,��ӟ�!֝�'�.�sxҟ|�O��Y>���2Nd=!�����0�������}��3�%թu	��r�7�%%N)q�R*�W��JZ��Kg��$z�k�K�ON�-q�]����.�y����C�)aZ�=�B����g��|x5�P��Xh��z�����r�妄nA�N����?�r�����H�L,~�k;��Ω�D���<�^$����D�l�(�ؕv�:��+Â�R�S>��$�<)���c]�G<��t�I�;֧C�������3��-�x_���ɧ\�-��N;�Y�}����:MI�i��є���mɗh�1���2��4h��U2<����vL�O��ong����oΧ���wy�CCJ�&��\(aN)����s[p�c���~>J���7!�]��ދjI�c�-�ɦ3l�O���bS	+�[���3v���/11�kyZ�Ӣ��S�{���͔.�݂A��'�"-��tj�[�e�z���U�a�~Fކ�R�\(�X�X����B������T�@��F+��tĒ��q��)�UrB���<n �U7�2D�
��ÒY��h��Y%nP�J����`
J�ģw��u�a�v�9!����~�F��~>�ӾA�(�(���%�/D�o�0Fu���Wa�`�Lg���"�FH�Q&a�N�z���\���rj�1;�m_�c�YϨ�PB?�V
���U���n@1��&F��`b"���/����A���n q�W��(��?�6�AC�H��v���)h��m��3���(��?ߙ�}��+}�*���7x�?��o0���"1r<;�O�pO��1���;�}��Ν�;��>wF��q��M~� ��y,��И@��}�c��B7�g�~��%��\��J��
�e����'����4�~�`g��6�k�������A�}���6���h�P�>��@����o��f��<���xW~�Q3��<?�/O&%x�2�Ȕ�-�̓+7�)c��G���`�Sf�+c���yK�2��.fYv1����w�FK���-qb�zR�'�!Z�'+H l��lǚ5І���]!-��]!�DF�8�W�Wi��Ŋ@ȥf�g�=�(�V�C���Dѕu�B�E����.S����B�,�D�����]�T���w�8z���,15)> �fW@��s�c���"|�	���Ǚ��͂K�T�aԇ�S�%A��t��#乄�%�
��2��՗ ۳/5��fDՅ��2�	ZCm,��v�Ʊ������8�xU+J �Nd�xU˄cjh=��2����ö�4�F� 5��L�ÒD�b�/@����e�eUi	� �BJȟӷK��8-��%�6���:֌��.������5�n��oj:���+W\ܶ�p:�-��:����eh	*�2@4m�Y�pa#n�jCz�ho�u�*i��Z�� �K��}�q^���`�^|���:ri͂J,���Ұ�K�b�Ҳ�K���șvW �8X��/�j<�"�IhnǌP�'�x �:��Y��&���G\��=�m�P�{/X���,4X�F���Z���j��Hhr��f�,��ie�3�A�ٓP,�T`��|�V}-���UA�]����z�E"pϲ�W 8�O޶а��2�B�7�K�Ú/̀��>�NUy�}ZH>�ʻ��B.Q����X�A]yD�y�!���S����� ��oGP6�W-iĬ\¤���|U��`Q�Ck�N�g��lz
ǡ����=�u���1YO�Bx���sU���������੽�'xj_�i04���q�v�w���!�i=%�a�[���8�N�����t�����
!�4�hf�	[X2Щ�IE�	� ��fmoH]��B��� _P�qK~�n��!M�H߳-����6R��L$    4`H_������"��n_��M�P��ߡ��8,�䓪���6�r�	CB�3�$B��B�
=�op/鋺,$U�\:|�Q��3
�u��*|�ԝ�������N�ag��k�Nx����;i(��2�j�.�f��n��F���������>���|1{�`��"��w|#��Ca�^�d(f .Cʗ^�Wj|������;3�i�p'���Z(�j�,=_}24����
�WF��o�
O7��ԙeɎ1���&m���o�KW"����`��� 0��v#E�����A�,����xf:�w)v �g$D=��܀$�̃��uuˋߠY��%@:A�ʪ�~i�]�5�h��b��e���AB�������ǀ�� �5p5:ʬ�6Ȳ�c�&�S�'��3�͏� ����E �7��U@��OL�<��ԓse��^���s�8������/��\8u��b���^<���wl;�����j_$�XvnY/׶,��9y�z���h�xJ����rF�]o�宵%�r�7��&K�X/�p��z��f<xż6�&>�^�!3g�p����y�`:��z	��9�ď�^��TN->z�vr�%�} �r�x�Byq���z�i�_N�t������>֋�9LE�	 �����w�z��ۯ{�6b��'�aߡ��bf��G:3����^_���b�g|��Й%��u�ݣX�˓�"�י���G3��tu��v�{�̐q��"�t_��^��3�E]��^�湾?J/��9�Ǖ�gW��:꾝��J�����P��L|�3-�/X��9�j�)`�H���Μ�v��J9A8������\��e�t�:�Dֿ���5����;� }��@Od�����^*��v����k@E�EPQ+����P�3���;`�('��"�5�"�s�C���4���9�(?N.�ϕ�y=iBBX����u/[�L��v�2*� �v������׀��:n�ظ�U^�� (�c���e5�r����p���Z��'�I�~ʀ�ONU��NU�	nr��P�C����v�5�����suV�ՙ1���Bsp��ր�:��L-���k@[N����Y���J��e�����;�qu}���㏚�v���n϶E���IVN�N
��9q��܏�[@��Z�wK@����%u��F�.�ٓĒ��j�{��r�z(���ߛs�c���Ĥ'�g��}��l��\|�(�Н��6w�%w|���lY�}��?D��'�b~�yVlY�@9�/�!^����ȅ�kp+E�L��z�8�<�W���sf���Yn�dgTU��K>�dg�{ש��)~F28K�rp��b�𝧑�c�����S��-�S"� A�TC��k��ȥ�K����S��hht��z~M�O�dxb���+��������vN�1tk�Y���t�s�E[~LBD��S��K������|z�'V<;SD����t>"�h1��K���翿�{vM�qn�c��&�{��Dbd	+j��wo@Z�]~M�3ɍ��?�7����E�?�W/-���.�௱�F�H����Kn�.I�b�:��
��E@yݑ��r1ߒ7��?I�͓8	�DMm/�%������<m�����*X:�O�7@B���z��3, 9�I��l�:r���`�#3u"��A�|�\l�!5%I�d 	��t�#璁:]����3�'�8���Ed�~v�-�ʥE�xnUZ��'%��Fzn���4�s��6 	��})K���EK��.9�KN�� �u�꓀�-��0#G�wuV�i�8~��K�B��Cw;��N �U ��Q�lE�~\����G�F��g<ϖ�t3�gK'7R�0�?��q�Z:���O��#)s��t*��kd�H0}�Pt�cܞۀ��İmi)n`�r��P���>�B w,?�n��t���t3�裍�h~"�Ԙs��i
��:���4㎱t,"u�A�Z�s�?��_C ���n��$��( c��f̶KQ  ��GR�їNO��AK �����)��NO3Vڥӌv�4��B����o)`&e���?YE�;�����P2��Lf�,Z;OX[��[]ԩ/Y:z�'GQ0 4]HP)y��KB,�u�0���#GU�0HE�-<�J�UuZ��t�KGR�0�~��o��)iK��[��2Ȃ읲����bT[j�[iM�v� -���Dմ��׸�4@�i=��LHNb1�_�&�AdR� �K�s���	H�Iv
_�|�A�{�}hXQ3I����c�&Գ�X� �D����}K�d�P]۵e)� @#����,�̤^� �I�A �C{%�~ۀ&�d��1�Ō7%޷(���%.�Z�:��k�S���?���2pI��o��:��k��!d&	�R��|C_
���/@2WS?�(>�T�O,�<�K���0xLl� #�XN�w .#i�8��U IA�J\F����ޯ1Aq �B�kp��ט)��L�yW9�+$ߩDx
92����ђ�v��@51yE�v���NI�=gQ51��;S��s�aZ�`�`
̔Xɡ��|c��ykZk)@�d�[:nM�,4c�I�	� �Ye���4p�pkj�k|EE%{��jZ�)�ߚzR�iM��c����?�0w�t4�0wɹZG*�(' 9*@]��"����*rߟov�rߟ�2��?�l3��ʐ�>�I\m�5ʐ�������ϛ�~�Ռh�uz�%�}��<T�ncPM]Ǵ�\� $	x]˳HO�779������Ao,6r�ov�r���E܁�����A��s8�2�pP�C9p�/�\�N�k���@B��ȫ^3���:�Mص�詿�CE�p`���a({F�CEkp�������+�K?�R2�kZ\�հ��?�w%�J�ӥ���Kz�VO�z_%���y}&���y}&����L�̥3�s�hf�U#�,��I_½����k�fթ�k�8g0x������,��ϑc�N�s�(G B��F6m��7�L��F�mr�7���}f1h�6�1b��?�bsɱ�������ywb�������Z�����&b4�c?@|*�~�|0b߈ǔ��^#b����Ք�����oLMIa��%�~2��dx���?��sɧ ���?��sɛ�� ��I��
<&*y�;m�-&��+?iChP�8bі���'�S�~L]G�#�}��-����?�Ys�s��i@o���Sx�s&���>�5%GTG��'c	%�c�3!2���DBd����3)6������O�*��F����'A	2Lڳ}Y~� ���:�O��=�DҸ�k��'���	O^�32����!b�Xn"��d^DV3<�����^Ov���f,�r�К����ƍ�ν\!:����x���o���/�'�ψ��o�o[�˿��N1�WD5G֯X*)8�Tu�a�b)>S�����\�7H"i%�~�`
���l��)�/Q�t<Ӓ��L��%gxR�Яf�L�r�7���1u��D13'Sy�'=���ηR.y��D����L�%���ˁ���~񢲺������m@"��S9��J�>�*s{�#�w򊸄�O���O��(�I��"3l&�v�&C�����#��9}e���N=�o7Ș�!��h��	�fܚ������| ���~>rq05c��@��o����zI+K��c���J�}��X?!����$$�,����f���͒6�%�ඩ�����@��i͐iCW�h5t�cCV��i�*4+�wg[�LA[�]6��3%�ok'@ڊbC[9]7�oĆ�«m��Жsn,����[��\�����K: ��m�u�W;���-t��8kőP^��:�ȥ}^��,B��u����бq�>$U�LR�%�3�j��$�Bd&j�&BdZj����+�T� �	�'J��$��	Q�z�C9��%j��~.��y'���(pe3*�w�� c#�w�ry'���Ik&�<��+c 9|��rr�q���qON�e�7�-w�����-���-��L    �[���[�[���x�T�`j���9n��'��6�+1��ǖ;�Ϩ++���ݓ��v�>�.|xL�GM�.�s"�e��@�1���-�v��.[N�信��1��0�b��Dm[N� �HAl9�ܚ��|˩��q�@�̶��I�C{����-�v2���D������p�m^�<S�X�[� R� �n�P�v޵n�wz+x��W#����V��AZ�%��V�.�!n�ʜ�ǀj�5`��2���<�I��jǀ�Be'�
�:�0��d&`����V�5�ت2rت2$ت~C��l���"8�U�[�"��k��#�֜�����^�o"����:��e�����:>�ՙ]H�#$��Y�0��}��3#Vg� �o���+�S�P��X�}��Ϥ��
tJ�x�ͤ��r�HZY�ȯ����� 	V@� 	�ز��er��V���a�g��׶��o9�x�O6J�����IÐ�^�¡d ��k�f�-�{���n� ��k�L��k{{��wo`
U����9��LǕ%G�U�� �H������V(�"ۍ�����v��E�Im�z�r��IP��d����=�M���[0��hk���WO��ǀ�ES����2���ƅ��dE[�n~[/���kk ���.���X�"�]Y�"�]Y�"��%myΓ��Վ�Kh:������i?��Ur^��ʐDhq�2<��y��w�	.��v��H=CMq��d�"��x�-Ռ�ϖ����ϖ��A��OVVmr�|�Si"t!ʾˣ?��ߏ�5��4�"ϵ�lY��is0�F��*��	��Je��Y�5K@�8�u�6йl���2A9m-���F�x���	b��o�L��-�z'��_�a�r�'�����&R���u�3��5[����1P�v��wr=#^;�7*�>�n$���� �u%����F�W���l��H�6@v�[��n�Ҝ, 9�c�e�"狟����@�Y�s��l���$� ��ŷkˊ�1۹��[�+���2pEIQ��`R�Q�/ȫ�ة�D4��[v,r�Pm�.A����p�e�!��	���%/�>	bhC4w:�͝Δ��N����y:�B�6/u1`�nY���P�#	���[.�S���<.zL(�y�7�Ֆ�	����U�py�R�Xف(U>�ۆ$��s�ʖ?�cu���D��k뷬N zJ-|'YT(M0�4<�`}s[oY�H�B3b��t ��'���^o���p�i@o���#�N����l�/�7Y�H'㙗_?P�ɯ�P"IA�[~��|ٖ?	c\���2�$��'��D{e��}�%�顫N�p��W��?��v�g���n��;��O�����i�z\ު��z�ƷlZ F ֫�ܲc�\$Av�mI���-�~ "��2���ʎE�� ��ȵ��Q4%��U(J���J1��=��g��n� � *,��m�H�B������c? �MdX�8nR�e�e�F����y�9* 92xqa}��o���UStX9ɹ��E�e��-�~�a��6p���ą���I�i�ǐa���ʴ_cZو�b����?R�о��?�l�a��nY�H��8D���\�;G,y�xFT�,�[61�f���~�Ń�j�e�2�(D���e�"�5E�r�?�j�d�
12�5�Q�2B�B�r�0p�������b�o�Je�ņmuܖ�?��ņ�`���V굁��;?@ɝ��;?�c���ё(w~�[�V�����[� D�K�3��}검�q�zb�v&�-�g�B<��=�r�����#��
p�#�o�
T mt��Qn�Nf��cZ�9Peo��Pm� r�����'���� q_��O��᨟������#�N@WbD�yLBD)����Vo"�ΙXN� �H��u!R왷/R��{e#��K��K"o{"Dޯ��<T�}�O$�+oU$�+��D$������;�T�N�e[#���i�9�˶�4<zq�Rr[G���?z�9�S��x�{��i��@��3*���=n��Gn;�>Lv�=!�&��3/�����[���w&	Ńb?���֜p�3<�	'�bOHq�# Ũ;'��S+�0��d /�,zxqg��E�l�	/���=�E�R���	1��9�LH1G�	)�L �x����O��Mb��|h��'�ʌ�eB������e���y��gA�ɶ��i�^�f�4���?�w0��W�nM����^jA���,�2۝U�T��΂*�`/�2j�O��3e�g�i�A�$�a{��͛؃D?lb��yx��x���M�AgsD�A�$6aI�	;��w�D�M��=HN罠I'�"��&�" 4�����c��$�/���!���6qm��`ɜ	I�l�I W������D��&���
m7
I）P��3�m"�3)��|>�\>�w�2��_�%���Kix���6�A�ɦ(�+i��( ��(�Cb��Z��ݲ��$��
�v:$M�&d��u�����6O>$	.*��InE���O~�����g�Pi�d�����GffK��O�`�P ����Q���,I�$���W�	+�g�b �"]
�L�[�+)e�b�/��M�b�NdY�I�	#��|k��P��O�Z
6 �@e�p���u?Q<)�  9l Pk
6 =�K�i~Nl���u+��� �N	�"�8 �=/~Q�'�2� 4���8���ӆ����
-X�̺Z``�TtA�+� �d�[�N�f���DU� r@��K�;���U�+�2���g�I��G�2���D�
XI|�0�>�������ݭ��)����L[1+	�,!d>2x���(?22�S8o�gJ	%��
6 `�J�D����I[�6@�$�آ뼾� �����,�y�}jГV������	+�NB$���D@O��(  �V���	H{d0�Bl$�b#rJv�QRn.�K��V4y���|�zDEO��ܳ����-���hZT��-���/ml8�X�2۬D(mgH^�a����㇌0+1C[��_�(HFD����_�~B���v ��;=��ڊ;p&#=$^zb�V�i�\m��6p5D0�+��	���A�+��6��O>7l6��k�8C^$ה�=ڲ� \�~�E�e#qZ$���l�dhA(��I<#bz��Q�@CR���B�~*���Vm�};����{�<&�z�����ٵ��$>h+�����|$��T$�~2:��,7�3�/)���H��9_���x�W����-�
��\r"�PW��Ȩ��A@$�f�� �dx\�:��V��J��V� �?�!#�%�g+�� 2���Ѕ,4�2xX�
3X	��9��2Q�A�	��h�����Ds ���r!G�w��~�hc#Gֹ->[v# ͉ш��;�|I�?X�� S��%����IT�eUѼ~(	�Q�g��4@���A�8�&r�� J�|ov,ؚ^��n��\-�CL���__���1���}Q\bb6��7'�{c>��� �� ����I�����	�L�y=lć��E����"�D����o�H��(�]|���K��O�� �]�"-t��6�"�]hXc�,4�˧�"�cmw����o��Z��ut�EJ��і��X��*tU�&!:]�ؤC�E��#��6�m�o�����e�Y�S`�[��R�0q�����P�q]���B
���Џ����@! �H�h�d�Y��޺ `�,hnV<��B�=A��������tT3J���~�u	 �����WQ �]���'�`���g,�Fp��W4&����~�PR<��_�F�L�~�8qج�-qX�n�"���Ֆ���&	*A���[��<�J��������p+0a%-�VT��"�E�e�vJ��Rt�(�!)�1��
`�4��_��lM��p�i�4��fߡH<\�)Rg1�`?�ߜ�[a	d����ʗT
ldY��ed��[�U+� n,PEuV���B��9CȮ��Jg    t݊R S���C�	+y���6Cψ�V��d�Yq�ޘn�C�e���3h��ӓ�m��RR.i�~��:l�jV���2��0t*&Z9da1Y1��.��;-��V|��+y��&OFv��r�ߖq`��z�@��i�������kE����H�On�,�Y�G���_�%S�б���C����? �!����zp�<���z|��2p��-� �PFnA2,sR�hAܳVޏ��z+KM�|���4p���6�C��=}��krw���1��O�n�IDq�1Pr�m.\��@$DV�[yO�@�e�f�>��,ZqsQ�����u��6���+0�O-f�cpp���~1ַ�6�F
+2Ж&��F'����Ǣ���������p�ǀ�!�9-���V_i;��4I���
̀)@��j;�j'�j�Ԝq[ ������G�(����q��FBn�ێ&>�5p��w)�]����\�b ��Q��/xJ��/G�䴠q���K����6���lj����@286�(� ��B���ֶJ�,$���Td8nbdȐ�3�r���̘x1Y���� �+!f�R���;
5 �zF�(���sqj`�b<ʭ��0|z���H�l�QM� �A��gd��W/꓎�j����������G�$�@"���)�H�`U���ʄ�߶#��� F.~�;���~�����&�ێ<R���m���c"5��HM�.�a��b����鎑�(��H�@ƅ������_�'�ڕ�Jt�+K[t��0 s!������{f�v半��O�Ga��9"T#G�
G�:�@3j�|{��L|���j��|O<��SI�xȁv灁�s�%��F�)8������I�p)�q�Σ� ����H�Q(8`���(8`ů��E�>R&�� y���4�'鷏��$��2��>Y:�'N8Nq}�O��'�ގ��I��g��K$�O�G�����ΛъΛ1�NhWn� �?#	޼&���*Ϗt���r[�8��'�;@���/�Ȩr��GN�� �w����+�Hg�BjJ�����@�TTr�-s�����q��#' s&*9VR%�'���4���� \O"�ۑD���6`�'��U.J9>Ui���a��0���C:3�%z9�r.u9�d���$��]���<�	 PMTs�v p�$����ퟤ".9<Ӵ�����5@�~F���qy�SS]�̣6<��:r�_q'?r�HBy�$���+IE�<�Wҍ��X�����_f�f�&�u�nH����=��شw^����q^(ņ��B)�,�B)�
y^����c��'_���C_�t������n���D�?/L�H���='rhO�CN�S����96!���������</���s	ku䀵�ݛX+>�G:l�����!~�\��P�UV�RRY#(�������WDU�M��\rRb
�~��y��d��C&�T�<�@}Rӹ�0�3����I�P :�z#�H�lV8����u[Βz�{o���O�>2|QN|����I�a���?r�7�K��B�ޓ��E9�ݢ���&ʑ��%��%� r��=��;���k!�r�P�YD5(��V�`
��u\	:�ڀj�Z��T��|�s`J�S��^�S���;$[�����i�ǎ���jeDR��X���޸�c �7��h&�F��*�'�#|Ҥ��c���S��&.+��9J���<t�0p�����(u>)M4\��21��'��HH~� M���In�8t0`����|/G�w�y��*�${R� ��+�G���3A
1WeG*� �D[qD?28�Z����Ou,�逅:�
��NY��d>�<`�.�V�vu�J���X)a5g�Iv0?d���|�t,F���!�S[7p0`d�h�%��<@'-�ʻ��<�Q�l?̮hI�I�a@�b�v���W�����j�1O;Ođ������g/?w���J��N"~���~���.^N�$^q�6�������C�rr�D8�ϑ�;��E<֗�;�Z����K���A��W0�,��h2����F��Q� J�o����j�uD�v�&rx�� ��~� O��vnA������6[n�$�Q��]'�%b�qo�7%��4M��#�ur�<�� �P�ae����+�W}�ܨ��_+��G��+���W������L�C}�9��C��2��*��_�#or �h�ҿ]��W�����xC���\�W܍����Fۭ�ȥ�%T[8c��1�bL��;�8~{�	w�d�cׯQ:�%�O���y�L���3!��עߠvl�=�d2n�2P��΄U�&!9b�L�6;ݿI�t�r-'G�k��󄂜��L(���`�E�B�)��:Suf�m�g�B�?LX���B7��Lx(���hF�_��K���/.y�t��9`\sd(DN��q3���0���0���L�[��cr���'B���q��޶?Of��O�Z�� 5-_q�/_qR��y�\M����#�pR����ej3��ej#U�; �����ڶ���Q��1t�W�~u2��I�ee�P�6Hŗ��C���m|�R00����5��me�A�D	����SedV�ǀj�1H{�5䩁ނ�- ��[8���# V�j��[�+/sJ����c@�)	��S8�%�`gR�2p�$ط�c���tvJ���������.@�.�p���%!l�?�
 ���voI�0�L];>�G^�d���� �~hz�+�����c��*�n<����Co�!)e�6��u�i�6���m��s#�y$FY�$�q���|�-���*��U�Ld�|2|��s�G�⤇q�1`��2�[�iQl�|�:��v�)82���`pd���F�Li/�]d��)�W�e�g����@�sk���P��=�����>5�����Z^�;��y��D��C�-�|7��r���g9)o�>�\�'�l;d��7%Os�)�h���ʾ�`�fN�����1����BW~�R��xr���}d��q�>��Zt�[���w������3s#�g�Ȳ`rŇ��Т�'�VY� �&z{�xdb��a>�7߹K���p�Job��EGF2r� ��L k@d�d�)'sR�Њ��k\��c@51w��Yv�r17H�"�'�E�HSse^'�'�[�'����1��6�����-���yx�`��%S8T� �W�'��W� fI��?��r:�q�>r:�q����df�y�d�^ؙ���n�q�A��iC�/z�gR��Ʉ����|-�a��I��r�a��h &�GY�H4#���p�4�PJ��������{�w7�f�)r�}	Gݤ��֜�4#rx�ys��S����×�٣Hc����8>�G�����=��1h��'�F-*�������GF���m0��I�ڸ����	�� <�/���UV��}�8��E�{'�����!� ߋ�/f��ٿY����?2� �>���%��4�f��Y,2� n���ߜS䀽s)��M���'8��l���}�����G<����0�B���G<��a_Ə=��|�{�m�]��3�5 ��k�x�����F}�#Jx7ȉq���}��;��G���7a�mW���vd� !����[/�<�]Omk�2bѓ_5�.\�\"b�Rz�J��6�D{��#��&#���{���q��]�ȸB	��W��7�r�&yD�)`�)sI
�Q�S�\��[�n�r�N�����Oz'����4�%3%iC���#��Y��� �5��5;��@�
�􈴵���W(k�N��#_i�>��W��/Ֆs�n?�'�́\F2B�?�> �G�<�+M.�����@?�O�p��3;9��y�]�D.�nC���d�1V�X�?��h��ҌZV2��e�y'M��9r�&��[P߱�Jb���9�
?���
?�k���%��%j#*09D��3���<&�����ٙ��𦍼<�E����;��Gͤ	�5�żK]d1s�G    3��lfB��$�G�� |ev { ��'@%�Yr��c�k���G̀-�y����9:�e�LT��?�ޏ�_�h%���R� \O}U�yĹ��谓��Ȳ��_}d? �[���� �6Դ��I ����,�����"�g�)PH.+�����H+�s���"��~���t��~��E�����G�qb�]m��	���H����t>�ʲ��|�{e��#m8�Iҗ���ܜw�K�9�_��#Og��9V r� ��z��3� h]��s��L�>/G���Gn�;Y����wrAy5�d�>�jv�P�Ӻ|���v#+�}R�jo0�@���W�H�N��I����MI.U?ri&�����Ζ$>�G�����C��/�.@��»�4�7&-���Vee']8�6#ZYq<rS�hE:
�h����he�Ò��NV�#�bt��2�E(Z���w��y@9(���}䞼��|��(z�X��׏��A�A������I�@qǽ��H��s���K�#�Ղ�$�3�3#.��L����%�@� ��{'�oI����l��.)�	g�c���%���.�1	a[^I�M��[/�t@Z�Ne;qTI��e��xo�K�4� �����=.��Pm���E\R4ˎ���n�Xv��lx��� �]I{�w�1h<���oR��x'Wpɑx�otgɗ���/^�o��NL��1@�϶sGɗx����!��+pɝ؅�9e��9X�%���%bb�݆��?!�B�[����5b������̘���Zr+Ӆ�'��%����%���}L�{C[RO�x��4�.IM����.y�I�O�ZK��;^�%�c�K%s�e���ʒ���q:Ҟ��0?"�$�-)����33 oC�t� V"o-������4�J�,[rA&H�@]u%�;tQ���5&B:w�����J����e%d�G/��H�Jtu��xT�>��`���w��J���'ު�d�[e�a)˹K򹋺ʻ���2QnB��.ySR#�ÒZz�O��P&����1P�R��jm���%��"ik�F��~��/D���Di�(�0x�Jq��gQR��X�#8Lo���׊��ߒ`��mc��_R�lI?�7)/h C�r�4A_� "l�S��f���]�}N8@4�m%�A�YL�Ll%i@�ѵ�K>҄oݲ2D|Q]�o��%MdC����CQ];^��(��Pr�����!Z%e3a~���2p�6`:Dyqs`�b�$w+�Ix��Sz�R��<�w�J:k��pm�oM�)��� iV�>Ds�(i�w.E/yEn�b:Ҵiy��zg�钣��M�I�V��$l+�E�_¶�ޖX4}�R�h�� �q�*K��Uvʀ�=m@��д�.)�J�;%�,��̀�'��]�Mf�Az����օ���u�k)#�N&���4�q����>Qr�6Hob;mH�Xl��o%�iG�I����A�~#F��ۀu+�i�$�\�wÕ\�	��#�i�����;Y�J^�;��J�h"�^J�@"(��m��B{V���Y�Z/���m���W�Z/��ݿ���u�^�Ϫ�za>�����:�z!��<��&����c�`2���%�����c��w�nQ��v ��йZ0�g���1������\����%l��N%l"����6B�qɨ����K~�`72��$L~��T�8>�Ü�&1�D��>�(yex��+�$�U�'��&�Zm^�M��k@�k��5���,����<�	pr3ǀ	Y�É�Jnڀ���S�tM�~RM�l���@����="�F�|l{��1�\�QCn����)r���q	����7���;@D����&@����hbBN ϔ�D�BD�X�����F�	Ah���K��%*��siɉ���7ྷ?�<����0x����c�����9\���a�����������e�����+71� �d�a��o*yd�-�#�P��C�d��_�D?����퀍!�!�M��}b*+�g��e@��:��]v��~�	Jf�5�Wl��7Vyg\�~'a�%�l ���ބ��Ң��ߜ2��7?�r�vȂ�%�{}_T�q��D�V��.�K|��.d�Б��=y��ދ%�n��&6�E�%nBh:�f� MĤ鼍Iӝ�
�4����pɅ��Xr�>����M�H�棒7�~FB�L+n�\r<)⮷o�m�C�7_���O�.yy�����Z����_�ʒ�
����b�60��#HŃ>��>E��0p�བ��	�`�g���!}�R:m�����Df�	�qYv�)>��;���dJ�g㛡��N��k��kv@j��� ֏��׀�z dӵyJ��T���~�̩+�l��]B��3��)P�?�l��~]Y�O�J(��#��z�OJ��KʀWt�&nw���L�%_r ����M%Gr"*��W�AVj"�wnr,?�λdQ��6�t˱��b�W9��Ha�St1\o�D"8Gj���$yT���'9*�����@"�؅KY�^�J�N� M��F>M�rd�'S�C	4x�S+�����~r�o���X]ƿ�_�c�%&3=q�gQ�E�?�D��t8W�/�mf`V�}Q�orZ��zR�e#�T�aΜ����cR/CiN�Y)9������%m��ęse�ęseR7R?���������H1��1���e��#*A�=�z/��d�׀��0�.TM{��R��DM<����3�R���6�1Qf}�\�O��%��{�K	�N�~���Ȫ_n�-&�u�=�,gͯD�K��Y&�U)���u�%g���|K��̦�2���R�Ct�>Y4��-_�Q2o�L�Í]%�'@%�����ߓ�Q%wv�Kv����yɣ7w�j�ю�;O>��U6�.jL�ߠ��DKFғ�S%#)�����v�mP������cm���m��:��-�y&�}h�� +����D�Av
� A�6���1`��c�-Ww��ib���M F�dh��Tj��'�艉���~~&��;�fD��[���npkJ�������J����O2J�Z8����Ĺ)�JUN�>��{����z��XiKf�[l���{K1�Zy1���P��e��򸒣;�1bn�+9��o��#����<�9y/i�,�vJ� �R4W���s��<�4/�+���<�O������j;%� !Dr����T�U�R~퀻��s����s:�����Fe4�d�͋��J�b���w���f'(Yw�)|��jV�'��%t�[(Q�.S�@?��-y�ܚ������pM�ݢ�� J�V���/%�1S�O�k͐��$d�d	v�h3��� ���O"CK��'�����wL�R�S�q�ߢ��1�3�U�ʹ�$L��\~��U�^ �����1Wr.?}�)j�ϕ<��լ�H|�fUFb<����`F�Bx���-a~�U���\��L�'�\���
��e�8b���l.9���TQrQ0�\[QrQ?��	K.� }{rQ��h�c ��Ǫ�q���t�
�M7P)�	%��&z���j���oBm��;YYm��y2a{x-���S:�-H��n�OV�V?Y8�b�����p���ߧI�������4W�(���������2�y���D�3Oq�I6֛�K�+��������ľ;eSz~r6���bo���:��1$癍&a���!��؀W�%D6�2r�(<?s&ڸ���8į+���dˊ��.�Q�[|�"�:}���� 3��w�!uH빾����C �OM�Ovχd��X���B�1�u�m��N,�٨����9SS��p���pp+�ީ�L��N������puYTk����_؃��θp�߿q�"����{�!^�eN�tUm�n6Z8R!%ڮ�\G���9?�A��'����a�Õ�I�_r�e��^�g�pjҔ�XW���: ��P��K;D{8釂�C�X��I�&�C�y�{�ɲ����uX���:P��z���j�����ގ�Kz;u�E,���    �c���ͯ��ܾI2��o�E�
�#h�-F����$�7�>0ܽ��i��8.&���r��:��Dx��h��פ3������B� ���4��͠�6}�ߠŊ��EJ�����!V|����>����W�Q��k77j����񋞔>C,�D�O�,ĥ���XQVYޞj<ф���t>m��7퀱׺��Z��(�P�)�f݌C! `"�g�DJO����}�K��z_@�,�?D����W+����B���P}�V�W�͏�B n��#����x��_�rC��k���?f^W���q�<�~�d6D��=�K��u�5r�P"~|�\r��Dr�9���p���Đ�������+E`Gf2F0g�c�%�%�F���  �D)�w'z|�Z�p�z��� ��G���]$���r)��P�$ m�$߸T(^ +�mS4��w��Ho~12P�8��Gu�6�>��2��,���-ё��A��i�Q
�'=� ���NK�A]����;m F�#�;&��Șt�;:Aa5x\m0\qc"��jD��	+�"%&��T��ԏ�%�1`b�1�\=�{����f�7�0��}��R_ �F\�#�$K�SŗBꚣ� �S�tܩ9h������J�	�����ZEZ�����HuVܼ����R��އ�7��q��V[A �k�)T�()`��\
R ���J8�̵�����M����EZ��>E&��r�䚇�T_,'�Xd��V��kQא�FXS)y�㫖P��1��-t�/��NM�qsW��sK�"# U���<Ja �'r��Jĉcx���`.�(9V.�(9�8q\%���@n2�Q�u���#�%��y������WRdfD�� ���cf��X)��k��W �aZ�o�����`��Z�c�[�f0��j�[<ȱ� J���c\s:~�9y��5^ɋ{4r��FNz�{�k֒+[��"����;�Ne�|"�񽇧�6�������w@�:�A^�"��� =V��_9}Ub0�{A�Ͼ�m�#�\�`��O�V����Ku%"�s���H��V͑�#�T`���R�.K ޥ�p�wJ)��q{1�	Gtf�{9N�W48�V�{9��
� ��݊�����k�<�0����-���@��5��KS�:?t 3�~ �"CL��5��i�����;?0���?0ٗ���٧�?0���������Lf��&�O"L��>�9���9j�I�3�*�x��&+�L�-!�c2W�xl~n���5M�Ǧ7���
���@/�I�#��Vl���'��Z����V|��Ԕ�!k�k��m��O��M�<�B&{V0O"KF�>��zR����n���m���+n����ۦC��A�[�.3:�*��oF*���%m�,���Et�i�<�Y[� ]m����e��8~���fw��6�����I4�L�A���a���W!��y�5��kJ��!����d�����_,���&�N�|[AR���Xn�,�B�|�\��w'�K@p+(7 ��n�,�r��8������
��RT���93
���z��2p�ce���6�c��p5�Wa5�1G����)���פ���_��f�?iEj�^��q��&���_��'�}���>}mX+Vjj;8}ym+V�!��%��%���I��[� �5*��V�F��ܑ��Z��p�V�F%ܺ�a�Q�1�����1�$�H��RdL0��������L��]?0�� aR���IO���"�����KO�.uLf?Pi��F���~ �:D���~ ���qj��j�����"�1�X�#<,�#,�y���=���B;3+
]6$��6 X����D��J$+j�ˀ�@W�.�Ђ�к��s9m{+��b�ms �u�?׺Om�'V�1��rI+��rkP+��*%z]�d�D�ˁ�M��UY�"�U�u)�\viEy ��1@<�'@�Y�:_J_����6��#nM�A5�ko�VT�~��rUP+��r;P+������&5 �̵<�����Ghi����/:*�\��
��6*�������R���Gʽ�e/���j���N�#04
m�u��8 �=�q`0t�ا���@G�Z$��	L7'��-0-��n5;;̩8�JiKAgs!-���(-=�������^.:���w�D~{g�"�}��7��vh�\E;�������o�bފ���G5����
Z>�`�J�Ζ�G�i�Z� �m��[�1����@D�m_�׊���GOZ.���d�D2�հQ)�,u.j�ل����	W������Ϋ[���!��Z Z[��ն�.$ <��Q�������x�lD�+��f�V|vC��(�;���҂KX���:�t���A�'���5H���	���͔�/��Q?<���;$�P�p�&��"Ƥ�WKz{趴���I]� ߃8����7�Iμ]�R/9�!��"Z��M���2�3���y�24N��i���r�I�d(���z|k"JFM����e���8v0���|���h�r�< I�d4-�m���4'o��m ���hP1�Ԭ1�	 �?�Al������.y�zpB�&Hq�h��U�=��9Wsߊ��\����:'R�/eV�BF�y�Њ����3/�5��])9.� hs�b9l8�xŇ�3���\O�Fo(�2�ˡl�h��}���3�oA�\�4���z�]���r`�*�rMHK���I��u W[^�8���N���m�� ���j�e��0!�����ҙ�H����K�u�-M�mK����*E� ���1D��ys2{ܧ������m �iH�0��$�.7�<s"�<qޔ��}��Qc�i��Qq�kw`�+�]}��Z��J�lk���9�a��*<&��1�� )jD�B��Dm�� ��B
���8��]$-X�ʒ�ƫreIK��e���a���1��je6�u �+���I���#��8��T\��41
����E�	|Z��Jf��P���x~n��c 	�5èg���|x�yR����5�(�ʪݖB�@��U�R��N�W9MK�eK�G�4;�\a����
�ψ	k����Q�@��α��h�*[CM:dH�d���,	_��h�QNx2���>#MH2��	I��<�5Ò��v��c\>�O��Ꞑ�7S`Ox�*�F��]R��Yf�4��y�ĖZ����!]PO�1[]40�bb$��=�'i�jO����)�55V[N{B��U�'$��"k�(�ƷX2�|�,�����'i�kO82?����u G��5�Ƭ:h��a@��ULh2gTn��6=��( &YVAN8��'4�Ą#���6i�*��	Mv����[ɫ����Q��QQq����܍ʥ:�Ò7J�'<�m;��r������S<��o�����-��58���U7����v_��8�_;f���h�m4!��h��Q���OX� ��4
Eu`.�VG���tZ� D����[��XPu6;
�0�d�(PQ�f���H:�&������ )�OJ"�x��qTS��o�)���W�����
� 0!��v�����ܕӊ�\rӊ��)�����]���k�����2��K����g�ɦ�pI����<�mӠ(��q��`P��ζMY)�D�]��];��in�%:������	��쟸��'?t`G\1eGq/5q�?[$����H�����D4�٩(�� �[4��P�
�0��4�Me��i]t p����+��G�ED	��^Ńؐ�*S����5`u�a�+9rM-l� 1#9k��Ō혵�F��ڦ�5�bG���.4 Z���9Q��v���VxL�)�|�ǘF����w���UY��Β���:��o/�p�̹�ÜRt�/?oѱ��}�	�h�2����5��5&�Lo�і��p�Y�@oaC�v��1fװ!Ɯe7��S�z�1��7��K/zË�f    �^�A-l2�4����zC�1�o�1��/f����X�7�X^�d�lB�N��\R���ТݼzC��Zlh1�/O�Fscyg����[���71�8��;��/�W������y���oB��P�R��ۿj��C�Q �zn'�/��N����S������~�r3���(;s Qڕ�7D�Y6e�����f� ��8y[ /DE$q(�#q(���M��2����(��z�6�(���(�l-M5^t,}�3�X���O>��/�4��C�C��HW�3_)����p�F)�{S"���\b��d=���m�"�8e����$1�H��� k��&!t�
[�$!j�� \M<YJ�(�� �\R��j��ǀN	����@+�G@�v�`I������"K���[��Hr]y+������uV-u�Kܗ�Vpj�c�#L�5~���vT�_!+�@��uJ���	V����^�+��|���'�1�pM�����NJ$�S)�"���"] ��E�)��)V�.:~l|�(��J�/�nE�tn�jE���������B] �>$��B] 4�t�ߵۊt��X�3� :��@��gڀ%u<��&"x�*�ŀj# or"E�s.�oᾘ�跜y��Sy�n�B f�b����k�`���%� Qe2`,�2�������>T�.x4��6`��3�Q�����W�%����À� �o�����O������F�ǭ�����R~��i3�Fg����+�Q��6K84ʹ�F9w�P�i��N�]8����6�@��@ht�ÇF�r�јOQ�V�%4��
��Fw`R'���:�D�t��L�2^�t��d�;�������te�@�;�+D�m��H����{ifT�]xA��m)xtw�nSA��u)�t��P0iv�����I|�.�4��H�",�4*��Hc*X4��Ew�sFkW0��A6W��
����=Z��,�]�f|d
ތr�����
޴�i�iW�.H�_�'���E��Q��?ӂ7�[/x3���7�W߅a"t]P������;����<֤��ͭ�{ƍ�`�o�[��}A��)�=��W��gv�u�7(�?�F�i~��t���~����.H3{�4g�.H���iF�W�ft|i֗������x������S�ę�wA��n��>��O�3�8��+X3��k��_Pf�kv�
����8�Pgg�A�����],�3;��8�qv����� ����t�\�-d��٠���5�7S���82~� �8���� �X�R:W�yF��$p��a�aE�O�P���Vp��z�$��ۘ1�1@
���<�-])jC�R�*�8U��ԣ ��t%)��\s����%�@B�}������1�g���Ya2 ��)�+���x
H��o��ă�`h�#c���0�;�P��L�����N(L�����K��M����i����%)�c�?�*�$8l�;�q�.�uluK}؉�ki��!���"e:qs-�a'n�(c/ͷh3qs-�!�')|�i�"|�0)�`|Q(z��W��:�E�8�uv+J�R׊�0!��&Bd}�6���1@����B;[H��!B�r-7��"�}2_��ޟ`�.�|�
�����_��pkE�t��Z��N�_K�fpkc�)Q�5R�L'���U��xl�� ���d��0�S3 �$�ܟmp�z�$���>H���A:/d�g��Zj��$K����
�\���[�@�.M�K�7b�7.i�u�[�!\�^q&�L�IY�R� ����K��6�l.�N��n�ӷ���;���n�<��zT@daN��ѯ����9L�@�}�o��m�q\2D*�T���¥}�{�Ǔ 5��_;!�b?.4���П<ÿiB;ȭ���c�T�����(#�*�V�&ѥ�k�^Ū�?pB�Ƚ��_��� "��B�}�������\��@�;b�aM��kd�Ĵ�kk�?$��-��oVh��cķ"\��(7�&�!q.�+"�D�q�^��E2G�˦�`L���l��#��1t�a�Em����
�gG���Ʌ8w��/e��<������]'���2JKH��s�ܧ�X�iA�����z����ι�X�k)�F)�0�sq�M��҅�8��y�j�7�a乓w�Qʖ��|v��Wr�~���R�Sv+�����J�{W��k�*v�N��y��l��c�)A'tW���2�sm�����^�!�<3��k��bRi֭����6r��4w���R�4�-����z��[p�	A�W��-ZFih�,A�@�KB��ٹ�;A�H$}��
J����X P�J��iV4��ːg޲m�<P�\����Bzfbzf*�y�V�C��=0�3HM�q@Tw\0�oO:A.C����� �|mM��0�4��
7<г:B�i�������kކ�ȕ��^L�x��G�,��^a��^�[��7����sM��$�Lw���U�wQ�;gд�PB��[���]����2Xz�	���y:F���wyC��.h(z�D(z?�]z����,<����X��$�oz���}m����<����_�x`�}�-4����@���	�<7�Rq�;�@ӻK��m���}�4��[��ϝ?(�9!	���i��e�a@�6���s�)�|B���+���|�} �s�B>�.!�sW�l���A�uG!�]r})F���#W��ȕ�0r�7煑�����q�ی��y��F��2����W~�_��2/|\�d_���BǕU�BǕU�BǕ��B��x$�@�z�&����d��B�6�!M>�.�,�.�K���IL��2J3;(���s���ゎ��y}!��O�w>�>��@��q������ ����煏{ݚ���Cƽom�V �{�ya��&�Ǜ&�;ub���&H�K=��F�K w/���RFy��\S,�h��ϸ�5r���������Q��F�o���se�ޑ�N��e*6��$��]l�	�Ior{���0ٳKUJ+����m�	;�`���l�i�c�G=�1K�!��6��������6�E������7�c��'[|�h�� �}�,$�Q�F���(Ĺ�E�2��Q��[폑[m��ӯ��i��d���k��5uB�a=�1B����A�P��s+������웟���\v���t���=�T�؏>�T~)ӥ3�}�S�@�>9�n!݁>HT#�� P߲6����̃v�ӑ΄ ?-��#Ġ�M��[@�w�D�s�I�{rR�� D��u޳��^�<B��{��+�@�sZF�=�m����9�N�h��!�T�ۿ���G-�M�!�4��fЕ��w�`�y����W^x��t<;���윦����~|@���3��{�P�=����B�@�|M$��.2�v���m�O�6 ܙ_����̀ogv���w��ۙ-Հogߚ;�m��YFi�S�߮�p������]��A������|�.����v��߮�N$�ʯՀr��,�{�UʽǦ�}�4�A�+�,�Xd�`�����uHw�
�P�r��J�r��;8w��K)p�]�ݺv& OI�/�h#�B����&4��fB�dlI�%Ԅ���'\�������	W��P4��I���^����w>�	U��ӄ�w>#R�]�l�� Q�bIt2�>��Py�p���yB���D� 2{���ȭ�����o�ba<s���Y�d��';�	K�Cф�O���>w2`��;�O��d�N������qwB��x�Lh���(�)&4}�� T�aB�'��	M�!����l��u�L]wޡ�Z�	OW~�&<]��	K��h0��{���te�6��zo��t�7KWx�Kmf�ن��	��{�]zP�=UM(�b
�L�??׏�']��']��	EW����?��E���^ �{�u�Ʌ��k�ʲ%�U�w�b�l!����utC��e�'��@����K�� �v�����^�4W���|��3�,�    %?���1�`i��^P��ݾ/�s��?�������΋���^J�i�C�{�������i	��:�����z;�y�_� �g� ux�5�U�<%Ħذ��/�.stG��ZIgP�s�c��z;Á�ZZg�&�+���:��.2��k��=��w|�sR���4�PX��3?�����р�v3"0 �s����Zk��-�(��'lio{��m�
C�X@w4��Q�A_F���w~�ő�Qq��M�T�9��(y�a��/n�,�pg��~�x����Yz�F}C�&�0ˮx"D�ч��a���d>��k	�����h�(��߆��k>#�������y�cT������u,�����O���v�:�{�hξD:+�q�E�mk���]Q� M-\�ΪCD��ј���*��J��o�(#�=�����;��ۥ�Q��c��3�#z�.���9J�G>ĳ\����&o
��f��_�| `'2��;7�`_g#��ld�}�	�AA�'�}�b�龜�������66��5�����l����שI���_`\��u����{{�&J�"���u�Q���q��:�(��֫\ [����{6z�h�v��cjy��7
|[����N
|[���-��
�[z;�[_�\��z}�&⍁sK���:G(P�'�-�|�2J�oK�_������-���-�l[��9Gm����c��Ǆ�:�(Э3��u^\�<���GLW��#�+p��מ?���j����n���Ro8&��U��?���^�0�K,�u��������ߺ�R������+^�\w�G���w��X�*�Ѷ�.P����|�OУm��!Hۮ�@��o���@���� Y��w��"�L ��!��]���s����Ч�N���$A�-:�Dm���ݢs��v�ΡR���C����A�6����=D|�`�6����߇^m{>k���r����@���@��=��5}qU�sk<µ��bP���jn���]ۭ��k�W��vm{��0��P��V�����k��L��Yj����u�����@�VK]$���u���IDl�gV�l���l��?�g������I
�l���f���h9[��A�6��
r�Z�.г���Uh�j�Q@�V�R i�CD�%�=�z�3���9tm"���BD
e[9������@�V��u������<5H�*~E��Ӿ�P s+g)й����y	dn�:�r^�[��44n���g�(�����ދ��������n�9lP���A�6Hg�A�����Dڳ�{QO��q;95��=��I�T	���D9H���h�*�9B� �{�do���r����,�'V����`��9������9~G�%B(� nz$�v�aT*�UL������5H��U~��yDp�L	�z��]"�m��<W*�z4z\=�mc�s*���9dp��:�r!\93ⲧ�)\=n�[~t1�`�j��|8���I�p�˰ �+gQ�Õ�(���yqP��@�	�k4�����ˉ��gs�z�x.0�'�]�So�I��!�� ��Wmb����x�6��,�r���Rf-2�3_V:�K��KDW��f��A1WΈ �+�T�f���Rޡ끔��#ds����s~;}�M�K��]��n���F�v�x�k�\9��p��7�ʹ��Lv���^8����s��	�rM
��_� *��6h���� �+gPP��v :�r�B�*��P�՟�
j�*;	�\nw�eO=�����sh�]�\v)���$u�4u��~BTW*4��ͣa�蹶�����V���ggk�ו��A_�^�=��4vU��l�߾E�{G��]9�֮<ab�r�j��4������+OQ�ڮ\��ܮΟV�vA�;.�
s�/�D<-h����UM�)�@{W�
�]�H0�Q��]�O0�uS_�&���W����B/4x�^`g������
���A�7� "����A�W�Ӡī��)��������+'u��8(��i�xu��4y�
Dy�
Ty�ym��ս�Q흛�;��]_�.�<�¼�}�n��Z�	i��Y=h���a.�@�WN!�+�k�R���A�7�ǁ�۴ ���[|� l'P�q�[�M�K��]Ё`o23]���6\|�z�!�+�h�앓9h���� �Ӈ�m��g-!x\��t�\4�v�K��>�W���P��P���τ��K�m"�YD�����4�����A-�[�%$��v�x��{\��%�E
��W	񴇈O�.��ZM����W��<I�="��ļ�=��Z�:�鼗����w�.!?����B��$J���|Xۘ-}H�x*�|'49
r��z��"�|��|'��5H���<h��ln?�CG�$�So�og�����e���F�Q�}GYX@�w�粀��Hg�qQf��h.��%OYߠy�Y���Wa�Q�) �;���D@ۇ?p���
��¾�e����U�%�ic�N��n&�N��/��\Dl�]�Q�*��;��Π1H3���m���P	�9�}G�N@�w;W?Jl¾�9na�y|#̹:�y�h��
���&B#���5�!�i��iױ�߽����h�\@է��J"�cx��n1������Md'/���^>�[��>�?��~�5������˯�x��ך���3̬�Q@է��:Dt���Z�YS�����.3?K3�!�f%3)����|��s4Fl�`������l�'���������|g�u����7�y�!�����|G�����o�\��f�p5���<�����f�6�Y3�J�S��Y�I@�w���|��3 �r� 9�rV�'��;��t|�������)��߼��~�f���0�(���أ �w	��s�.A�w�|}3���!Ҟc�R����hIŁc�y}�!�/�h��2����(k	H��Cʧ�����^"5K�������|�H@ϧ���6j"
Z��H��
 5ߑ�&��;�/_�+����61�Q>�i݇AW�ւ��͛��Eĝ��W�9�o1��1/
f�Z�a��	fV*P��k��	��εoA���1_�Ĭ�  �;*.�|GŢ���=Zn{���h��9�r��hY����o-�o
��G����{@�w�����g�9�=/o�,�@�w�߳Ҹ�-i�~�����.�j��W�"��읡���=��7m��J
P�]k����r� �F$n��o�s^!��l!�B��f S�"z�t��6��{�tnѓ��Z�dИ~͆�o�U��o��+"�j����P��pCj�R�}7ܬ����� ��7�a�_�~��޿?�`���8�a��a_��	��N }�u���+QJ@�w��?�:�"
���C@�7>���f�9��h�J%���m��ך���oFry�H!���4����D>RG
��ۻ^m�M�s�IB�wU	H���!�ߌ$���40��4��^�C���o��}�=u���C��@�wU7	(��*��l���ȍ`(X+�j"�<��g�vܛD��P0��m_Mh���d�����B4��|�EbS(���(���2%�}���
����<�~�7���@�7C�|����y �|�}{���v͠�U�ů�>�X5����r%�AE���7op��.~݂Aů�,�Xs�r�A���8��&v� -�V�t��L���@@�wݽ���J���y�l��{	I�u��>��2h�~r�]!���?�m������'8���+��I�x������H������9M�1?�8��8������u��q�����p�_5&���pB�w����j�; �	(��ƾ
?������B�w�]��Ok���W���^����{�P�i��S�E(����/�}Z�e�C�+�^�����(�}W
�    ���^���(�}�j�G@�w%��;��}K��cO�{����~gڄ4�����:}�%Ҷ1��p�7?)���B�w���������O˼*!�
��>�o�}��v��J�P�]�5�}�=YH�n�{ý��!^�Op�!�^�C���B���Bק�_&�X���?�`&������5`��iM�A0�C�]_�?
]_�?
]_/�~]m�])pA���B���$��W#�t"��y�h�E~kOiϱ(��!^�>3�����n����nk8��k����6;��kw���kws���6��RB(�ڝ`(����$v��^� �k�t�8�O���u�i���7L:��!�e��5.I_� $}ͥ� �^H��Ϡ2T}��;Y_k�O@�ך����ǟ��k�?C���OC������ݟ�������v���Vg�{ÞǛ�����z�M@�7�{&�Qk����?�D��h�Z:t}������p{����x���v�0tk�O@����B�������Ǟ�nɼھ֤����5A' �kM�	(��8ό$�%=��^{l���D��l���l�ݱ�l�߯��^���k|/�%�e���o���{�b���#������t{�^!t{�n�5�s"��j�l"[
~��A�ך��R+ Kh��	��_�'P���=��ߖ`a}�* �k��	���#�������~\�����	9Ş�1�
��6D{X��	
���!���7
�1k��ڣ����=��%C(��#�P��j�z �r�{D��.;�1j���^A�F���ӂH�^"��l(�#ؐ��^��
.������ʷ<-T{�2�^k�L@��e�m!=0���C�P�u)�B���G��k}�)����Q�^{����H!����A��҆p��(½��u"��j��c�D�^;o�vO�,J�z�tܫm>-��؅`�O�P�s�Z�q���8�{S�� ⣌�>��ᙖj�
�����^;ŀx�[�i���Jj����6��ZR��~������e���~W{��=-��Ӗ�x�`��.��U_�0 �kfC���<T@�7��T��m���خ=7��YD:��1��=P���!�k}*(Zj�muۭ����VP����}�h ���d�t����Wm"�� k�&�>-�4(�xQ��f��}Z�i��E��n7TP��m_�{)��G�!��O���	57ˣ�����w�l }���_֙����~�e.}h76&L-͡	Jd�'xhd���׏��M7�S_�R��O��(��>����#kڦgVk	�R�BGS��<�O��@���+�J��T!� ԩh���+���J]H�$0�,)�X� @�@��_����M3f���|�0���1���`i����M3j� @�5����i��[I��|*i���[P'/A��*,b>>>���'� �ϯ�Ԫ��f��������i�C�Z��Am���;�����o��?%	N\_�G��V@\=n-�5�y�Oa���S��Dr|ٚ7�Oi��W����yz�0a|-�R������4����`�~�x����Y���� ��W�Mr�6?�Z�ܹh۟W����$Φ^�:N{^��8�y�PQU�4 }�����r2�)��f��#��
���/I/������k���z�Ǟ�b�'ǘ�rm�sz�'*�ޥ	N�]��ĩ��5�"��)*p��z��vu-��2B��]G�����A��_�
i^�(��k��](����"�;�+���"W���b:X$y)ԃ�B��qH���I�U��38��u�y^��8�y}*+y�3�y����!�;m�tȵխ9������ީ�!�o�XR���ɌZUk�t��ť��!�{��!�o�������� -!�{:gj1��� /D�w�x��N�8'PKm<�:�
���|����>��$omzpB�r�wH�e���=!���2|�>�v�[dxgp����K����!��7|z������O��ޥ�N�[�r��)r��E��~��mAKnwx���$�{�g�-�v���\��] :duOQ:d���p���$�ڊ8$�c�؝�q�@FJw�Ϗ��!��@�q�$�{���-��0߶�Qv[����>����!���tH���pR�$�qH���tH��q�җ���]3:�}�8�j��t���y��]&�pt��.���4���>��δJq����[-I���!��tH�N�89i9�;$}�{:$}זI�y�!�{"�!�{&�%绸��DKR����/��d}W�.)ߙ�%����%��i�����%��7JqI��ju���I]��q��RG�%�{���`��}\88O&��8<���+�������j&� rg�}�����.X��q�Z��߂�a��r�#��{���܂�ֳͥ��m�Ó���)Dc. /�lA����;C<������E*L� 䍀�C�.�������@W`�b�aj��V�;������%-�jװ�yn�;��w��N�����n����4�mAڵ��NՂl׵�3�-��f^�ʏ�A��\�����ޟɨ�c��@F	NԈ?Ifj�����.�?�Dq�E��׿��H������u&�S���C���s�ӂ���0{� �{SP�qi��1�P��0����.F�ͺ� ��������E��$����� eB@8SbY�7î�,�GP'�]v_� �\�%�
o}SP�
�X�C�_C5�^[��|�
��]_�
&Oނ�/���<�����M���ׄ6q ��VƁW=�fpa���5���x��V1V3��ь�G���Z���3��׌��5��O �H�Kޚ�������18yc�4^?ƁW�Ҍ��Ώ�v�am��3��v)����L3�?��q`�18�k�}�8�A`�ճ���,Ji�u�  }4#����`�1��5�����5����\�k��m2H+�`5J3l��!�u�f�"/���5C@�c�籔�ۚ!�Y]3�ϟ���5c��<��,Ca�,>�{4#@�G����4�e����Ҍ e�2��e��UH)��J�N�R_3��׌ �0��RxJ KI�� �6��	����ǪQ�>،Ǐ�Q��,�f ���f @u0=(ǪL8=l���,��Ce,pr��~��0���f,��\�Ns1��4�d#$�O(��WxN���@E�\������@=��X�09��$��Ӵ�b4Pޗ��@�^rt=~B�\ҹ$��C�`.���c���@�^r <��O�`��V��s1HZ�|��cƹ���`p�6�s1������C7�H A}.F���-#A�wi�L��`��arx6T3��`��ar|5��a.ƃ~��1��p��.G�.�x�~(��(s1Ht���@ss1(���`�~^h�z����E�b<��������
}u��
ݲ�Q��[���cd.?;��z_R�hb`�/�Y�#��"2��Cd���a 8�Wd̅�����B|H�{|�:!�ۆ%��� M-��gS-�c��V{h�ן�?8�а�;=��ζ�S��w~h\����?<���j���y���V�Ʌ(�Z�&12���x?����6�����aT,��
�T-H�6{eg� ��魾�~��h�0?�ނ��.C��������-���A�T!�?H��1`���pm�`%-m}u1������@p��8Fj�db�mɒ��8����%�R�DK�Jx���3�L��i<��b܈(���i�}WP[[�G'-S؈�eb&���ߒ)s�j���[�^H�f�1��q�����+ �Gl ����JJ�)|y��؏���\"��K�1�_�1�b�1�߆6�yG�A����o�G�О��]�O�쫷��B����P�üמATH�	 /�����t�B�v#C�R����-���m2"�n�A��kƠ�B[�����`D�d'�����d0$�;aHЧ����Q_ik	�> �  �_J��m1$�Gm�!A�+��T�.�_��G�b<pb����L/��@����H���3l�;F�^��H��z3�^��0�j^�7�ۏ�a��${�#)���8�����w��`��2�?M��@�.H��F�F�
�����~����
�f((7Q�} -١I����^Z2hzg���Z�&�a����g2�"��0��0���>!�ؓc�Oiǒq�;�Q� �/�@`&��|�p�_�����_&#�*��|M�L����+���/d���}E����L��D]�d{-�I��>:�I�+������_�@��[H����d�T9/�l�[a��Yf���-�$��*tI�N'_��~Ĥ��o+$y75�2�L��(���T��O%�^��L2���$�_{���~�����$���]���%I���e��U"�$������K���o���R�JZI&�?�	_�l��]�]�$�w��
&4�0�2�����jxߞ��A�s��?�7���q"�w	�TǷ�Yf��#YV�ym�y��vh�H7O	j+;�z����i\f��Ο�:4�/t����������?RH%Z3�D��#��-���}u4@���A裨��;0yx?ު�M��|���t	j+ͳ@���hS�p�B$f���h]> �G+Q&�̣�s���B ����������	��^³��<a,Ca��G
��y<�Ǵ��q�}�iJxP�;�>�S�
��i��7���l��� ��[�O˔�q����?*%��Q�(��#��j���`���У�O>O��'q���θ��
�ޞ-LSZ����A]�
�}f��4�~|�;��O>�v#�^���A��kG�s���� Խ �_����?����6L>;u���w���߿����Zv'      5  