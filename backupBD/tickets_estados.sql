PGDMP     :    1            
    {            gestion_tickets    15.2    15.2 %    !           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            "           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            #           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            $           1262    57372    gestion_tickets    DATABASE     �   CREATE DATABASE gestion_tickets WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
    DROP DATABASE gestion_tickets;
                postgres    false            �            1259    57373    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    postgres    false            �            1259    57411    cambios_estado_ticket    TABLE     �   CREATE TABLE public.cambios_estado_ticket (
    id integer NOT NULL,
    ticket_id integer,
    usuario character varying(100),
    estado character varying(20),
    fecha timestamp without time zone
);
 )   DROP TABLE public.cambios_estado_ticket;
       public         heap    postgres    false            �            1259    57410    cambios_estado_ticket_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cambios_estado_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.cambios_estado_ticket_id_seq;
       public          postgres    false    222            %           0    0    cambios_estado_ticket_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.cambios_estado_ticket_id_seq OWNED BY public.cambios_estado_ticket.id;
          public          postgres    false    221            �            1259    57376 
   comentario    TABLE     �   CREATE TABLE public.comentario (
    id integer NOT NULL,
    contenido character varying(255),
    ticket_id integer NOT NULL,
    creador character varying(255)
);
    DROP TABLE public.comentario;
       public         heap    postgres    false            �            1259    57381    comentario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comentario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.comentario_id_seq;
       public          postgres    false    215            &           0    0    comentario_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.comentario_id_seq OWNED BY public.comentario.id;
          public          postgres    false    216            �            1259    57382    persona    TABLE     �   CREATE TABLE public.persona (
    id integer NOT NULL,
    usuario character varying(250),
    contrasenia character varying(250),
    email character varying(250),
    departamento character varying(250)
);
    DROP TABLE public.persona;
       public         heap    postgres    false            �            1259    57387    persona_id_seq    SEQUENCE     �   CREATE SEQUENCE public.persona_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.persona_id_seq;
       public          postgres    false    217            '           0    0    persona_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.persona_id_seq OWNED BY public.persona.id;
          public          postgres    false    218            �            1259    57388    tickets    TABLE       CREATE TABLE public.tickets (
    id integer NOT NULL,
    titulo character varying(250) NOT NULL,
    descripcion character varying(255) NOT NULL,
    estado character varying(20) NOT NULL,
    fecha_creacion timestamp without time zone,
    creador character varying(100)
);
    DROP TABLE public.tickets;
       public         heap    postgres    false            �            1259    57393    tickets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tickets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.tickets_id_seq;
       public          postgres    false    219            (           0    0    tickets_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;
          public          postgres    false    220            {           2604    57414    cambios_estado_ticket id    DEFAULT     �   ALTER TABLE ONLY public.cambios_estado_ticket ALTER COLUMN id SET DEFAULT nextval('public.cambios_estado_ticket_id_seq'::regclass);
 G   ALTER TABLE public.cambios_estado_ticket ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            x           2604    57394    comentario id    DEFAULT     n   ALTER TABLE ONLY public.comentario ALTER COLUMN id SET DEFAULT nextval('public.comentario_id_seq'::regclass);
 <   ALTER TABLE public.comentario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            y           2604    57395 
   persona id    DEFAULT     h   ALTER TABLE ONLY public.persona ALTER COLUMN id SET DEFAULT nextval('public.persona_id_seq'::regclass);
 9   ALTER TABLE public.persona ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            z           2604    57396 
   tickets id    DEFAULT     h   ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);
 9   ALTER TABLE public.tickets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219                      0    57373    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          postgres    false    214   �)                 0    57411    cambios_estado_ticket 
   TABLE DATA           V   COPY public.cambios_estado_ticket (id, ticket_id, usuario, estado, fecha) FROM stdin;
    public          postgres    false    222   �)                 0    57376 
   comentario 
   TABLE DATA           G   COPY public.comentario (id, contenido, ticket_id, creador) FROM stdin;
    public          postgres    false    215   ^*                 0    57382    persona 
   TABLE DATA           P   COPY public.persona (id, usuario, contrasenia, email, departamento) FROM stdin;
    public          postgres    false    217   ^+                 0    57388    tickets 
   TABLE DATA           [   COPY public.tickets (id, titulo, descripcion, estado, fecha_creacion, creador) FROM stdin;
    public          postgres    false    219   y.       )           0    0    cambios_estado_ticket_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.cambios_estado_ticket_id_seq', 4, true);
          public          postgres    false    221            *           0    0    comentario_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.comentario_id_seq', 12, true);
          public          postgres    false    216            +           0    0    persona_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.persona_id_seq', 14, true);
          public          postgres    false    218            ,           0    0    tickets_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tickets_id_seq', 11, true);
          public          postgres    false    220            }           2606    57398 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            postgres    false    214            �           2606    57416 0   cambios_estado_ticket cambios_estado_ticket_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.cambios_estado_ticket
    ADD CONSTRAINT cambios_estado_ticket_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.cambios_estado_ticket DROP CONSTRAINT cambios_estado_ticket_pkey;
       public            postgres    false    222                       2606    57400    comentario comentario_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.comentario DROP CONSTRAINT comentario_pkey;
       public            postgres    false    215            �           2606    57402    persona persona_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_pkey;
       public            postgres    false    217            �           2606    57404    tickets tickets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_pkey;
       public            postgres    false    219            �           2606    57417 :   cambios_estado_ticket cambios_estado_ticket_ticket_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cambios_estado_ticket
    ADD CONSTRAINT cambios_estado_ticket_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(id);
 d   ALTER TABLE ONLY public.cambios_estado_ticket DROP CONSTRAINT cambios_estado_ticket_ticket_id_fkey;
       public          postgres    false    3203    219    222            �           2606    57405 $   comentario comentario_ticket_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(id);
 N   ALTER TABLE ONLY public.comentario DROP CONSTRAINT comentario_ticket_id_fkey;
       public          postgres    false    215    3203    219                  x�KL5O6LK�H55O����� 2�y         g   x���1�  ����hZ(�t���d 1%Q'_�L���G�Ȅ3i�Wnf�!�-���֍D#�@�0{�?�'�\�cѽ�K�At�}U�Q���ϽM �&/�         �   x���MN1���)|Ĕ��5l(Bt�ԍ'c��Nv"��,\w1�*������g7�b�eM��*-)F�XR|�b�&Ψ�Q,ԉA��0�t�{�7<���f;����{q�ȵ���0xr'�XsL��_*�1���(cT�ʺS�S��&�OZ��~�ę�RT�Z����Q�6|7bȯ�φ6���T�U.W��T�-�����7
���~�+%�ڢ������x`��77M��(����           x��SMsG=���=��C���)���¸ �&).j�z30��g�E��G^�b�YrȜ�^Kzzғ��������C�{���nn���ݝ�4���]L���Ӱp��]*������}�C6w�R/߼^�n5L�5��~��T�~�5��#t":��iw`��5�asv���m5t�����xz#��QiL�k��?�J8���w	�������:ơ�����0LG�߂'ԦeX��4ݑ���9��YYsL���n����s�"��tn�E���T�
��v�6}ZVs+"�cC6\�sLXBE�J�`�	�L�x��eu�͕�k�P]��[j�z q��p��)�Jk��dH>Z����56�X�ou�����nsB���vu�r���&_�K�"��� 1FH!� �L˦�ZJ�͔$�R�FWAR�JM��5d�'U����\��1��lsރs+$Bb3�G�F�;a�f?/�;�ٝ��k����}\������ߖ�ɘ+���TK _ba�L�iLM��j�!WWC���ƒ
 Н֦2e�r�� &jIL5�r���R�V�i=<�v������Ǫ������]�����e!�V�H�0�z#��V���ciN��p(�5�
r����I��0������&ࣩd-�)Ԧ��)�j1�Բ�́������5=pt��_�gz�������xsK�I����kCpb[P���zL�φ\���l-@���������K�.��K�^k�HMc�7���{���SD�,��z��O����b����           x�}�Mn�0���)x��h�l�"��2��fD1SI4HHs���|�Rr-;�ܕ@���|o���ٵ�7��5��ߓ'�����r�yc�o���P�\�X!r��Jd)�*g���+j�h�73p`Q+�烧�^ܩ�i9�lc{j�5n6��CQV��5���S�mЎ?�j(�l�B���w�(��w�i[���:�������--U:a`^!�bȶ�g
u���S{𮦾q<�A{=�k�:M<��Rd�H��*�|�ay�l
9�<=�]h�}�cm�U��CY)1�B k�.AvG~���v=?����-��PEӬL�<
f������>���1��ֵm�Tic_��l���mvU)�沈�޳��΍Kh=7����MX�u����l���-b\`#YZJ���}��n�;%埽�Lqp4D/�9�ʇ��'��# S)!y���;���JaZ�Ę�/���7� f�Ne^
�W� �\c���q��ں),��ퟠ`%�HT%�#./,��&I���Ak     