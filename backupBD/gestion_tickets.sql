PGDMP     5                	    {            gestion_tickets    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16510    gestion_tickets    DATABASE     �   CREATE DATABASE gestion_tickets WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
    DROP DATABASE gestion_tickets;
                postgres    false            �            1259    16551    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    postgres    false            �            1259    16514 
   comentario    TABLE     �   CREATE TABLE public.comentario (
    id integer NOT NULL,
    contenido character varying(255) NOT NULL,
    ticket_id integer NOT NULL,
    creador character varying(255)
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
       public          postgres    false    214                       0    0    comentario_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.comentario_id_seq OWNED BY public.comentario.id;
          public          postgres    false    215            �            1259    16537    persona    TABLE     �   CREATE TABLE public.persona (
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
       public          postgres    false    218                       0    0    persona_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.persona_id_seq OWNED BY public.persona.id;
          public          postgres    false    219            �            1259    16518    tickets    TABLE       CREATE TABLE public.tickets (
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
       public          postgres    false    216                       0    0    tickets_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;
          public          postgres    false    217            s           2604    16546    comentario id    DEFAULT     n   ALTER TABLE ONLY public.comentario ALTER COLUMN id SET DEFAULT nextval('public.comentario_id_seq'::regclass);
 <   ALTER TABLE public.comentario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214            u           2604    16547 
   persona id    DEFAULT     h   ALTER TABLE ONLY public.persona ALTER COLUMN id SET DEFAULT nextval('public.persona_id_seq'::regclass);
 9   ALTER TABLE public.persona ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            t           2604    16548 
   tickets id    DEFAULT     h   ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);
 9   ALTER TABLE public.tickets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216                      0    16551    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          postgres    false    220   <                 0    16514 
   comentario 
   TABLE DATA           G   COPY public.comentario (id, contenido, ticket_id, creador) FROM stdin;
    public          postgres    false    214   Y                 0    16537    persona 
   TABLE DATA           P   COPY public.persona (id, usuario, contrasenia, email, departamento) FROM stdin;
    public          postgres    false    218   ;                  0    16518    tickets 
   TABLE DATA           [   COPY public.tickets (id, titulo, descripcion, estado, fecha_creacion, creador) FROM stdin;
    public          postgres    false    216   V#                  0    0    comentario_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.comentario_id_seq', 9, true);
          public          postgres    false    215                       0    0    persona_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.persona_id_seq', 14, true);
          public          postgres    false    219                       0    0    tickets_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tickets_id_seq', 10, true);
          public          postgres    false    217            }           2606    16555 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            postgres    false    220            w           2606    16529    comentario comentario_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.comentario DROP CONSTRAINT comentario_pkey;
       public            postgres    false    214            {           2606    16550    persona persona_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_pkey;
       public            postgres    false    218            y           2606    16531    tickets tickets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_pkey;
       public            postgres    false    216            ~           2606    16532 $   comentario comentario_ticket_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(id);
 N   ALTER TABLE ONLY public.comentario DROP CONSTRAINT comentario_ticket_id_fkey;
       public          postgres    false    216    214    3193                  x������ � �         �   x���=NA�k�)|���@MACPD�Hi�3���#An���bLv��R�������	,w���C�#�(=��a���r���`�0��t��[�����]lz��<I��0��)I𭖘�w��������d=%�Y�I��7����׳���`��#�I����<�!��mܱ%�ɇW�XȫҖf��>����*��╒�           x��SMsG=���=��C���)���¸ �&).j�z30��g�E��G^�b�YrȜ�^Kzzғ��������C�{���nn���ݝ�4���]L���Ӱp��]*������}�C6w�R/߼^�n5L�5��~��T�~�5��#t":��iw`��5�asv���m5t�����xz#��QiL�k��?�J8���w	�������:ơ�����0LG�߂'ԦeX��4ݑ���9��YYsL���n����s�"��tn�E���T�
��v�6}ZVs+"�cC6\�sLXBE�J�`�	�L�x��eu�͕�k�P]��[j�z q��p��)�Jk��dH>Z����56�X�ou�����nsB���vu�r���&_�K�"��� 1FH!� �L˦�ZJ�͔$�R�FWAR�JM��5d�'U����\��1��lsރs+$Bb3�G�F�;a�f?/�;�ٝ��k����}\������ߖ�ɘ+���TK _ba�L�iLM��j�!WWC���ƒ
 Н֦2e�r�� &jIL5�r���R�V�i=<�v������Ǫ������]�����e!�V�H�0�z#��V���ciN��p(�5�
r����I��0������&ࣩd-�)Ԧ��)�j1�Բ�́������5=pt��_�gz�������xsK�I����kCpb[P���zL�φ\���l-@���������K�.��K�^k�HMc�7���{���SD�,��z��O����b����         �  x�}�An�0E��)�!ȡdJ�Ewe (�)�͘�:L%Ѡd �mz��G��Jٵ�rW�?��s�1F޵����{��Ö��S��E�s�x�G���hu��j��ʥF�
+f����P���Z$i�@�H[z
��Z��=����0�k��5�Xȕ^�u����x�'j(3b��u19v�(��u[n[v����o�}��R�����F����p�(�S6��[�1l�o~Bp��c����68�!}�"�'�Bת�hW9V�Ȏ!gZ4��nh�]����M�
tUj�J+��v�[���\��w��[FW��N�y%��U�g�c;�9�}n��)��6��ñ��?�������E]iM��g��6LK�#���ώ{~���4[z��JPX�LV��U)�P�7��?k����*5���V��Ū����Wځ�FS[b}菩|�j��Mi���\���I^��@Y��4�Y�UfY�z�+W     