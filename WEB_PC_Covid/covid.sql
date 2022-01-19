--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-01-19 21:20:28

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 16995)
-- Name: Account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Account" (
    "Id" integer NOT NULL,
    "Username" character varying(50) NOT NULL,
    "Password" character varying(100) NOT NULL,
    "Role" integer NOT NULL,
    "LockUp" integer NOT NULL,
    "FirstActive" integer
);


ALTER TABLE public."Account" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16998)
-- Name: Account_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Account" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Account_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 16999)
-- Name: Consume; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Consume" (
    "Id" integer NOT NULL,
    "IdUser" integer NOT NULL,
    "IdPackage" integer NOT NULL,
    "Time" timestamp with time zone NOT NULL,
    "CreditLimit" integer NOT NULL,
    "Status" character varying(100) DEFAULT 'Chưa thanh toán'::character varying
);


ALTER TABLE public."Consume" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17002)
-- Name: Consume_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Consume" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Consume_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 213 (class 1259 OID 17003)
-- Name: District; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."District" (
    "Id" integer NOT NULL,
    "NameDistrict" character varying(50) NOT NULL
);


ALTER TABLE public."District" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17006)
-- Name: DistrictWard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DistrictWard" (
    "Id" integer NOT NULL,
    "IdDistrict" integer NOT NULL,
    "IdWard" integer NOT NULL
);


ALTER TABLE public."DistrictWard" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17009)
-- Name: DistrictWard_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."DistrictWard" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."DistrictWard_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 17010)
-- Name: District_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."District" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."District_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 17011)
-- Name: HistoryManager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HistoryManager" (
    "IdHistory" integer NOT NULL,
    "IdManager" integer NOT NULL,
    "TimeStart" timestamp with time zone NOT NULL,
    "TimeEnd" timestamp with time zone NOT NULL
);


ALTER TABLE public."HistoryManager" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17014)
-- Name: HistoryManager_IdHistory_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."HistoryManager" ALTER COLUMN "IdHistory" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."HistoryManager_IdHistory_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 17015)
-- Name: HistoryUser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HistoryUser" (
    "Id" integer NOT NULL,
    "IdUser" integer NOT NULL,
    "TimeStart" timestamp without time zone NOT NULL,
    "TimeEnd" timestamp without time zone,
    "Status" integer NOT NULL,
    "Place" character varying NOT NULL
);


ALTER TABLE public."HistoryUser" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17020)
-- Name: HistoryUser_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."HistoryUser" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."HistoryUser_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 17021)
-- Name: ManagerActivity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ManagerActivity" (
    "Id" integer NOT NULL,
    "IdHistoryManager" integer NOT NULL,
    "Activity" character varying(100) NOT NULL
);


ALTER TABLE public."ManagerActivity" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17024)
-- Name: Package; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Package" (
    "Id" integer NOT NULL,
    "NamePackage" character varying(50) NOT NULL,
    "LimitProducts" integer NOT NULL,
    "LimitPeople" integer NOT NULL,
    "LimitTime" integer NOT NULL,
    "Introduce" character varying(1000)
);


ALTER TABLE public."Package" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17029)
-- Name: Package_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Package" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Package_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 17030)
-- Name: Place; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Place" (
    "Id" integer NOT NULL,
    "NamePlace" character varying(50) NOT NULL,
    "Size" integer NOT NULL,
    "Amount" integer NOT NULL,
    "Role" integer NOT NULL
);


ALTER TABLE public."Place" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17033)
-- Name: Place_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Place" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Place_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 17034)
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    "Id" integer NOT NULL,
    "Price" integer NOT NULL,
    "NameProduct" character varying(50) NOT NULL,
    "Unit" character varying(50) NOT NULL
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17037)
-- Name: ProductImg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductImg" (
    "Id" integer NOT NULL,
    "IdProduct" integer NOT NULL,
    "Img" character varying(100) NOT NULL
);


ALTER TABLE public."ProductImg" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17040)
-- Name: ProductImg_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."ProductImg" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ProductImg_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 17041)
-- Name: ProductPackage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductPackage" (
    "Id" integer NOT NULL,
    "IdPackage" integer NOT NULL,
    "IdProduct" integer NOT NULL
);


ALTER TABLE public."ProductPackage" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17044)
-- Name: ProductPackage_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."ProductPackage" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ProductPackage_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 17045)
-- Name: Product_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Product" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Product_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 17046)
-- Name: Province; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Province" (
    "Id" integer NOT NULL,
    "NameProvince" character varying(50) NOT NULL
);


ALTER TABLE public."Province" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17049)
-- Name: ProvinceDistrict; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProvinceDistrict" (
    "Id" integer NOT NULL,
    "IdProvince" integer NOT NULL,
    "IdDistrict" integer NOT NULL
);


ALTER TABLE public."ProvinceDistrict" OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17052)
-- Name: ProvinceDistrict_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."ProvinceDistrict" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."ProvinceDistrict_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 235 (class 1259 OID 17053)
-- Name: Province_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Province" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Province_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 17054)
-- Name: RelatedPeople; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RelatedPeople" (
    "Id" integer NOT NULL,
    "IdUser" integer NOT NULL,
    "IdRelatedUser" integer NOT NULL
);


ALTER TABLE public."RelatedPeople" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 17057)
-- Name: RelatedPeople_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."RelatedPeople" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."RelatedPeople_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 17058)
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    "Id" integer NOT NULL,
    "Name" character varying(50) NOT NULL,
    "Year" integer NOT NULL,
    "Address" integer NOT NULL,
    "Status" integer NOT NULL,
    "Debt" integer NOT NULL,
    "Inform" integer DEFAULT 0 NOT NULL,
    "IdNumber" character varying(50) NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17062)
-- Name: UserPlace; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserPlace" (
    "Id" integer NOT NULL,
    "IdUser" integer NOT NULL,
    "IdPlace" integer NOT NULL
);


ALTER TABLE public."UserPlace" OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 17065)
-- Name: UserPlace_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."UserPlace" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."UserPlace_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 241 (class 1259 OID 17066)
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."User" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."User_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 242 (class 1259 OID 17067)
-- Name: Ward; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ward" (
    "Id" integer NOT NULL,
    "NameWard" character varying(50) NOT NULL
);


ALTER TABLE public."Ward" OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 17070)
-- Name: Ward_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Ward" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Ward_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3443 (class 0 OID 16995)
-- Dependencies: 209
-- Data for Name: Account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Account" ("Id", "Username", "Password", "Role", "LockUp", "FirstActive") FROM stdin;
\.


--
-- TOC entry 3445 (class 0 OID 16999)
-- Dependencies: 211
-- Data for Name: Consume; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Consume" ("Id", "IdUser", "IdPackage", "Time", "CreditLimit", "Status") FROM stdin;
\.


--
-- TOC entry 3447 (class 0 OID 17003)
-- Dependencies: 213
-- Data for Name: District; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."District" ("Id", "NameDistrict") FROM stdin;
1	Minh Long
2	Sơn Tây
3	Tư Nghĩa
4	Sơn Tịnh
5	Trà Bồng
6	Đại Lộc
7	Duy Xuyên
8	Quế Sơn
9	Phước Sơn
10	Hiệp Đức
11	Đồng Phú
12	Bù Đăng
13	TP. Đồng Xoài
14	Thị xã Phước Long
15	Phú Riềng
16	TP Thủ Dầu Một
17	Bàu Bàng
18	Phú Giáo
19	TP Dĩ An
20	Tân Uyên
21	Vạn Ninh
22	Ninh Hòa
23	Diên Khánh
24	Diên Hồng
25	’Cam Đức
\.


--
-- TOC entry 3448 (class 0 OID 17006)
-- Dependencies: 214
-- Data for Name: DistrictWard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DistrictWard" ("Id", "IdDistrict", "IdWard") FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	2	6
7	2	7
8	2	8
9	2	9
10	2	10
11	3	11
12	3	12
13	3	13
14	3	14
15	3	15
16	4	16
17	4	17
18	4	18
19	4	19
20	4	20
21	5	21
22	5	22
23	5	23
24	5	24
25	5	25
26	6	26
27	6	27
28	6	28
29	6	29
30	6	30
31	7	31
32	7	32
33	7	33
34	7	34
35	7	35
36	8	36
37	8	37
38	8	38
39	8	39
40	8	40
41	9	41
42	9	42
43	9	43
44	9	44
45	9	45
46	10	46
47	10	47
48	10	48
49	10	49
50	10	50
51	11	51
52	11	52
53	11	53
54	11	54
55	11	55
56	12	56
57	12	57
58	12	58
59	12	59
60	12	60
61	13	61
62	13	62
63	13	63
64	13	64
65	13	65
66	14	66
67	14	67
68	14	68
69	14	69
70	14	70
71	15	71
72	15	72
73	15	73
74	15	74
75	15	75
76	16	76
77	16	77
78	16	78
79	16	79
80	16	80
81	17	81
82	17	82
83	17	83
84	17	84
85	17	85
86	18	86
87	18	87
88	18	88
89	18	89
90	18	90
91	19	91
92	19	92
93	19	93
94	19	94
95	19	95
96	20	96
97	20	97
98	20	98
99	20	99
100	20	100
101	21	101
102	21	102
103	21	103
104	21	104
105	21	105
106	22	106
107	22	107
108	22	108
109	22	109
110	22	110
111	23	111
112	23	112
113	23	113
114	23	114
115	23	115
116	24	116
117	24	117
118	24	118
119	24	119
120	24	120
121	25	121
122	25	122
123	25	123
124	25	124
125	25	125
\.


--
-- TOC entry 3451 (class 0 OID 17011)
-- Dependencies: 217
-- Data for Name: HistoryManager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."HistoryManager" ("IdHistory", "IdManager", "TimeStart", "TimeEnd") FROM stdin;
\.


--
-- TOC entry 3453 (class 0 OID 17015)
-- Dependencies: 219
-- Data for Name: HistoryUser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."HistoryUser" ("Id", "IdUser", "TimeStart", "TimeEnd", "Status", "Place") FROM stdin;
\.


--
-- TOC entry 3455 (class 0 OID 17021)
-- Dependencies: 221
-- Data for Name: ManagerActivity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ManagerActivity" ("Id", "IdHistoryManager", "Activity") FROM stdin;
\.


--
-- TOC entry 3456 (class 0 OID 17024)
-- Dependencies: 222
-- Data for Name: Package; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Package" ("Id", "NamePackage", "LimitProducts", "LimitPeople", "LimitTime", "Introduce") FROM stdin;
1	Gói 1	1	1	15	\N
2	Gói 2	1	1	15	\N
3	Gói 3	1	1	15	\N
4	Gói 4	1	1	15	\N
\.


--
-- TOC entry 3458 (class 0 OID 17030)
-- Dependencies: 224
-- Data for Name: Place; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") FROM stdin;
2	Bệnh viện Chợ Rẫy	10000	8345	1
3	Bệnh viện Đa Khoa	9500	2060	1
4	Thuận Kiều Plaza	20000	20000	0
5	Bệnh viện đại học Y Dược tpHCM	23000	15000	1
6	Trường Cao đẳng Đường sắt	27000	26000	0
7	Bệnh viện 22-12	18000	15000	1
8	Kim cương xanh	14700	9999	0
9	Bệnh viện Phạm Ngọc Thạch	22000	20000	1
10	Đồng Hương 5 sao	5000	4000	0
11	A&EM Art Hotel	1000	1000	0
1	Bệnh viện dã chiến Củ Chi	15000	12003	1
\.


--
-- TOC entry 3460 (class 0 OID 17034)
-- Dependencies: 226
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" ("Id", "Price", "NameProduct", "Unit") FROM stdin;
1	129000	thịt heo	kg
2	130000	cá thu	kg
3	9000	Bắp cải trắng	kg
4	8000	Rau muống	kg
5	28000	Rau thơm	kg
6	15000	Rau sống	kg
7	45000	Ớt sừng đỏ	kg
8	13000	Khổ qua	kg
9	8000	Đu đủ xanh	kg
10	9000	Củ cải trắng	kg
11	50000	trái cây các loại	giỏ
12	2000	trứng gà	quả
13	11000	trứng cút	hộp
14	40000	Bánh kẹo	kg
15	4500	muối i-ốt	kg
16	7000	bột nêm	gói
17	19500	nước mắm Chinsu	chai
18	6000	nước tương Tam Thái Tử	chai
19	13000	đường trắng	kg
20	100000	dầu ăn	bình
21	25000	gạo	kg
22	106000	Mỳ gói Hảo Hảo	thùng
23	30000	khẩu trang y tế	hộp
24	69000	Nước rửa tay Lifebuoy chai 500g	chai
25	155000	Chai xịt khử mùi	chai
26	34000	Kem đánh răng Colgate	hộp
27	35000	giấy vệ sinh	bịch
\.


--
-- TOC entry 3461 (class 0 OID 17037)
-- Dependencies: 227
-- Data for Name: ProductImg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProductImg" ("Id", "IdProduct", "Img") FROM stdin;
1	1	thit_heo_1.jpg
2	1	thit_heo_2.jpg
3	1	thit_heo_3.jpg
4	2	ca_thu_1.jpg
5	2	ca_thu_2.jpg
6	2	ca_thu_3.jpg
7	3	bap_cai_trang_1.jpg
8	3	bap_cai_trang_2.jpg
9	3	bap_cai_trang_3.jpg
10	4	rau_muong_1.jpg
11	4	rau_muong_2.jpg
12	5	rau_thom_1.jpg
13	5	rau_thom_2.jpg
14	6	rau_song_1.jpg
15	6	rau_song_2.jpg
16	7	ot_sung_do_1.jpg
17	7	ot_sung_do_2.jpg
18	8	kho_qua_1.jpg
19	8	kho_qua_2.jpg
20	9	du_du_xanh_1.jpg
21	9	du_du_xanh_2.jpg
22	10	cu_cai_trang_1.jpg
23	10	cu_cai_trang_2.jpg
24	11	trai_cay_1.jpg
25	11	trai_cay_2.jpg
26	12	trung_ga_1.jpg
27	12	trung_ga_2.jpg
28	13	trung_cut_1.jpg
29	13	trung_cut_2.jpg
30	14	banh_keo_1.jpg
31	14	banh_keo_2.jpg
32	15	muoi_iot_1.jpg
33	15	muoi_iot_2.jpg
34	16	bot_nem_1.jpg
35	16	bot_nem_2.jpg
36	17	chinsu_1.jpg
37	17	chinsu_1.jpg
38	18	nuoc_tuong_1.jpg
39	18	nuoc_tuong_2.jpg
40	19	duong_trang_1.jpg
41	19	duong_trang_2.jpg
42	20	dau_an_1.jpg
43	20	dau_an_2.jpg
44	21	gao_1.jpg
45	21	gao_2.jpg
46	22	my_goi_1.jpg
47	22	my_goi_2.jpg
48	23	khau_trang_1.jpg
49	23	khau_trang_2.jpg
50	24	nuoc_rua_tay_1.jpg
51	24	nuoc_rua_tay_2.jpg
52	25	xit_khu_mui_1.jpg
53	25	xit_khu_mui_2.jpg
54	26	colgate_1.jpg
55	26	colgate_2.jpg
56	27	giay_ve_sinh_1.jpg
57	27	giay_ve_sinh_2.jpg
\.


--
-- TOC entry 3463 (class 0 OID 17041)
-- Dependencies: 229
-- Data for Name: ProductPackage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProductPackage" ("Id", "IdPackage", "IdProduct") FROM stdin;
1	1	1
2	1	2
3	1	6
4	1	11
5	1	12
6	1	17
7	1	18
8	1	21
9	1	23
10	1	24
11	2	1
12	2	5
13	2	6
14	2	7
15	2	12
16	2	17
17	2	22
18	2	25
19	2	26
20	2	27
21	3	2
22	3	9
23	3	10
24	3	11
25	3	13
26	3	14
27	3	20
28	3	21
29	3	24
30	3	25
31	4	1
32	4	11
33	4	12
34	4	13
35	4	15
36	4	16
37	4	19
38	4	20
39	4	21
40	4	22
41	4	26
42	4	27
\.


--
-- TOC entry 3466 (class 0 OID 17046)
-- Dependencies: 232
-- Data for Name: Province; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Province" ("Id", "NameProvince") FROM stdin;
1	Quảng Ngãi
2	Quảng Nam
3	Bình Phước
4	Bình Dương
5	Khánh Hòa
\.


--
-- TOC entry 3467 (class 0 OID 17049)
-- Dependencies: 233
-- Data for Name: ProvinceDistrict; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	2	6
7	2	7
8	2	8
9	2	9
10	2	10
11	3	11
12	3	12
13	3	13
14	3	14
15	3	15
16	4	16
17	4	17
18	4	18
19	4	19
20	4	20
21	5	21
22	5	22
23	5	23
24	5	24
25	5	25
\.


--
-- TOC entry 3470 (class 0 OID 17054)
-- Dependencies: 236
-- Data for Name: RelatedPeople; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RelatedPeople" ("Id", "IdUser", "IdRelatedUser") FROM stdin;
\.


--
-- TOC entry 3472 (class 0 OID 17058)
-- Dependencies: 238
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" ("Id", "Name", "Year", "Address", "Status", "Debt", "Inform", "IdNumber") FROM stdin;
\.


--
-- TOC entry 3473 (class 0 OID 17062)
-- Dependencies: 239
-- Data for Name: UserPlace; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UserPlace" ("Id", "IdUser", "IdPlace") FROM stdin;
\.


--
-- TOC entry 3476 (class 0 OID 17067)
-- Dependencies: 242
-- Data for Name: Ward; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ward" ("Id", "NameWard") FROM stdin;
1	Long Hiệp
2	Long Mai
3	Long Môn
4	Long Sơn
5	Thanh An
6	Sơn Mùa
7	Sơn Liên
8	Sơn Tân
9	Sơn Màu
10	Sơn Dung
11	Nghĩa Lâm
12	Nghĩa Thắng
13	Nghĩa Thuận
14	Nghĩa Kỳ
15	Nghĩa Sơn
16	Tịnh Thọ
17	Tịnh Trà
18	Tịnh Phong
19	Tịnh Hiệp
20	Tịnh Bình
21	Trà Lâm
22	Trà Tân
23	Trà Sơn
24	Trà Bùi
25	Trà Thanh
26	Đại Sơn
27	Đại Lãnh
28	Đại Hưng
29	Đại Hồng
30	Đại Đồng
31	Duy Tân
32	Duy Hòa
33	Duy Châu
34	Duy Trinh
35	Duy Sơn
36	Quế Hiệp
37	Quế Thuận
38	Quế Mỹ
39	Quế Long
40	Quế Châu
41	Phước Xuân
42	Phước Hiệp
43	Phước Hòa
44	Phước Đức
45	Phước Năng
46	Quế Thọ
47	Bình Lâm
48	Sông Trà
49	Phước Trà
50	Phước Gia
51	Tân Tiến
52	Tân Phú
53	Tân Lập
54	Tân Hưng
55	Tân Hòa
56	Thị trấn Đức Phong
57	Bình Minh
58	BomBo
59	Minh Hưng
60	Đoàn Kết
61	Tân Phú
62	Tân Đồng
63	Tân Xuân
64	Tiến Thành
65	Tiến Hưng
66	Phước Bình
67	Long Phước
68	Sơn Giang
69	Phước Tín
70	Long Hiệp
71	Phước Tân
72	Bù Nho
73	Long Hà
74	Long Tân
75	Phú Trung
76	Hiệp Thành
77	Phú Lợi
78	Phú Cường
79	Phú Thọ
80	Chánh Nghĩa
81	Tân Hưng
82	Long Nguyên
83	Hưng Hòa
84	Lai Hưng
85	Cây Trường
86	An Thái
87	An Long
88	An Bình
89	Tân Hiệp
90	Tam Lập
91	Dĩ An
92	Tân Bình
93	Bình An
94	Bình Thắng
95	Đông Hòa
96	Tân Hiệp
97	Khánh Bình
98	Phú Chánh
99	Uyên Hưng
100	Hội Nghĩa
101	Vạn Giã
102	Vạn Phước
103	Vạn Long
104	Vạn Thắng
105	Vạn Bình
106	Ninh Đa
107	Ninh Diêm
108	Ninh Hải
109	Ninh Thủy
110	Ninh Hà
111	Diên Lâm
112	Diên Điền
113	Diên Xuân
114	Diên Sơn
115	Diên Đồng
116	Lộc Thọ
117	Ngọc Hiệp
118	Phước Hải
119	Phước Hòa
120	Phước Tân
121	Vĩnh Nguyên
122	Vĩnh Phước
123	Vĩnh Thọ
124	Vĩnh Trường
125	Xương Huân
\.


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 210
-- Name: Account_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Account_Id_seq"', 4, true);


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 212
-- Name: Consume_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Consume_Id_seq"', 1, false);


--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 215
-- Name: DistrictWard_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DistrictWard_Id_seq"', 125, true);


--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 216
-- Name: District_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."District_Id_seq"', 25, true);


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 218
-- Name: HistoryManager_IdHistory_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HistoryManager_IdHistory_seq"', 1, false);


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 220
-- Name: HistoryUser_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HistoryUser_Id_seq"', 1, true);


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 223
-- Name: Package_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Package_Id_seq"', 4, true);


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 225
-- Name: Place_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Place_Id_seq"', 11, true);


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 228
-- Name: ProductImg_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ProductImg_Id_seq"', 57, true);


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 230
-- Name: ProductPackage_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ProductPackage_Id_seq"', 42, true);


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 231
-- Name: Product_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Product_Id_seq"', 27, true);


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 234
-- Name: ProvinceDistrict_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ProvinceDistrict_Id_seq"', 25, true);


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 235
-- Name: Province_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Province_Id_seq"', 5, true);


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 237
-- Name: RelatedPeople_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RelatedPeople_Id_seq"', 1, false);


--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 240
-- Name: UserPlace_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."UserPlace_Id_seq"', 3, true);


--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 241
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, false);


--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 243
-- Name: Ward_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ward_Id_seq"', 125, true);


--
-- TOC entry 3251 (class 2606 OID 17072)
-- Name: Account Account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3253 (class 2606 OID 17074)
-- Name: Consume Consume_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Consume"
    ADD CONSTRAINT "Consume_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3257 (class 2606 OID 17076)
-- Name: DistrictWard DistrictWard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DistrictWard"
    ADD CONSTRAINT "DistrictWard_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3255 (class 2606 OID 17078)
-- Name: District District_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."District"
    ADD CONSTRAINT "District_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3259 (class 2606 OID 17080)
-- Name: HistoryManager HistoryManager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistoryManager"
    ADD CONSTRAINT "HistoryManager_pkey" PRIMARY KEY ("IdHistory");


--
-- TOC entry 3261 (class 2606 OID 17082)
-- Name: HistoryUser HistoryUser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistoryUser"
    ADD CONSTRAINT "HistoryUser_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3263 (class 2606 OID 17084)
-- Name: ManagerActivity ManagerActivity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ManagerActivity"
    ADD CONSTRAINT "ManagerActivity_pkey" PRIMARY KEY ("IdHistoryManager");


--
-- TOC entry 3266 (class 2606 OID 17086)
-- Name: Package Package_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Package"
    ADD CONSTRAINT "Package_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3268 (class 2606 OID 17088)
-- Name: Place Place_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Place"
    ADD CONSTRAINT "Place_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3272 (class 2606 OID 17090)
-- Name: ProductImg ProductImg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductImg"
    ADD CONSTRAINT "ProductImg_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3274 (class 2606 OID 17092)
-- Name: ProductPackage ProductPackage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductPackage"
    ADD CONSTRAINT "ProductPackage_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3270 (class 2606 OID 17094)
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3278 (class 2606 OID 17096)
-- Name: ProvinceDistrict ProvinceDistrict_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProvinceDistrict"
    ADD CONSTRAINT "ProvinceDistrict_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3276 (class 2606 OID 17098)
-- Name: Province Province_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Province"
    ADD CONSTRAINT "Province_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3280 (class 2606 OID 17100)
-- Name: RelatedPeople RelatedPeople_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RelatedPeople"
    ADD CONSTRAINT "RelatedPeople_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3284 (class 2606 OID 17102)
-- Name: UserPlace UserPlace_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserPlace"
    ADD CONSTRAINT "UserPlace_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3282 (class 2606 OID 17104)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3286 (class 2606 OID 17106)
-- Name: Ward Ward_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ward"
    ADD CONSTRAINT "Ward_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3264 (class 1259 OID 17107)
-- Name: fki_ID_ManagerActivity_HistoryManager; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_ID_ManagerActivity_HistoryManager" ON public."ManagerActivity" USING btree ("IdHistoryManager");


--
-- TOC entry 3292 (class 2606 OID 17108)
-- Name: HistoryUser HistoryUser_IdUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistoryUser"
    ADD CONSTRAINT "HistoryUser_IdUser_fkey" FOREIGN KEY ("IdUser") REFERENCES public."User"("Id") NOT VALID;


--
-- TOC entry 3289 (class 2606 OID 17113)
-- Name: DistrictWard IDDistrict_DistrictWard_District; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DistrictWard"
    ADD CONSTRAINT "IDDistrict_DistrictWard_District" FOREIGN KEY ("IdDistrict") REFERENCES public."District"("Id") NOT VALID;


--
-- TOC entry 3297 (class 2606 OID 17118)
-- Name: ProvinceDistrict IDDistrict_ProvinceDistrict_District; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProvinceDistrict"
    ADD CONSTRAINT "IDDistrict_ProvinceDistrict_District" FOREIGN KEY ("IdDistrict") REFERENCES public."District"("Id") NOT VALID;


--
-- TOC entry 3287 (class 2606 OID 17123)
-- Name: Consume IDPackage_Consume_Package; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Consume"
    ADD CONSTRAINT "IDPackage_Consume_Package" FOREIGN KEY ("IdPackage") REFERENCES public."Package"("Id") NOT VALID;


--
-- TOC entry 3295 (class 2606 OID 17128)
-- Name: ProductPackage IDPackage_ProductPackage_Package; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductPackage"
    ADD CONSTRAINT "IDPackage_ProductPackage_Package" FOREIGN KEY ("IdPackage") REFERENCES public."Package"("Id") NOT VALID;


--
-- TOC entry 3302 (class 2606 OID 17133)
-- Name: UserPlace IDPlace_UserPlace_Place; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserPlace"
    ADD CONSTRAINT "IDPlace_UserPlace_Place" FOREIGN KEY ("IdPlace") REFERENCES public."Place"("Id") NOT VALID;


--
-- TOC entry 3294 (class 2606 OID 17138)
-- Name: ProductImg IDProduct_ProductImg_Product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductImg"
    ADD CONSTRAINT "IDProduct_ProductImg_Product" FOREIGN KEY ("IdProduct") REFERENCES public."Product"("Id") NOT VALID;


--
-- TOC entry 3296 (class 2606 OID 17143)
-- Name: ProductPackage IDProduct_ProductPackage_Product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductPackage"
    ADD CONSTRAINT "IDProduct_ProductPackage_Product" FOREIGN KEY ("IdProduct") REFERENCES public."Product"("Id") NOT VALID;


--
-- TOC entry 3298 (class 2606 OID 17148)
-- Name: ProvinceDistrict IDProvince_ProvinceDistrict_Province; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProvinceDistrict"
    ADD CONSTRAINT "IDProvince_ProvinceDistrict_Province" FOREIGN KEY ("IdProvince") REFERENCES public."Province"("Id") NOT VALID;


--
-- TOC entry 3299 (class 2606 OID 17153)
-- Name: RelatedPeople IDRelated_Related_User; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RelatedPeople"
    ADD CONSTRAINT "IDRelated_Related_User" FOREIGN KEY ("IdRelatedUser") REFERENCES public."User"("Id") NOT VALID;


--
-- TOC entry 3288 (class 2606 OID 17158)
-- Name: Consume IDUser_Consume_User; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Consume"
    ADD CONSTRAINT "IDUser_Consume_User" FOREIGN KEY ("IdUser") REFERENCES public."User"("Id") NOT VALID;


--
-- TOC entry 3300 (class 2606 OID 17163)
-- Name: RelatedPeople IDUser_Related_User; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RelatedPeople"
    ADD CONSTRAINT "IDUser_Related_User" FOREIGN KEY ("IdUser") REFERENCES public."User"("Id") NOT VALID;


--
-- TOC entry 3303 (class 2606 OID 17168)
-- Name: UserPlace IDUser_UserPlace_User; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserPlace"
    ADD CONSTRAINT "IDUser_UserPlace_User" FOREIGN KEY ("IdUser") REFERENCES public."User"("Id") NOT VALID;


--
-- TOC entry 3290 (class 2606 OID 17173)
-- Name: DistrictWard IDWard_DistrictWard_Ward; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DistrictWard"
    ADD CONSTRAINT "IDWard_DistrictWard_Ward" FOREIGN KEY ("IdWard") REFERENCES public."Ward"("Id") NOT VALID;


--
-- TOC entry 3291 (class 2606 OID 17178)
-- Name: HistoryManager ID_HistoryManager_Account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistoryManager"
    ADD CONSTRAINT "ID_HistoryManager_Account" FOREIGN KEY ("IdManager") REFERENCES public."Account"("Id") NOT VALID;


--
-- TOC entry 3293 (class 2606 OID 17183)
-- Name: ManagerActivity ID_ManagerActivity_HistoryManager; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ManagerActivity"
    ADD CONSTRAINT "ID_ManagerActivity_HistoryManager" FOREIGN KEY ("IdHistoryManager") REFERENCES public."HistoryManager"("IdHistory") NOT VALID;


--
-- TOC entry 3301 (class 2606 OID 17188)
-- Name: User Id_User_Account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "Id_User_Account" FOREIGN KEY ("Id") REFERENCES public."Account"("Id") NOT VALID;


-- Completed on 2022-01-19 21:20:29

--
-- PostgreSQL database dump complete
--

