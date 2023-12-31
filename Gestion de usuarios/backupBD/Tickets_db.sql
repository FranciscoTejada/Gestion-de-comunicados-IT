PGDMP                     	    {         
   tickets_db    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    40960 
   tickets_db    DATABASE     �   CREATE DATABASE tickets_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
    DROP DATABASE tickets_db;
                postgres    false            �            1259    40961    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    postgres    false            �            1259    40976 
   comentario    TABLE     �   CREATE TABLE public.comentario (
    id integer NOT NULL,
    contenido character varying(255) NOT NULL,
    ticket_id integer NOT NULL
);
    DROP TABLE public.comentario;
       public         heap    postgres    false            �            1259    40975    comentario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comentario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.comentario_id_seq;
       public          postgres    false    218                       0    0    comentario_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.comentario_id_seq OWNED BY public.comentario.id;
          public          postgres    false    217            �            1259    40967    tickets    TABLE       CREATE TABLE public.tickets (
    id integer NOT NULL,
    titulo character varying(250) NOT NULL,
    descripcion character varying(255) NOT NULL,
    estado character varying(20) NOT NULL,
    fecha_creacion timestamp without time zone,
    creador character varying(100) NOT NULL
);
    DROP TABLE public.tickets;
       public         heap    postgres    false            �            1259    40966    tickets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tickets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.tickets_id_seq;
       public          postgres    false    216                       0    0    tickets_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;
          public          postgres    false    215            o           2604    40979    comentario id    DEFAULT     n   ALTER TABLE ONLY public.comentario ALTER COLUMN id SET DEFAULT nextval('public.comentario_id_seq'::regclass);
 <   ALTER TABLE public.comentario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            n           2604    40970 
   tickets id    DEFAULT     h   ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);
 9   ALTER TABLE public.tickets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216                      0    40961    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          postgres    false    214   ~       	          0    40976 
   comentario 
   TABLE DATA           >   COPY public.comentario (id, contenido, ticket_id) FROM stdin;
    public          postgres    false    218   �                 0    40967    tickets 
   TABLE DATA           [   COPY public.tickets (id, titulo, descripcion, estado, fecha_creacion, creador) FROM stdin;
    public          postgres    false    216   �                  0    0    comentario_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.comentario_id_seq', 1, false);
          public          postgres    false    217                       0    0    tickets_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tickets_id_seq', 21, true);
          public          postgres    false    215            q           2606    40965 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            postgres    false    214            u           2606    40981    comentario comentario_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.comentario DROP CONSTRAINT comentario_pkey;
       public            postgres    false    218            s           2606    40974    tickets tickets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_pkey;
       public            postgres    false    216            v           2606    40982 $   comentario comentario_ticket_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(id);
 N   ALTER TABLE ONLY public.comentario DROP CONSTRAINT comentario_ticket_id_fkey;
       public          postgres    false    3187    218    216                  x�36L�430H153L����� '��      	      x������ � �         a   x���@0 �s���#>���ѥ�F����?��c�%�Sh.���M�1A��{�5��n�����GF⑻ړ��$��=$�[k�����     