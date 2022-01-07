--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-01-07 11:12:49

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
-- TOC entry 209 (class 1259 OID 16765)
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
-- TOC entry 210 (class 1259 OID 16768)
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
-- TOC entry 211 (class 1259 OID 16769)
-- Name: Consume; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Consume" (
    "Id" integer NOT NULL,
    "IdUser" integer NOT NULL,
    "IdPackage" integer NOT NULL,
    "Time" timestamp with time zone NOT NULL
);


ALTER TABLE public."Consume" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16772)
-- Name: District; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."District" (
    "Id" integer NOT NULL,
    "NameDistrict" character varying(50) NOT NULL
);


ALTER TABLE public."District" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16775)
-- Name: DistrictWard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DistrictWard" (
    "Id" integer NOT NULL,
    "IdDistrict" integer NOT NULL,
    "IdWard" integer NOT NULL
);


ALTER TABLE public."DistrictWard" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16778)
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
-- TOC entry 215 (class 1259 OID 16779)
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
-- TOC entry 216 (class 1259 OID 16780)
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
-- TOC entry 217 (class 1259 OID 16783)
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
-- TOC entry 242 (class 1259 OID 16970)
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
-- TOC entry 241 (class 1259 OID 16969)
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
-- TOC entry 218 (class 1259 OID 16784)
-- Name: ManagerActivity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ManagerActivity" (
    "Id" integer NOT NULL,
    "IdHistoryManager" integer NOT NULL,
    "Activity" character varying(100) NOT NULL
);


ALTER TABLE public."ManagerActivity" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16787)
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
-- TOC entry 220 (class 1259 OID 16792)
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
-- TOC entry 221 (class 1259 OID 16793)
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
-- TOC entry 222 (class 1259 OID 16796)
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
-- TOC entry 223 (class 1259 OID 16797)
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
-- TOC entry 224 (class 1259 OID 16800)
-- Name: ProductImg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductImg" (
    "Id" integer NOT NULL,
    "IdProduct" integer NOT NULL,
    "Img" character varying(100) NOT NULL
);


ALTER TABLE public."ProductImg" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16803)
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
-- TOC entry 226 (class 1259 OID 16804)
-- Name: ProductPackage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductPackage" (
    "Id" integer NOT NULL,
    "IdPackage" integer NOT NULL,
    "IdProduct" integer NOT NULL
);


ALTER TABLE public."ProductPackage" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16807)
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
-- TOC entry 228 (class 1259 OID 16808)
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
-- TOC entry 229 (class 1259 OID 16809)
-- Name: Province; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Province" (
    "Id" integer NOT NULL,
    "NameProvince" character varying(50) NOT NULL
);


ALTER TABLE public."Province" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16812)
-- Name: ProvinceDistrict; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProvinceDistrict" (
    "Id" integer NOT NULL,
    "IdProvince" integer NOT NULL,
    "IdDistrict" integer NOT NULL
);


ALTER TABLE public."ProvinceDistrict" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16815)
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
-- TOC entry 232 (class 1259 OID 16816)
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
-- TOC entry 233 (class 1259 OID 16817)
-- Name: RelatedPeople; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RelatedPeople" (
    "Id" integer NOT NULL,
    "IdUser" integer NOT NULL,
    "IdRelatedUser" integer NOT NULL
);


ALTER TABLE public."RelatedPeople" OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16820)
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
-- TOC entry 235 (class 1259 OID 16821)
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
-- TOC entry 236 (class 1259 OID 16825)
-- Name: UserPlace; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserPlace" (
    "Id" integer NOT NULL,
    "IdUser" integer NOT NULL,
    "IdPlace" integer NOT NULL
);


ALTER TABLE public."UserPlace" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16828)
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
-- TOC entry 238 (class 1259 OID 16829)
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
-- TOC entry 239 (class 1259 OID 16830)
-- Name: Ward; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ward" (
    "Id" integer NOT NULL,
    "NameWard" character varying(50) NOT NULL
);


ALTER TABLE public."Ward" OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16833)
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
-- TOC entry 3441 (class 0 OID 16765)
-- Dependencies: 209
-- Data for Name: Account; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3443 (class 0 OID 16769)
-- Dependencies: 211
-- Data for Name: Consume; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3444 (class 0 OID 16772)
-- Dependencies: 212
-- Data for Name: District; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (1, 'Minh Long');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (2, 'Sơn Tây');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (3, 'Tư Nghĩa');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (4, 'Sơn Tịnh');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (5, 'Trà Bồng');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (6, 'Đại Lộc');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (7, 'Duy Xuyên');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (8, 'Quế Sơn');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (9, 'Phước Sơn');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (10, 'Hiệp Đức');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (11, 'Đồng Phú');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (12, 'Bù Đăng');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (13, 'TP. Đồng Xoài');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (14, 'Thị xã Phước Long');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (15, 'Phú Riềng');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (16, 'TP Thủ Dầu Một');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (17, 'Bàu Bàng');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (18, 'Phú Giáo');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (19, 'TP Dĩ An');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (20, 'Tân Uyên');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (21, 'Vạn Ninh');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (22, 'Ninh Hòa');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (23, 'Diên Khánh');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (24, 'Diên Hồng');
INSERT INTO public."District" ("Id", "NameDistrict") OVERRIDING SYSTEM VALUE VALUES (25, '’Cam Đức');


--
-- TOC entry 3445 (class 0 OID 16775)
-- Dependencies: 213
-- Data for Name: DistrictWard; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (1, 1, 1);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (2, 1, 2);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (3, 1, 3);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (4, 1, 4);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (5, 1, 5);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (6, 2, 6);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (7, 2, 7);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (8, 2, 8);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (9, 2, 9);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (10, 2, 10);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (11, 3, 11);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (12, 3, 12);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (13, 3, 13);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (14, 3, 14);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (15, 3, 15);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (16, 4, 16);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (17, 4, 17);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (18, 4, 18);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (19, 4, 19);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (20, 4, 20);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (21, 5, 21);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (22, 5, 22);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (23, 5, 23);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (24, 5, 24);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (25, 5, 25);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (26, 6, 26);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (27, 6, 27);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (28, 6, 28);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (29, 6, 29);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (30, 6, 30);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (31, 7, 31);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (32, 7, 32);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (33, 7, 33);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (34, 7, 34);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (35, 7, 35);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (36, 8, 36);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (37, 8, 37);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (38, 8, 38);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (39, 8, 39);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (40, 8, 40);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (41, 9, 41);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (42, 9, 42);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (43, 9, 43);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (44, 9, 44);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (45, 9, 45);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (46, 10, 46);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (47, 10, 47);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (48, 10, 48);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (49, 10, 49);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (50, 10, 50);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (51, 11, 51);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (52, 11, 52);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (53, 11, 53);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (54, 11, 54);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (55, 11, 55);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (56, 12, 56);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (57, 12, 57);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (58, 12, 58);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (59, 12, 59);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (60, 12, 60);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (61, 13, 61);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (62, 13, 62);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (63, 13, 63);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (64, 13, 64);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (65, 13, 65);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (66, 14, 66);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (67, 14, 67);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (68, 14, 68);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (69, 14, 69);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (70, 14, 70);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (71, 15, 71);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (72, 15, 72);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (73, 15, 73);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (74, 15, 74);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (75, 15, 75);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (76, 16, 76);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (77, 16, 77);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (78, 16, 78);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (79, 16, 79);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (80, 16, 80);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (81, 17, 81);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (82, 17, 82);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (83, 17, 83);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (84, 17, 84);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (85, 17, 85);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (86, 18, 86);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (87, 18, 87);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (88, 18, 88);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (89, 18, 89);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (90, 18, 90);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (91, 19, 91);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (92, 19, 92);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (93, 19, 93);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (94, 19, 94);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (95, 19, 95);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (96, 20, 96);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (97, 20, 97);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (98, 20, 98);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (99, 20, 99);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (100, 20, 100);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (101, 21, 101);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (102, 21, 102);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (103, 21, 103);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (104, 21, 104);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (105, 21, 105);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (106, 22, 106);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (107, 22, 107);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (108, 22, 108);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (109, 22, 109);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (110, 22, 110);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (111, 23, 111);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (112, 23, 112);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (113, 23, 113);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (114, 23, 114);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (115, 23, 115);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (116, 24, 116);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (117, 24, 117);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (118, 24, 118);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (119, 24, 119);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (120, 24, 120);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (121, 25, 121);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (122, 25, 122);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (123, 25, 123);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (124, 25, 124);
INSERT INTO public."DistrictWard" ("Id", "IdDistrict", "IdWard") OVERRIDING SYSTEM VALUE VALUES (125, 25, 125);


--
-- TOC entry 3448 (class 0 OID 16780)
-- Dependencies: 216
-- Data for Name: HistoryManager; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3474 (class 0 OID 16970)
-- Dependencies: 242
-- Data for Name: HistoryUser; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3450 (class 0 OID 16784)
-- Dependencies: 218
-- Data for Name: ManagerActivity; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3451 (class 0 OID 16787)
-- Dependencies: 219
-- Data for Name: Package; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Package" ("Id", "NamePackage", "LimitProducts", "LimitPeople", "LimitTime", "Introduce") OVERRIDING SYSTEM VALUE VALUES (1, 'Gói 1', 1, 1, 15, NULL);
INSERT INTO public."Package" ("Id", "NamePackage", "LimitProducts", "LimitPeople", "LimitTime", "Introduce") OVERRIDING SYSTEM VALUE VALUES (2, 'Gói 2', 1, 1, 15, NULL);
INSERT INTO public."Package" ("Id", "NamePackage", "LimitProducts", "LimitPeople", "LimitTime", "Introduce") OVERRIDING SYSTEM VALUE VALUES (3, 'Gói 3', 1, 1, 15, NULL);
INSERT INTO public."Package" ("Id", "NamePackage", "LimitProducts", "LimitPeople", "LimitTime", "Introduce") OVERRIDING SYSTEM VALUE VALUES (4, 'Gói 4', 1, 1, 15, NULL);


--
-- TOC entry 3453 (class 0 OID 16793)
-- Dependencies: 221
-- Data for Name: Place; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (2, 'Bệnh viện Chợ Rẫy', 10000, 8345, 1);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (3, 'Bệnh viện Đa Khoa', 9500, 2060, 1);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (4, 'Thuận Kiều Plaza', 20000, 20000, 0);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (5, 'Bệnh viện đại học Y Dược tpHCM', 23000, 15000, 1);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (6, 'Trường Cao đẳng Đường sắt', 27000, 26000, 0);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (7, 'Bệnh viện 22-12', 18000, 15000, 1);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (8, 'Kim cương xanh', 14700, 9999, 0);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (9, 'Bệnh viện Phạm Ngọc Thạch', 22000, 20000, 1);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (10, 'Đồng Hương 5 sao', 5000, 4000, 0);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (11, 'A&EM Art Hotel', 1000, 1000, 0);
INSERT INTO public."Place" ("Id", "NamePlace", "Size", "Amount", "Role") OVERRIDING SYSTEM VALUE VALUES (1, 'Bệnh viện dã chiến Củ Chi', 15000, 12003, 1);


--
-- TOC entry 3455 (class 0 OID 16797)
-- Dependencies: 223
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (1, 129000, 'thịt heo', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (2, 130000, 'cá thu', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (3, 9000, 'Bắp cải trắng', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (4, 8000, 'Rau muống', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (5, 28000, 'Rau thơm', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (6, 15000, 'Rau sống', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (7, 45000, 'Ớt sừng đỏ', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (8, 13000, 'Khổ qua', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (9, 8000, 'Đu đủ xanh', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (10, 9000, 'Củ cải trắng', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (11, 50000, 'trái cây các loại', 'giỏ');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (12, 2000, 'trứng gà', 'quả');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (13, 11000, 'trứng cút', 'hộp');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (14, 40000, 'Bánh kẹo', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (15, 4500, 'muối i-ốt', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (16, 7000, 'bột nêm', 'gói');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (17, 19500, 'nước mắm Chinsu', 'chai');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (18, 6000, 'nước tương Tam Thái Tử', 'chai');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (19, 13000, 'đường trắng', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (20, 100000, 'dầu ăn', 'bình');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (21, 25000, 'gạo', 'kg');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (22, 106000, 'Mỳ gói Hảo Hảo', 'thùng');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (23, 30000, 'khẩu trang y tế', 'hộp');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (24, 69000, 'Nước rửa tay Lifebuoy chai 500g', 'chai');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (25, 155000, 'Chai xịt khử mùi', 'chai');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (26, 34000, 'Kem đánh răng Colgate', 'hộp');
INSERT INTO public."Product" ("Id", "Price", "NameProduct", "Unit") OVERRIDING SYSTEM VALUE VALUES (27, 35000, 'giấy vệ sinh', 'bịch');


--
-- TOC entry 3456 (class 0 OID 16800)
-- Dependencies: 224
-- Data for Name: ProductImg; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (1, 1, 'thit_heo_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (2, 1, 'thit_heo_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (3, 1, 'thit_heo_3.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (4, 2, 'ca_thu_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (5, 2, 'ca_thu_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (6, 2, 'ca_thu_3.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (7, 3, 'bap_cai_trang_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (8, 3, 'bap_cai_trang_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (9, 3, 'bap_cai_trang_3.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (10, 4, 'rau_muong_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (11, 4, 'rau_muong_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (12, 5, 'rau_thom_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (13, 5, 'rau_thom_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (14, 6, 'rau_song_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (15, 6, 'rau_song_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (16, 7, 'ot_sung_do_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (17, 7, 'ot_sung_do_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (18, 8, 'kho_qua_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (19, 8, 'kho_qua_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (20, 9, 'du_du_xanh_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (21, 9, 'du_du_xanh_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (22, 10, 'cu_cai_trang_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (23, 10, 'cu_cai_trang_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (24, 11, 'trai_cay_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (25, 11, 'trai_cay_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (26, 12, 'trung_ga_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (27, 12, 'trung_ga_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (28, 13, 'trung_cut_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (29, 13, 'trung_cut_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (30, 14, 'banh_keo_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (31, 14, 'banh_keo_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (32, 15, 'muoi_iot_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (33, 15, 'muoi_iot_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (34, 16, 'bot_nem_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (35, 16, 'bot_nem_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (36, 17, 'chinsu_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (37, 17, 'chinsu_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (38, 18, 'nuoc_tuong_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (39, 18, 'nuoc_tuong_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (40, 19, 'duong_trang_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (41, 19, 'duong_trang_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (42, 20, 'dau_an_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (43, 20, 'dau_an_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (44, 21, 'gao_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (45, 21, 'gao_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (46, 22, 'my_goi_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (47, 22, 'my_goi_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (48, 23, 'khau_trang_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (49, 23, 'khau_trang_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (50, 24, 'nuoc_rua_tay_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (51, 24, 'nuoc_rua_tay_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (52, 25, 'xit_khu_mui_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (53, 25, 'xit_khu_mui_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (54, 26, 'colgate_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (55, 26, 'colgate_2.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (56, 27, 'giay_ve_sinh_1.jpg');
INSERT INTO public."ProductImg" ("Id", "IdProduct", "Img") OVERRIDING SYSTEM VALUE VALUES (57, 27, 'giay_ve_sinh_2.jpg');


--
-- TOC entry 3458 (class 0 OID 16804)
-- Dependencies: 226
-- Data for Name: ProductPackage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (1, 1, 1);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (2, 1, 2);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (3, 1, 6);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (4, 1, 11);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (5, 1, 12);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (6, 1, 17);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (7, 1, 18);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (8, 1, 21);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (9, 1, 23);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (10, 1, 24);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (11, 2, 1);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (12, 2, 5);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (13, 2, 6);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (14, 2, 7);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (15, 2, 12);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (16, 2, 17);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (17, 2, 22);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (18, 2, 25);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (19, 2, 26);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (20, 2, 27);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (21, 3, 2);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (22, 3, 9);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (23, 3, 10);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (24, 3, 11);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (25, 3, 13);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (26, 3, 14);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (27, 3, 20);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (28, 3, 21);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (29, 3, 24);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (30, 3, 25);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (31, 4, 1);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (32, 4, 11);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (33, 4, 12);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (34, 4, 13);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (35, 4, 15);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (36, 4, 16);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (37, 4, 19);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (38, 4, 20);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (39, 4, 21);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (40, 4, 22);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (41, 4, 26);
INSERT INTO public."ProductPackage" ("Id", "IdPackage", "IdProduct") OVERRIDING SYSTEM VALUE VALUES (42, 4, 27);


--
-- TOC entry 3461 (class 0 OID 16809)
-- Dependencies: 229
-- Data for Name: Province; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Province" ("Id", "NameProvince") OVERRIDING SYSTEM VALUE VALUES (1, 'Quảng Ngãi');
INSERT INTO public."Province" ("Id", "NameProvince") OVERRIDING SYSTEM VALUE VALUES (2, 'Quảng Nam');
INSERT INTO public."Province" ("Id", "NameProvince") OVERRIDING SYSTEM VALUE VALUES (3, 'Bình Phước');
INSERT INTO public."Province" ("Id", "NameProvince") OVERRIDING SYSTEM VALUE VALUES (4, 'Bình Dương');
INSERT INTO public."Province" ("Id", "NameProvince") OVERRIDING SYSTEM VALUE VALUES (5, 'Khánh Hòa');


--
-- TOC entry 3462 (class 0 OID 16812)
-- Dependencies: 230
-- Data for Name: ProvinceDistrict; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (1, 1, 1);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (2, 1, 2);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (3, 1, 3);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (4, 1, 4);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (5, 1, 5);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (6, 2, 6);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (7, 2, 7);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (8, 2, 8);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (9, 2, 9);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (10, 2, 10);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (11, 3, 11);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (12, 3, 12);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (13, 3, 13);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (14, 3, 14);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (15, 3, 15);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (16, 4, 16);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (17, 4, 17);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (18, 4, 18);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (19, 4, 19);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (20, 4, 20);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (21, 5, 21);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (22, 5, 22);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (23, 5, 23);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (24, 5, 24);
INSERT INTO public."ProvinceDistrict" ("Id", "IdProvince", "IdDistrict") OVERRIDING SYSTEM VALUE VALUES (25, 5, 25);


--
-- TOC entry 3465 (class 0 OID 16817)
-- Dependencies: 233
-- Data for Name: RelatedPeople; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3467 (class 0 OID 16821)
-- Dependencies: 235
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3468 (class 0 OID 16825)
-- Dependencies: 236
-- Data for Name: UserPlace; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3471 (class 0 OID 16830)
-- Dependencies: 239
-- Data for Name: Ward; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (1, 'Long Hiệp');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (2, 'Long Mai');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (3, 'Long Môn');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (4, 'Long Sơn');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (5, 'Thanh An');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (6, 'Sơn Mùa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (7, 'Sơn Liên');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (8, 'Sơn Tân');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (9, 'Sơn Màu');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (10, 'Sơn Dung');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (11, 'Nghĩa Lâm');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (12, 'Nghĩa Thắng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (13, 'Nghĩa Thuận');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (14, 'Nghĩa Kỳ');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (15, 'Nghĩa Sơn');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (16, 'Tịnh Thọ');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (17, 'Tịnh Trà');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (18, 'Tịnh Phong');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (19, 'Tịnh Hiệp');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (20, 'Tịnh Bình');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (21, 'Trà Lâm');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (22, 'Trà Tân');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (23, 'Trà Sơn');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (24, 'Trà Bùi');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (25, 'Trà Thanh');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (26, 'Đại Sơn');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (27, 'Đại Lãnh');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (28, 'Đại Hưng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (29, 'Đại Hồng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (30, 'Đại Đồng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (31, 'Duy Tân');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (32, 'Duy Hòa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (33, 'Duy Châu');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (34, 'Duy Trinh');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (35, 'Duy Sơn');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (36, 'Quế Hiệp');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (37, 'Quế Thuận');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (38, 'Quế Mỹ');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (39, 'Quế Long');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (40, 'Quế Châu');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (41, 'Phước Xuân');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (42, 'Phước Hiệp');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (43, 'Phước Hòa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (44, 'Phước Đức');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (45, 'Phước Năng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (46, 'Quế Thọ');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (47, 'Bình Lâm');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (48, 'Sông Trà');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (49, 'Phước Trà');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (50, 'Phước Gia');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (51, 'Tân Tiến');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (52, 'Tân Phú');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (53, 'Tân Lập');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (54, 'Tân Hưng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (55, 'Tân Hòa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (56, 'Thị trấn Đức Phong');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (57, 'Bình Minh');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (58, 'BomBo');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (59, 'Minh Hưng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (60, 'Đoàn Kết');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (61, 'Tân Phú');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (62, 'Tân Đồng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (63, 'Tân Xuân');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (64, 'Tiến Thành');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (65, 'Tiến Hưng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (66, 'Phước Bình');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (67, 'Long Phước');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (68, 'Sơn Giang');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (69, 'Phước Tín');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (70, 'Long Hiệp');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (71, 'Phước Tân');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (72, 'Bù Nho');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (73, 'Long Hà');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (74, 'Long Tân');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (75, 'Phú Trung');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (76, 'Hiệp Thành');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (77, 'Phú Lợi');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (78, 'Phú Cường');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (79, 'Phú Thọ');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (80, 'Chánh Nghĩa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (81, 'Tân Hưng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (82, 'Long Nguyên');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (83, 'Hưng Hòa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (84, 'Lai Hưng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (85, 'Cây Trường');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (86, 'An Thái');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (87, 'An Long');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (88, 'An Bình');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (89, 'Tân Hiệp');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (90, 'Tam Lập');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (91, 'Dĩ An');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (92, 'Tân Bình');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (93, 'Bình An');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (94, 'Bình Thắng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (95, 'Đông Hòa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (96, 'Tân Hiệp');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (97, 'Khánh Bình');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (98, 'Phú Chánh');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (99, 'Uyên Hưng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (100, 'Hội Nghĩa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (101, 'Vạn Giã');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (102, 'Vạn Phước');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (103, 'Vạn Long');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (104, 'Vạn Thắng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (105, 'Vạn Bình');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (106, 'Ninh Đa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (107, 'Ninh Diêm');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (108, 'Ninh Hải');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (109, 'Ninh Thủy');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (110, 'Ninh Hà');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (111, 'Diên Lâm');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (112, 'Diên Điền');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (113, 'Diên Xuân');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (114, 'Diên Sơn');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (115, 'Diên Đồng');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (116, 'Lộc Thọ');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (117, 'Ngọc Hiệp');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (118, 'Phước Hải');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (119, 'Phước Hòa');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (120, 'Phước Tân');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (121, 'Vĩnh Nguyên');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (122, 'Vĩnh Phước');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (123, 'Vĩnh Thọ');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (124, 'Vĩnh Trường');
INSERT INTO public."Ward" ("Id", "NameWard") OVERRIDING SYSTEM VALUE VALUES (125, 'Xương Huân');


--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 210
-- Name: Account_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Account_Id_seq"', 4, true);


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 214
-- Name: DistrictWard_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DistrictWard_Id_seq"', 125, true);


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 215
-- Name: District_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."District_Id_seq"', 25, true);


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 217
-- Name: HistoryManager_IdHistory_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HistoryManager_IdHistory_seq"', 1, false);


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 241
-- Name: HistoryUser_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."HistoryUser_Id_seq"', 1, true);


--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 220
-- Name: Package_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Package_Id_seq"', 4, true);


--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 222
-- Name: Place_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Place_Id_seq"', 11, true);


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 225
-- Name: ProductImg_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ProductImg_Id_seq"', 57, true);


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 227
-- Name: ProductPackage_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ProductPackage_Id_seq"', 42, true);


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 228
-- Name: Product_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Product_Id_seq"', 27, true);


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 231
-- Name: ProvinceDistrict_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ProvinceDistrict_Id_seq"', 25, true);


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 232
-- Name: Province_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Province_Id_seq"', 5, true);


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 234
-- Name: RelatedPeople_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RelatedPeople_Id_seq"', 1, false);


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 237
-- Name: UserPlace_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."UserPlace_Id_seq"', 3, true);


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 238
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, false);


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 240
-- Name: Ward_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ward_Id_seq"', 125, true);


--
-- TOC entry 3249 (class 2606 OID 16835)
-- Name: Account Account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3251 (class 2606 OID 16837)
-- Name: Consume Consume_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Consume"
    ADD CONSTRAINT "Consume_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3255 (class 2606 OID 16839)
-- Name: DistrictWard DistrictWard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DistrictWard"
    ADD CONSTRAINT "DistrictWard_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3253 (class 2606 OID 16841)
-- Name: District District_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."District"
    ADD CONSTRAINT "District_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3257 (class 2606 OID 16843)
-- Name: HistoryManager HistoryManager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistoryManager"
    ADD CONSTRAINT "HistoryManager_pkey" PRIMARY KEY ("IdHistory");


--
-- TOC entry 3284 (class 2606 OID 16978)
-- Name: HistoryUser HistoryUser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistoryUser"
    ADD CONSTRAINT "HistoryUser_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3259 (class 2606 OID 16845)
-- Name: ManagerActivity ManagerActivity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ManagerActivity"
    ADD CONSTRAINT "ManagerActivity_pkey" PRIMARY KEY ("IdHistoryManager");


--
-- TOC entry 3262 (class 2606 OID 16847)
-- Name: Package Package_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Package"
    ADD CONSTRAINT "Package_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3264 (class 2606 OID 16849)
-- Name: Place Place_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Place"
    ADD CONSTRAINT "Place_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3268 (class 2606 OID 16851)
-- Name: ProductImg ProductImg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductImg"
    ADD CONSTRAINT "ProductImg_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3270 (class 2606 OID 16853)
-- Name: ProductPackage ProductPackage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductPackage"
    ADD CONSTRAINT "ProductPackage_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3266 (class 2606 OID 16855)
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3274 (class 2606 OID 16857)
-- Name: ProvinceDistrict ProvinceDistrict_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProvinceDistrict"
    ADD CONSTRAINT "ProvinceDistrict_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3272 (class 2606 OID 16859)
-- Name: Province Province_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Province"
    ADD CONSTRAINT "Province_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3276 (class 2606 OID 16861)
-- Name: RelatedPeople RelatedPeople_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RelatedPeople"
    ADD CONSTRAINT "RelatedPeople_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3280 (class 2606 OID 16863)
-- Name: UserPlace UserPlace_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserPlace"
    ADD CONSTRAINT "UserPlace_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3278 (class 2606 OID 16865)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3282 (class 2606 OID 16867)
-- Name: Ward Ward_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ward"
    ADD CONSTRAINT "Ward_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3260 (class 1259 OID 16868)
-- Name: fki_ID_ManagerActivity_HistoryManager; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_ID_ManagerActivity_HistoryManager" ON public."ManagerActivity" USING btree ("IdHistoryManager");


--
-- TOC entry 3301 (class 2606 OID 16979)
-- Name: HistoryUser HistoryUser_IdUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistoryUser"
    ADD CONSTRAINT "HistoryUser_IdUser_fkey" FOREIGN KEY ("IdUser") REFERENCES public."User"("Id") NOT VALID;


--
-- TOC entry 3287 (class 2606 OID 16869)
-- Name: DistrictWard IDDistrict_DistrictWard_District; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DistrictWard"
    ADD CONSTRAINT "IDDistrict_DistrictWard_District" FOREIGN KEY ("IdDistrict") REFERENCES public."District"("Id") NOT VALID;


--
-- TOC entry 3294 (class 2606 OID 16874)
-- Name: ProvinceDistrict IDDistrict_ProvinceDistrict_District; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProvinceDistrict"
    ADD CONSTRAINT "IDDistrict_ProvinceDistrict_District" FOREIGN KEY ("IdDistrict") REFERENCES public."District"("Id") NOT VALID;


--
-- TOC entry 3285 (class 2606 OID 16879)
-- Name: Consume IDPackage_Consume_Package; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Consume"
    ADD CONSTRAINT "IDPackage_Consume_Package" FOREIGN KEY ("IdPackage") REFERENCES public."Package"("Id") NOT VALID;


--
-- TOC entry 3292 (class 2606 OID 16884)
-- Name: ProductPackage IDPackage_ProductPackage_Package; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductPackage"
    ADD CONSTRAINT "IDPackage_ProductPackage_Package" FOREIGN KEY ("IdPackage") REFERENCES public."Package"("Id") NOT VALID;


--
-- TOC entry 3299 (class 2606 OID 16889)
-- Name: UserPlace IDPlace_UserPlace_Place; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserPlace"
    ADD CONSTRAINT "IDPlace_UserPlace_Place" FOREIGN KEY ("IdPlace") REFERENCES public."Place"("Id") NOT VALID;


--
-- TOC entry 3291 (class 2606 OID 16894)
-- Name: ProductImg IDProduct_ProductImg_Product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductImg"
    ADD CONSTRAINT "IDProduct_ProductImg_Product" FOREIGN KEY ("IdProduct") REFERENCES public."Product"("Id") NOT VALID;


--
-- TOC entry 3293 (class 2606 OID 16899)
-- Name: ProductPackage IDProduct_ProductPackage_Product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductPackage"
    ADD CONSTRAINT "IDProduct_ProductPackage_Product" FOREIGN KEY ("IdProduct") REFERENCES public."Product"("Id") NOT VALID;


--
-- TOC entry 3295 (class 2606 OID 16904)
-- Name: ProvinceDistrict IDProvince_ProvinceDistrict_Province; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProvinceDistrict"
    ADD CONSTRAINT "IDProvince_ProvinceDistrict_Province" FOREIGN KEY ("IdProvince") REFERENCES public."Province"("Id") NOT VALID;


--
-- TOC entry 3296 (class 2606 OID 16909)
-- Name: RelatedPeople IDRelated_Related_User; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RelatedPeople"
    ADD CONSTRAINT "IDRelated_Related_User" FOREIGN KEY ("IdRelatedUser") REFERENCES public."User"("Id") NOT VALID;


--
-- TOC entry 3286 (class 2606 OID 16914)
-- Name: Consume IDUser_Consume_User; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Consume"
    ADD CONSTRAINT "IDUser_Consume_User" FOREIGN KEY ("IdUser") REFERENCES public."User"("Id") NOT VALID;


--
-- TOC entry 3297 (class 2606 OID 16919)
-- Name: RelatedPeople IDUser_Related_User; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RelatedPeople"
    ADD CONSTRAINT "IDUser_Related_User" FOREIGN KEY ("IdUser") REFERENCES public."User"("Id") NOT VALID;


--
-- TOC entry 3300 (class 2606 OID 16924)
-- Name: UserPlace IDUser_UserPlace_User; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserPlace"
    ADD CONSTRAINT "IDUser_UserPlace_User" FOREIGN KEY ("IdUser") REFERENCES public."User"("Id") NOT VALID;


--
-- TOC entry 3288 (class 2606 OID 16929)
-- Name: DistrictWard IDWard_DistrictWard_Ward; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DistrictWard"
    ADD CONSTRAINT "IDWard_DistrictWard_Ward" FOREIGN KEY ("IdWard") REFERENCES public."Ward"("Id") NOT VALID;


--
-- TOC entry 3289 (class 2606 OID 16934)
-- Name: HistoryManager ID_HistoryManager_Account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HistoryManager"
    ADD CONSTRAINT "ID_HistoryManager_Account" FOREIGN KEY ("IdManager") REFERENCES public."Account"("Id") NOT VALID;


--
-- TOC entry 3290 (class 2606 OID 16939)
-- Name: ManagerActivity ID_ManagerActivity_HistoryManager; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ManagerActivity"
    ADD CONSTRAINT "ID_ManagerActivity_HistoryManager" FOREIGN KEY ("IdHistoryManager") REFERENCES public."HistoryManager"("IdHistory") NOT VALID;


--
-- TOC entry 3298 (class 2606 OID 16944)
-- Name: User Id_User_Account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "Id_User_Account" FOREIGN KEY ("Id") REFERENCES public."Account"("Id") NOT VALID;


-- Completed on 2022-01-07 11:12:50

--
-- PostgreSQL database dump complete
--

