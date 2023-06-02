PGDMP     !                    {            inmobiliaria_bonpland    15.0    15.0 7    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            @           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            A           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            B           1262    35289    inmobiliaria_bonpland    DATABASE     �   CREATE DATABASE inmobiliaria_bonpland WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 %   DROP DATABASE inmobiliaria_bonpland;
                postgres    false            �            1259    35290    City    TABLE     g   CREATE TABLE public."City" (
    id integer NOT NULL,
    name text NOT NULL,
    "stateId" integer
);
    DROP TABLE public."City";
       public         heap    postgres    false            �            1259    35295    City_id_seq    SEQUENCE     �   CREATE SEQUENCE public."City_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."City_id_seq";
       public          postgres    false    214            C           0    0    City_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."City_id_seq" OWNED BY public."City".id;
          public          postgres    false    215            �            1259    35296    Contract    TABLE     �  CREATE TABLE public."Contract" (
    id integer NOT NULL,
    "userId" integer,
    value_contract double precision NOT NULL,
    date_contract timestamp(3) without time zone NOT NULL,
    date_start timestamp(3) without time zone NOT NULL,
    date_end timestamp(3) without time zone NOT NULL,
    "propertyId" integer,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);
    DROP TABLE public."Contract";
       public         heap    postgres    false            �            1259    35300    Contract_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Contract_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Contract_id_seq";
       public          postgres    false    216            D           0    0    Contract_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Contract_id_seq" OWNED BY public."Contract".id;
          public          postgres    false    217            �            1259    35301    Country    TABLE     S   CREATE TABLE public."Country" (
    id integer NOT NULL,
    name text NOT NULL
);
    DROP TABLE public."Country";
       public         heap    postgres    false            �            1259    35306    Country_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Country_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Country_id_seq";
       public          postgres    false    218            E           0    0    Country_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Country_id_seq" OWNED BY public."Country".id;
          public          postgres    false    219            �            1259    35307    Property    TABLE     �  CREATE TABLE public."Property" (
    id integer NOT NULL,
    imagen text NOT NULL,
    m2 double precision NOT NULL,
    type_contract integer NOT NULL,
    type_propery integer NOT NULL,
    state_contract integer NOT NULL,
    antiquity integer NOT NULL,
    price_rent double precision NOT NULL,
    price_sell double precision NOT NULL,
    description character varying(255) NOT NULL,
    bathroom integer NOT NULL,
    room integer NOT NULL,
    address text NOT NULL,
    name_owner text NOT NULL,
    number_owner text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "cityId" integer
);
    DROP TABLE public."Property";
       public         heap    postgres    false            �            1259    35313    Property_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Property_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Property_id_seq";
       public          postgres    false    220            F           0    0    Property_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Property_id_seq" OWNED BY public."Property".id;
          public          postgres    false    221            �            1259    35314    State    TABLE     j   CREATE TABLE public."State" (
    id integer NOT NULL,
    name text NOT NULL,
    "countryId" integer
);
    DROP TABLE public."State";
       public         heap    postgres    false            �            1259    35319    State_id_seq    SEQUENCE     �   CREATE SEQUENCE public."State_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."State_id_seq";
       public          postgres    false    222            G           0    0    State_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."State_id_seq" OWNED BY public."State".id;
          public          postgres    false    223            �            1259    35320    User    TABLE     s  CREATE TABLE public."User" (
    id integer NOT NULL,
    email text NOT NULL,
    name text NOT NULL,
    lastname text NOT NULL,
    password text NOT NULL,
    superuser boolean DEFAULT false NOT NULL,
    phone text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);
    DROP TABLE public."User";
       public         heap    postgres    false            �            1259    35327    User_id_seq    SEQUENCE     �   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public          postgres    false    224            H           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public          postgres    false    225            �            1259    35328    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    postgres    false            �           2604    35388    City id    DEFAULT     f   ALTER TABLE ONLY public."City" ALTER COLUMN id SET DEFAULT nextval('public."City_id_seq"'::regclass);
 8   ALTER TABLE public."City" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214            �           2604    35389    Contract id    DEFAULT     n   ALTER TABLE ONLY public."Contract" ALTER COLUMN id SET DEFAULT nextval('public."Contract_id_seq"'::regclass);
 <   ALTER TABLE public."Contract" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            �           2604    35390 
   Country id    DEFAULT     l   ALTER TABLE ONLY public."Country" ALTER COLUMN id SET DEFAULT nextval('public."Country_id_seq"'::regclass);
 ;   ALTER TABLE public."Country" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            �           2604    35391    Property id    DEFAULT     n   ALTER TABLE ONLY public."Property" ALTER COLUMN id SET DEFAULT nextval('public."Property_id_seq"'::regclass);
 <   ALTER TABLE public."Property" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220            �           2604    35392    State id    DEFAULT     h   ALTER TABLE ONLY public."State" ALTER COLUMN id SET DEFAULT nextval('public."State_id_seq"'::regclass);
 9   ALTER TABLE public."State" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222            �           2604    35393    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            0          0    35290    City 
   TABLE DATA           5   COPY public."City" (id, name, "stateId") FROM stdin;
    public          postgres    false    214   �A       2          0    35296    Contract 
   TABLE DATA           �   COPY public."Contract" (id, "userId", value_contract, date_contract, date_start, date_end, "propertyId", created_at, "updatedAt") FROM stdin;
    public          postgres    false    216   �e       4          0    35301    Country 
   TABLE DATA           -   COPY public."Country" (id, name) FROM stdin;
    public          postgres    false    218    f       6          0    35307    Property 
   TABLE DATA           �   COPY public."Property" (id, imagen, m2, type_contract, type_propery, state_contract, antiquity, price_rent, price_sell, description, bathroom, room, address, name_owner, number_owner, created_at, "updatedAt", "cityId") FROM stdin;
    public          postgres    false    220   4f       8          0    35314    State 
   TABLE DATA           8   COPY public."State" (id, name, "countryId") FROM stdin;
    public          postgres    false    222   Qf       :          0    35320    User 
   TABLE DATA           p   COPY public."User" (id, email, name, lastname, password, superuser, phone, created_at, "updatedAt") FROM stdin;
    public          postgres    false    224   wh       <          0    35328    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          postgres    false    226   �h       I           0    0    City_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."City_id_seq"', 2411, true);
          public          postgres    false    215            J           0    0    Contract_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Contract_id_seq"', 1, false);
          public          postgres    false    217            K           0    0    Country_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Country_id_seq"', 2, true);
          public          postgres    false    219            L           0    0    Property_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Property_id_seq"', 1, false);
          public          postgres    false    221            M           0    0    State_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."State_id_seq"', 56, true);
          public          postgres    false    223            N           0    0    User_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."User_id_seq"', 1, false);
          public          postgres    false    225            �           2606    35342    City City_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."City"
    ADD CONSTRAINT "City_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."City" DROP CONSTRAINT "City_pkey";
       public            postgres    false    214            �           2606    35344    Contract Contract_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Contract"
    ADD CONSTRAINT "Contract_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Contract" DROP CONSTRAINT "Contract_pkey";
       public            postgres    false    216            �           2606    35346    Country Country_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Country"
    ADD CONSTRAINT "Country_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Country" DROP CONSTRAINT "Country_pkey";
       public            postgres    false    218            �           2606    35348    Property Property_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Property"
    ADD CONSTRAINT "Property_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Property" DROP CONSTRAINT "Property_pkey";
       public            postgres    false    220            �           2606    35350    State State_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."State"
    ADD CONSTRAINT "State_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."State" DROP CONSTRAINT "State_pkey";
       public            postgres    false    222            �           2606    35352    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    224            �           2606    35354 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            postgres    false    226            �           1259    35355    User_email_key    INDEX     K   CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);
 $   DROP INDEX public."User_email_key";
       public            postgres    false    224            �           2606    35356    City City_stateId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."City"
    ADD CONSTRAINT "City_stateId_fkey" FOREIGN KEY ("stateId") REFERENCES public."State"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 D   ALTER TABLE ONLY public."City" DROP CONSTRAINT "City_stateId_fkey";
       public          postgres    false    214    222    3223            �           2606    35361 !   Contract Contract_propertyId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Contract"
    ADD CONSTRAINT "Contract_propertyId_fkey" FOREIGN KEY ("propertyId") REFERENCES public."Property"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 O   ALTER TABLE ONLY public."Contract" DROP CONSTRAINT "Contract_propertyId_fkey";
       public          postgres    false    220    216    3221            �           2606    35366    Contract Contract_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Contract"
    ADD CONSTRAINT "Contract_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Contract" DROP CONSTRAINT "Contract_userId_fkey";
       public          postgres    false    3226    216    224            �           2606    35371    Property Property_cityId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Property"
    ADD CONSTRAINT "Property_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES public."City"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Property" DROP CONSTRAINT "Property_cityId_fkey";
       public          postgres    false    214    220    3215            �           2606    35376    State State_countryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."State"
    ADD CONSTRAINT "State_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES public."Country"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 H   ALTER TABLE ONLY public."State" DROP CONSTRAINT "State_countryId_fkey";
       public          postgres    false    218    222    3219            0      x�m\�r�Z��q���L2��#���-�R[���II��
xB�R�0?ЙC����?6k��Hz:q�l� �~��8��0	n�z����nh����(���7��qgYp1�i��(M������9�i\Nu��q��,��4�ȳ�jZ���U�E�>|���z�L�k�������]�5L�� ����~�E��wn�t]w�[�s��B\w�[}���j!$Ep7�nu���:̓�f�V�����w���<����f��m&Dh)>�nݓ.˼޸}�M�cD%(E|�%��eF���g�1q����u�n�k���
��~ම��0x=��u�q\��}����HB�[�~n���(�������M?��)!	.��C?�UB�;���]Wŏ�U�����1��W����m�T��߇��K��b熽[~!�˾���]`�ŀ5�����loM�����Ѯ��eݶ�.2,���;|భ;�,x붱��ep94���,�
�94�e{SW7��z���?-�q�];��,�j���Ƌ,��O7n�a�	
~����&��r�Ľ��@��KJy��u{%���~��}c%lƮz}d��j��[/.�)�nP2>��V�n�P�����n�:{YEe���^0��}�u{�Ξ�/ܲn��9����ȃ��D��e�/��@u�n�W��;��e�1\Ǎ�
Q,��k=����gB���C�X׋��[��ch���� M൛Q�C#>B�	�o�d����>�ݚ�'��n�+������ZRʁv:8si�/���q�t�*��Qy:�W%�=��&�1��.R,��zi�)>��u��c��;'F#�)	��->�W�߸m?��{?uN},f�[
����7�Tю �EKgs���ï'Xe��}�6J��(x��zp�:�*���7�S%"����<��y
�{j̀
�x��k��\�jv�jKLG�v��			{�;|S�	�_ݰ�otP�[U�ʂw��ΫnUP>���V�¯)=Y�'�LIQ�
8�sU�J�ҏ�o��B0=��V-�_~������XrA��m䏮�:HX'|�w��b,���{q���a�ɵ���}TE����\�Z��︺�����x�^#/� _w���H��)i	�p��k[W����W2(
���Gg�I#�^�]Ӷ|�~?M��g�*M��
�u+��q��~j�5��*s
���w��[7���=e��,n�oĎ?A�V�w�Χ�4�襛D	 Gr3��b?8:X���B�t�{_̀Or����5�B�z��~�X3���+Ȱ^9��%>�a��莀cZ�zz�JL�*)ݶ��Cŷ0����wJ,�M��!1�[� F�˨�?�� 6��K�Q�����&ρ3�"x5@w�d]�i� �Zܶ�B^�X��eA��)u��ƙW)=۾^����W��;��Xcw�k}1дnؘ��S�]����C�w�f0矜;����3G��Q��Jr��&�/^� �F-��/^���GM�Vo�G�%@ħzC�����~j6��"�W�9T鷾��Ku91����Sz�"fH�0,r�FWpY�!�L��c?�b����P������4A�(gc6�C,W�ìa;|��>̉�q���Fͯ��p��V�BH~Y@��kr����g���̊�-,~��m0e�����kv�-E��f9�&Жj�
_ oI|��R,(���u��E>#�mj�7<��cߋP�
W$����\�D��gRE(�X�o����D6�!�&%�R2� k����÷�f���K���HU�`�P��� }ӌ�T4��/�
��zMQ#H���ް_U���Z��+>�h�C3u��:��glbg
� ��Ir�v�X��z,Es�����>N��"v@Pѧ"�w�+&)L�F�0;<޺�M�*��&1��o���qƯ�!QT��Ϟ|lHXow��z��'%*�[Ι��B ��I�'(Q{�(!��'�
V];�3��=8CbJ�9�%h
5�l6S�!��|SB<�W�ĳ}m��a����/����	؁�r�4Y���ˏf��v��k93����(��}j+��;CΌ��Y2
u�)p�beY��`�z������b��!�_�$w��N��W�a�KƕQ��"K���p2�%`��R�S���'$�u�7E����l&�����ņ�[¥�J�0T�c����!!�����+�Ӝ1~@B����XVg�^IS@Q:�b@�Ɣ��ޚC�g�**�K��y̂��r4��{���T�$�-^�'�_��b[g�E�-�'﷡[��HH&��*����������t���կ$�(������C,D�y�Q,șj%p�H9��RLQ��K�'��aNp��'O�b��X����,��r�U�N�d���K�CtRn%�M��S�$�C.�H�U����B�a���NXY'����� �D���οjz�R�vh�g��*I���YŜ�}�7���Kc������A�BO'0W���h	�y?�I��ߔP��N/G�t���Q'qJ����~�D$�)����@���{�]�HDLV�Uo��zx�9("w�>|�YDP��+�lZ~S"��F�	�JJ�w;B���<P�%y�m���F���x��2��Tu�|>£���"�X8f��G#i��4�R2�.��6�e*�2���<Zƽu��`�����)��.�?���s������n��Y=�/ˋ��<��VU0���aY>1�u���T.�y�VMo2���1��u��4�ElDv祜��0�1�|K�^��ߋ^u\��o�Ph��A uo�������ukr���	3n�L-�� 1�M�}D���:'r%d;|G<z&$��
��^�Uz�4Ô��
����sɄcE�Qq�\��Frd(>`�Ff�?��ũ;����D
�t�KoǙ$�*dd�sԇ���W&P�_�a� -m�d����L͌��@������)�0@	�]�=��<.+� {�A�B	���OM���'�K���i݊�QV"$�:�ܱ;��7ߗί�n�����ي�q�4@ *j�����D�`��S�! ��$N����M�sT?�TG}/�5�{0em�D�.g��#��,�4<(Ǡ��\VR�3�O�� �F*�¦j.*�)�x�m� H�KW:߰�f|˃W���
�d�ʶ�YڪY�a,��׻Ɍ|`-VY��ly]jN%g[��Z�H���XZϴ�>��D�$�|	F�GǽGB՘�Ū�o���)}�o=�bKp��"ܣ�Na*٥��e�C���y,�d�U�!��QX��,es����Wd�J�� +�����.V=KZ�_.��Vt��"��Ly�Gdڰe�*���!�����4)r�D�$M�+F��渆FlŢ� (�w�rqS_��_ p ��G�IB��F@�eʰ�l��滯�;�!ɻ���i����2[PK�c˲T4X�'�e�e$�ur&𞹚H��<z��Φ��[J����	�����?|U�R1��[d�=�&�8���y����;W���L�%������Zە�d�1�W#�Hu������M"2�'�!��J
ڹ]OH�� ��@CS��
z+��a�k��tE���� ��l
F�"t�*�P�:ܷJ(�iMPH/����X�[����[d�s�f-*
	5��/�� 6�!��v��]��u?�|Ix��!#g�e��j����6��Z��xǂv�JK�!e��E~��$I�`m��<�R4�G�	` y/k��He� N�ҢJiս�~{�:���@��<�M���0��2�/�5*@)�Ⱥ�^�J<:�O�ig<���]-=���^M#�q�xd�E(�:���@)�J�%��v����䱝d�*o̵>&�f�0y��og�[ez#�^v�'Gpg�eɛ���/:�������s�F��'��nm1��j�Z�U��VY
SɆgM�!��[�즒��=[^"o�F{V���	2�G�6��i�ql�j4Xf9;�ϓ�@�Q�Q�h@H�F��Yp���ك3�}    �|��Ե��h�iL`��o�Cm]i�@(���Ԙ���:/r6P���S��x����MRo��̛a��L���5�v���E|��_�.��\ ���G�Й�>�0�9���	_�wp�@ /�q��*��t�C�|c3h[���{�&o���3>�)f^M[8Z�}H��Y�7*�H+փ��g� :�]-�av�tX�k�6 Dݍ>&��siNY�����v)�7��,� �ܓI��԰�,�Ϋ�5E��˘��(8�wy,��9zQg?5zZ�P��
�3�����%���G��\�]yQ~�5��Q��H� ��g����dBל�����@�F�U��d��M��^�R��'xγ*Xm�3�QR�궓 v�{D��QL����/�-@�3��Ȱ���X"��X�TʤJ��]��$5~ϗ�b�(�:"�Rc��(��=��Ĩ:)Mo��`p��R��g�#C'vM���ق���BV�Ou��o�3�����;,(���J���s4��J�;�Ԙ�h`�.�P�
Q���	Vˋ��������p���q��H��m�Q����EO��Bb��N5S%����(�\��-�%��Ua�5�ds��$b��%��������"z=�P됾�!�<ꑡ��L���T�e� j~��Hݧ�+k�:��(��*d�@bJ�
,���P5,p"�VB��M!\�WH$	�v��<�6[�l�9p�j�TmLR����[o���D���c��d\p� I�
�����6�q���fK\dx�b�%ed�������Q$��W�3���yⓘl��.Ş9\��!��=�کl2��A+�̈���x>�nZ�y?/���fh�=C=��H3ՁD����V�*�@��u�k��擜F����
a�B�/�	�M�
��K���Ϩ�&~��U��-���L\�ϖ']�x"���9Y0��W��C&�.0�z�^ڌH�2y�Ro`�)҇�n����r��y�!
�2���]U��.�&�VnU�L�OU$��_���i
i��Yyf<��s��ӝ&�\J�l���-#�"N�n�Q�OU�s��ۼ*Uj.�[IME~� `�B��	Q�8]�յ���.=2���ϖ�oS�;���ӄ���dPI7���s��"���#���ɲ��/�����e?�l�����{���rE��7�G%s���[k�6&T� o|�J8���xC`;����J*�6�]@��Aq�Q�ʙl=�����l�q�*
���Z�>еB'v�Y��J'R6KX>�mUJ�ndS�f.æ�* ?�eX��pq����S�O��z,߇'����F�@?�3����á"���W�X׺�|?B2�me`SwPs*�|��ҩ�L�,|�ӏf]�	���=�xٚ e��"�4ZZ�l�<Mt���Z��F�BЅQ�ws�V���؎82�k�*��5�O&�.��{�C��;�YJP�i/O7$����~��B�]��)�"�7�?�u�鈟eK��T�\��H�m:��dM���8���!��Y����ʭN$�KZ�.�[,tJ���/Q���k`?IX��f�@��ҭjs%%�b�܎�;�f���`��gX���qj��O؁W��l�D$km��}I�lzr�$s[���c��L���Yэ��3�5��%����Vg�W�c�V6�i
�U��6�lԒ7˦�x�rD·n��T�C ������9Ϋ�<;]fDk�ӑ�))��x�P P�nuj�KX��am���{�����*b���n:�
 �� ����xZ��_9@;��Z�[N�f'^���Y�*QUFkO� �<�A�%�, ��ߜ���	g^+�޷DfA�Z�PO%�ypm7U��`�4Vr<	�nZۢ`.�.n�g6Ì�}5QI��:V���V9�p�k�U����b�$�MY+�dh{0Ξyk������p+���ޡ'�6��ƫ�B8�x_-_e�mJ:JD�+����s��ϿwK��mE'8OwK���H�M��
t���)�Q7W�^>.�f|�8�Q�)�'2BtVR,C;�2�˳��	)�WrVO ��2���P��	�:kR�$���?̏��#a�d�z|������\�}nͫ~`\��}A�<�#�G��褁%'�=JD
*)f��~]�g)��1;�[�W9U�*?6�MѐrJ�hT!Օ��xy��Ի��~�� ��%���x��D9�G��t蛞�nt�7<١O��J�@V0��I�8��v���!$��=C��W��d�|?A:~_#�"�|��I�b�;�X[g��Q
Q1���XsS����9ZSpe� ��� ��y(	�g��L�6����P�x�tT}ɴw���Dg�MOc�q1v�a��(�<�y�Yy�E�=g	����[����/.���׉!D2�ɇ���&e;{4ȍ����/�HN ��ߚ�%'���+�s��FoAv2����s�̭�9�s8�M`%[ο*�ePw�q0a����d�W��7�d��~�R��z7�P�yw��.KS���$T
^!��4s�ԭ/���Lؐ�����SUr$p�N~ˌ��La�LR��/V�jʅ]z��u��Ǯ��`�Qs�L,�3 �������X1[Y�ސDRV�lݬ;`�t��~U�SF��^y�p2:9���E�l�o����S��
_7�u�?�i��n�*xtꬕ�<}a8^�G���w �y�qU?���kZ�[��=2t)�rm��n
�7��R�+(��`R�LΕPoOq�!�eulਘ�I���;�*>Ve��rB@aɺ�I�~�{�y&Ѥ1L
��=z�>� ù"��x�B%;����c�ǆ�I}�b�V�.yz��ԫf�od�H�8 ֭�C@2X#����&l���9�:�<�&_�Vj��� �
Ìe���g���)���â7Yg�kZ
2�9��(x�gw��6Kf+$%�����P�x#2Θ<{��n�՗9n������	[	����l�QX8���^Y+�G;�#,��G[�YkG#���3�:���������u-��wxr�B�A�9n\��$!���ᓘ�+Pn�2V���8-͡3ev$�����RNx/瘈���<��h
�>�3������4C��p�1a��GF�IK; �)�Wr�d�i�f�#�9��랃��7z�RC���r�2It�N�"(�;��d�J��_)��G�BQYZ����+�ɂ0�NJ"Z���U8�?���p.J�s%��%�����S���-au~���G����cm�Z��?G�i*(�Z@_�!_��p��l~����[��-"�n��O�ӈ���Tt����Fv�v�ύI,���bD^�/�!q~-�NE\�����M���2�0m]���g�DL�ڛ���{F)yL	�����z�Mi����s�-�����%�I��}Ed��Y�<�E�v~H6\�P�4ԋK�K����n3�cSr2P6�����b�d.�nkLC]
���"׭Wrz����̾�5���0�t{��ԍ'��g來����rg �<�e�Iu�2��%b�r�q�������	]��?�%�ijaѿ����������LI٠�Sd�$dG@�8S�d��#ǵ�":8�<�JE�'�;�oݞ��$_Ek����r0�n�'=��n����)����aCk�NG�o��Z�O���U��ݬ!��e?�}'�۱�-�ñ~h�P���(��\7[n:6^�$a/�]=(�=��,��YEH��fݷ���ֶq���T�)s�*�D�~Ũ2m��$���Tê�h��̖0\����2�'uߧ�V����c�Yl�='�ď���*<�����#6K�*q{����@�ʆ#��xfW�ˏxdW�K64��c���ʞ���X}x�?5�����BQ�N� ��6/6��
yN�l��`�0؉E�����C���#X|p�]����LZ�98�y?q�X��H��#e��~j��T�d>��`򳢯�a�c�I�.�����LɃ�ߗC�I�2zm��]x�r��p��|<,ѥi�ɿӑ&Q�����> ���� �  �֓W��%���Q�KMOIMBb�n�՛X����O�?_ǹ;��O�i��+���+���B����u�r#��8���ʜ��2;��J���&)OR�8���tx��P'��g!�j������j�j9���;|��gk��m��ױǣ*.�v礟<�����-����ڒ�fۯlpo�zM�K��ޗf$H�ЊU>����+�|�Ҫ��r�
t�x�3O�����~�^/IB���u��G{�^��3�n�֬k������\�3��֡�'���Ө�/��:ޤ�$<-�B}���R�.oZpW���nJ�I���~+>Xi�Mj�Ri �|�l�Vu�c����:=LOA��1���ſS-�M:�T��P����R����0�S���1�	J����qK���D����l����ӫ�4<�I�p�!	v:��<%�o��;�P��+<�j
�uͶ�89� �r��#�&d[F�Y�OZ�TRr굕D�����u�Q�Pt�7`/�&��W�4�!�����WcW9��?�ב�C��Io��"���w�X�ݓ��G#%R�Dd�%O��k$�)�2�|9�t)%�E��/%g��7����D��yb��2>n��oN/nd�-�qχ��O��?^g���T��)NY�s�	2:���Yu�2��N�:K��]��G[�XP�$��4�k��s=y'���)�P���� ��*U���"� ��1�����J���ҋz�E߄,C�l�ߴ� ���S+�ł	�q��
|q!���w^�F��o$Bp���Ł*�_'z���1j:�4D��v�lL(
�0g�]�Ą/%+UBA �5�[7�G�?/�a~]?�
>�_&��fX�6�r�6�\��@�Dܬd��?_ 8['&�uWZ��� �GV&m&�x�h���A�!���?�C�T�ᬜ�"�9%ֵ����D�I&3�*:vI�����_~�?y��      2      x������ � �      4   $   x�3�t����M�L�2�t,JO�+��K����� {��      6      x������ � �      8     x�]�Mn1���)t������rb�m��p#�l��`˘�b�h��M�YdQ�s�Rt������Gr&��E��d�Qu�'�g(�HM:/�����g��ҷ��Ä�������j�=�pO&��C��a��Lg�,���E&�a�������u�a8�0ރ�OB� �nx�$:��)�$�Jb7�8��A�nq��5N�í�e��`�?��<���(m�=��N�d0/`E�:<JU	��:=�	Upg���|�	�MU;��^�*����5�)O���S#��X��v����m�Ѫρ�3�&���6[�7�.�8߫��C>*xf[�qX�I��{�Db/Z�x��	R6�8�OR��!X��Y����'���wg�.U��E��b����y�S��xLji6�JY�tn�&ٲ��,S��F	������iG��mo�W����4��D�ĒF�j�û��5�7�����$*���`T2)鳿kB��`Mu��'��ښP� ���x����h5*�~�-����e�=���}4�i�d      :      x������ � �      <     x���]j ���S�.󭳇�	�qF�K�zj6��ihAD���ftNե�x�&cP�Dj{��6�p��(S(�>z�la�SzB�n�<<�e@�Ņ��7�'�;������8&�. ����������w�n&j��9�b�`6��Y�iS35�*�q�౻I��U�<$E�4ܕf��M�\#�̸j�
��@"�ø�ѓ8����C�_�?rz#�M���Qc��dS�i�Z�-[{_�+�a���lX�p���f�\�ӣ�ӻi��R�֟�&��W�������0O7��q��}��G�^:�H�c�tv�C��g��J�[�|6۴#c�ySJg��$yQ����;��w�?�gJ��?r��.o����z�'�N     