PGDMP     ;    -            	    {            gestion_tickets    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16510    gestion_tickets    DATABASE     �   CREATE DATABASE gestion_tickets WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
    DROP DATABASE gestion_tickets;
                postgres    false            �            1259    16511    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    postgres    false            �            1259    16514 
   comentario    TABLE     �   CREATE TABLE public.comentario (
    id integer NOT NULL,
    contenido character varying(255) NOT NULL,
    ticket_id integer NOT NULL
);
    DROP TABLE public.comentario;
       public         heap    postgres    false            �            1259    16517    comentario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comentario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.comentario_id_seq;
       public          postgres    false    215                       0    0    comentario_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.comentario_id_seq OWNED BY public.comentario.id;
          public          postgres    false    216            �            1259    16537    persona    TABLE     �   CREATE TABLE public.persona (
    id integer NOT NULL,
    usuario character varying(250),
    contrasenia character varying(250),
    email character varying(250),
    departamento character varying(250)
);
    DROP TABLE public.persona;
       public         heap    postgres    false            �            1259    16542    persona_id_seq    SEQUENCE     �   CREATE SEQUENCE public.persona_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.persona_id_seq;
       public          postgres    false    219                       0    0    persona_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.persona_id_seq OWNED BY public.persona.id;
          public          postgres    false    220            �            1259    16518    tickets    TABLE       CREATE TABLE public.tickets (
    id integer NOT NULL,
    titulo character varying(250) NOT NULL,
    descripcion character varying(255) NOT NULL,
    estado character varying(20) NOT NULL,
    fecha_creacion timestamp without time zone,
    creador character varying(100) NOT NULL
);
    DROP TABLE public.tickets;
       public         heap    postgres    false            �            1259    16523    tickets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tickets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.tickets_id_seq;
       public          postgres    false    217                       0    0    tickets_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;
          public          postgres    false    218            s           2604    16546    comentario id    DEFAULT     n   ALTER TABLE ONLY public.comentario ALTER COLUMN id SET DEFAULT nextval('public.comentario_id_seq'::regclass);
 <   ALTER TABLE public.comentario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            u           2604    16547 
   persona id    DEFAULT     h   ALTER TABLE ONLY public.persona ALTER COLUMN id SET DEFAULT nextval('public.persona_id_seq'::regclass);
 9   ALTER TABLE public.persona ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            t           2604    16548 
   tickets id    DEFAULT     h   ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);
 9   ALTER TABLE public.tickets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217                      0    16511    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          postgres    false    214                    0    16514 
   comentario 
   TABLE DATA           >   COPY public.comentario (id, contenido, ticket_id) FROM stdin;
    public          postgres    false    215   F                 0    16537    persona 
   TABLE DATA           P   COPY public.persona (id, usuario, contrasenia, email, departamento) FROM stdin;
    public          postgres    false    219   c                 0    16518    tickets 
   TABLE DATA           [   COPY public.tickets (id, titulo, descripcion, estado, fecha_creacion, creador) FROM stdin;
    public          postgres    false    217   <!                  0    0    comentario_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.comentario_id_seq', 1, false);
          public          postgres    false    216                       0    0    persona_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.persona_id_seq', 11, true);
          public          postgres    false    220                       0    0    tickets_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.tickets_id_seq', 2, true);
          public          postgres    false    218            w           2606    16527 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            postgres    false    214            y           2606    16529    comentario comentario_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.comentario DROP CONSTRAINT comentario_pkey;
       public            postgres    false    215            }           2606    16550    persona persona_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_pkey;
       public            postgres    false    219            {           2606    16531    tickets tickets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_pkey;
       public            postgres    false    217            ~           2606    16532 $   comentario comentario_ticket_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(id);
 N   ALTER TABLE ONLY public.comentario DROP CONSTRAINT comentario_ticket_id_fkey;
       public          postgres    false    3195    215    217               '   x�36L�430H153L�J1���LK54736����� v��            x������ � �         �  x���Ko1�מߑu��#+��T�T��RYts}}�zf`f*D=�QJ,�����sϱ`o�O#=1!�6���OCy�ۡ��8tk�v�h�J#��.+x��-{8����Azy{�(�+�x����R��,W���fU�ô����P��s~�sT�v#��N8��'HpL�|`�������.��&�˴'��z\����oa��R�c֗�LZ�n�����`����9�WW��n��&�}�7J:�7~#V�^� �����Z���$]ȑ(H΅	#)t�F�,b21�ڒ$�(��t�2(W�2���$i��g���$��I�h(�D9g�<h���{�QȌ<pA�N�܍�t�3�.�~�}w'�ݗp�߮(Y+�2��N{�!<�s�Ѩ̣'����*�d��Q������L��r���5�[��Ȉ�k� }Y*��e���D��$]m9c�yl��M�|Q�9�         �   x�M�1r1@�Z>�.����,����PP�QlŘ��ț��g�d��Lp*�[g$�:�f1�M>���.&�W�	�ZSY���"��	i��Æ6�7�����I�^Ş�Y�V���U���� �V�h-�����G�@���Ӵ�#��Xl��G��ΐ{��"^��O}��s����֓��g�18�~$5D�     