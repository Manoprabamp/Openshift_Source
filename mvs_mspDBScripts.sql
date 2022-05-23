-------mvs--


CREATE DATABASE mvs
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

GRANT ALL ON DATABASE mvs TO postgres;

GRANT TEMPORARY, CONNECT ON DATABASE mvs TO PUBLIC;

GRANT CONNECT ON DATABASE mvs TO readaccess;


-------------------------------------------------
-------------------------------------------------
-- SEQUENCE: public.abis_json_id_seq

-- DROP SEQUENCE public.abis_json_id_seq;

CREATE SEQUENCE public.abis_json_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.abis_json_id_seq
    OWNER TO postgres;
-------------------------------------------------
	-- SEQUENCE: public.data_share_api_sno_seq

-- DROP SEQUENCE public.data_share_api_sno_seq;

CREATE SEQUENCE public.data_share_api_sno_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.data_share_api_sno_seq
    OWNER TO postgres;
-------------------------------------------------
	-- SEQUENCE: public.hibernate_sequence

-- DROP SEQUENCE public.hibernate_sequence;

CREATE SEQUENCE public.hibernate_sequence
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.hibernate_sequence
    OWNER TO postgres;
-------------------------------------------------
	-- SEQUENCE: public.mv_json_id_seq

-- DROP SEQUENCE public.mv_json_id_seq;

CREATE SEQUENCE public.mv_json_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.mv_json_id_seq
    OWNER TO postgres;
-------------------------------------------------
	-- SEQUENCE: public.mv_json_new_id_seq

-- DROP SEQUENCE public.mv_json_new_id_seq;

CREATE SEQUENCE public.mv_json_new_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.mv_json_new_id_seq
    OWNER TO postgres;
-------------------------------------------------
	-- SEQUENCE: public.sno_seq

-- DROP SEQUENCE public.sno_seq;

CREATE SEQUENCE public.sno_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.sno_seq
    OWNER TO postgres;





-- Table: public.abis_json

-- DROP TABLE public.abis_json;

CREATE TABLE IF NOT EXISTS public.abis_json
(
    id integer NOT NULL DEFAULT nextval('abis_json_id_seq'::regclass),
    abis_queue_json text COLLATE pg_catalog."default",
    curr_time timestamp without time zone
)

TABLESPACE pg_default;

ALTER TABLE public.abis_json
    OWNER to postgres;

GRANT ALL ON TABLE public.abis_json TO postgres;

GRANT SELECT ON TABLE public.abis_json TO readaccess;
-------------------------------------------------
-- Table: public.data_share_api

-- DROP TABLE public.data_share_api;

CREATE TABLE IF NOT EXISTS public.data_share_api
(
    sno integer NOT NULL DEFAULT nextval('data_share_api_sno_seq'::regclass),
    msg_id character varying COLLATE pg_catalog."default" NOT NULL,
    version character varying COLLATE pg_catalog."default",
    request_id character varying COLLATE pg_catalog."default",
    request_time character varying COLLATE pg_catalog."default",
    reference_id character varying COLLATE pg_catalog."default",
    reference_url character varying COLLATE pg_catalog."default",
    curr_time timestamp with time zone,
    status character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE public.data_share_api
    OWNER to postgres;

GRANT ALL ON TABLE public.data_share_api TO postgres;

GRANT SELECT ON TABLE public.data_share_api TO readaccess;
-------------------------------------------------
-- Table: public.mst_role_group

-- DROP TABLE public.mst_role_group;

CREATE TABLE IF NOT EXISTS public.mst_role_group
(
    group_id integer NOT NULL,
    group_name character varying(300) COLLATE pg_catalog."default",
    description character varying(300) COLLATE pg_catalog."default",
    activestatus character(1) COLLATE pg_catalog."default",
    entered_by character varying(12) COLLATE pg_catalog."default",
    entered_date timestamp without time zone,
    modified_by character varying(12) COLLATE pg_catalog."default",
    modified_date timestamp without time zone,
    sno integer NOT NULL,
    CONSTRAINT mst_role_group_pkey PRIMARY KEY (group_id)
)

TABLESPACE pg_default;

ALTER TABLE public.mst_role_group
    OWNER to postgres;

GRANT ALL ON TABLE public.mst_role_group TO postgres;

GRANT SELECT ON TABLE public.mst_role_group TO readaccess;
-------------------------------------------------
-- Table: public.mst_role_to_group

-- DROP TABLE public.mst_role_to_group;

CREATE TABLE IF NOT EXISTS public.mst_role_to_group
(
    sno integer NOT NULL,
    group_id integer,
    role_id character varying(10) COLLATE pg_catalog."default",
    active character(1) COLLATE pg_catalog."default",
    CONSTRAINT mst_role_to_group_pkey PRIMARY KEY (sno)
)

TABLESPACE pg_default;

ALTER TABLE public.mst_role_to_group
    OWNER to postgres;

GRANT ALL ON TABLE public.mst_role_to_group TO postgres;

GRANT SELECT ON TABLE public.mst_role_to_group TO readaccess;
-------------------------------------------------
-- Table: public.mst_rolegroup_to_user

-- DROP TABLE public.mst_rolegroup_to_user;

CREATE TABLE IF NOT EXISTS public.mst_rolegroup_to_user
(
    sno integer NOT NULL,
    role_group_id integer,
    user_id character varying(12) COLLATE pg_catalog."default",
    activestatus character(1) COLLATE pg_catalog."default",
    CONSTRAINT mst_rolegroup_to_user_pkey PRIMARY KEY (sno)
)

TABLESPACE pg_default;

ALTER TABLE public.mst_rolegroup_to_user
    OWNER to postgres;

GRANT ALL ON TABLE public.mst_rolegroup_to_user TO postgres;

GRANT SELECT ON TABLE public.mst_rolegroup_to_user TO readaccess;
-------------------------------------------------
-- Table: public.mst_roles

-- DROP TABLE public.mst_roles;

CREATE TABLE IF NOT EXISTS public.mst_roles
(
    sno integer NOT NULL,
    roleid character varying(10) COLLATE pg_catalog."default" NOT NULL,
    role_details character varying(100) COLLATE pg_catalog."default",
    entered_by character varying(100) COLLATE pg_catalog."default",
    entered_date timestamp without time zone,
    group_name character varying(50) COLLATE pg_catalog."default",
    role_name character varying(100) COLLATE pg_catalog."default",
    display_order integer,
    url character varying(50) COLLATE pg_catalog."default",
    active character(1) COLLATE pg_catalog."default",
    icon character varying(50) COLLATE pg_catalog."default",
    sub_role_name character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT mst_roles_pkey PRIMARY KEY (roleid)
)

TABLESPACE pg_default;

ALTER TABLE public.mst_roles
    OWNER to postgres;

GRANT ALL ON TABLE public.mst_roles TO postgres;

GRANT SELECT ON TABLE public.mst_roles TO readaccess;
-------------------------------------------------
-- Table: public.mv_json

-- DROP TABLE public.mv_json;

CREATE TABLE IF NOT EXISTS public.mv_json
(
    id integer NOT NULL DEFAULT nextval('mv_json_id_seq'::regclass),
    req_id character varying(40) COLLATE pg_catalog."default",
    o_rid character varying(40) COLLATE pg_catalog."default",
    m_rid character varying(40) COLLATE pg_catalog."default",
    mv_req_json text COLLATE pg_catalog."default",
    url character varying(1000) COLLATE pg_catalog."default",
    req_time character varying(40) COLLATE pg_catalog."default",
    curr_time timestamp with time zone
)

TABLESPACE pg_default;

ALTER TABLE public.mv_json
    OWNER to postgres;

GRANT ALL ON TABLE public.mv_json TO postgres;

GRANT SELECT ON TABLE public.mv_json TO readaccess;


	-- Table: public.response_mvs

-- DROP TABLE public.response_mvs;

CREATE TABLE IF NOT EXISTS public.response_mvs
(
    sno integer NOT NULL,
    orid character varying(50) COLLATE pg_catalog."default",
    resp_json text COLLATE pg_catalog."default",
    cr_times timestamp(0) without time zone,
    status character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT response_mvs_pkey PRIMARY KEY (sno)
)

TABLESPACE pg_default;

ALTER TABLE public.response_mvs
    OWNER to postgres;

GRANT ALL ON TABLE public.response_mvs TO postgres;

GRANT SELECT ON TABLE public.response_mvs TO readaccess;
-------------------------------------------------
-- Table: public.register_manual_verification

-- DROP TABLE public.register_manual_verification;

CREATE TABLE IF NOT EXISTS public.register_manual_verification
(
    trntype_code character varying(36) COLLATE pg_catalog."default",
    supervisor_verify_status character varying(36) COLLATE pg_catalog."default",
    supervisor_upd_date date,
    supervisor_upd_by character varying(256) COLLATE pg_catalog."default",
    supervisor_comment character varying(256) COLLATE pg_catalog."default",
    status_code character varying(36) COLLATE pg_catalog."default",
    sno bigint NOT NULL DEFAULT nextval('sno_seq'::regclass),
    reg_id character varying(39) COLLATE pg_catalog."default" NOT NULL,
    operator2_verify_status character varying(36) COLLATE pg_catalog."default",
    operator2_upd_date date,
    operator2_upd_by character varying(256) COLLATE pg_catalog."default",
    operator2_comment character varying(256) COLLATE pg_catalog."default",
    operator1_verify_status character varying(36) COLLATE pg_catalog."default",
    operator1_upd_date date,
    operator1_upd_by character varying(256) COLLATE pg_catalog."default",
    operator1_comment character varying(256) COLLATE pg_catalog."default",
    matched_score character varying(20) COLLATE pg_catalog."default",
    matched_ref_id character varying(39) COLLATE pg_catalog."default",
    cr_date date,
    cr_by character varying(256) COLLATE pg_catalog."default",
    process_code character varying(36) COLLATE pg_catalog."default",
    operator1_user_id character varying(256) COLLATE pg_catalog."default",
    operator2_user_id character varying(256) COLLATE pg_catalog."default",
    user_id character varying(256) COLLATE pg_catalog."default",
    req_id character varying(40) COLLATE pg_catalog."default",
    fin_indi character varying(40) COLLATE pg_catalog."default",
    CONSTRAINT register_manual_verification_pkey PRIMARY KEY (sno)
)

TABLESPACE pg_default;

ALTER TABLE public.register_manual_verification
    OWNER to postgres;

GRANT ALL ON TABLE public.register_manual_verification TO postgres;

GRANT SELECT ON TABLE public.register_manual_verification TO readaccess;
-------------------------------------------------
-- Table: public.userdetails

-- DROP TABLE public.userdetails;
CREATE TABLE IF NOT EXISTS public.userdetails
(
    sno integer NOT NULL,
    userid character varying(12) COLLATE pg_catalog."default" NOT NULL,
    password text COLLATE pg_catalog."default",
    firstname_en character varying(100) COLLATE pg_catalog."default",
    middle_name character varying(100) COLLATE pg_catalog."default",
    lastname_en character varying(100) COLLATE pg_catalog."default",
    contactnumber character varying(20) COLLATE pg_catalog."default",
    activestatus character(1) COLLATE pg_catalog."default" NOT NULL,
    belongs_to character varying(50) COLLATE pg_catalog."default",
    entered_by character varying(12) COLLATE pg_catalog."default",
    entered_date timestamp without time zone,
    email character varying(50) COLLATE pg_catalog."default",
    login_status character varying(50) COLLATE pg_catalog."default",
    designation character varying(100) COLLATE pg_catalog."default",
    organisation character varying(300) COLLATE pg_catalog."default",
    verifycode_pwd character varying(100) COLLATE pg_catalog."default",
    isloggedin character(1) COLLATE pg_catalog."default",
    login_time timestamp without time zone,
    logout_time timestamp without time zone,
    login_from character varying(100) COLLATE pg_catalog."default",
    user_approval character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT userdetails_pkey PRIMARY KEY (userid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.userdetails
    OWNER to postgres;


GRANT ALL ON TABLE public.userdetails TO postgres;

GRANT SELECT ON TABLE public.userdetails TO readaccess;
-------------------------------------------------
-- FUNCTION: public.reg_verify_pro()

-- DROP FUNCTION public.reg_verify_pro();

CREATE FUNCTION public.reg_verify_pro()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
insert into public.register_manual_verification(reg_id, matched_ref_id,cr_date,req_id) select o_rid, m_rid,curr_time,req_id from public.mv_json where id=new.id;
return new;
end;
$BODY$;

ALTER FUNCTION public.reg_verify_pro()
    OWNER TO postgres;
---------------------------------------------------------

-- Trigger: reg_verify_trigger

-- DROP TRIGGER reg_verify_trigger ON public.mv_json;

CREATE TRIGGER reg_verify_trigger
    AFTER INSERT
    ON public.mv_json
    FOR EACH ROW
    EXECUTE FUNCTION public.reg_verify_pro();
-------------------------------------------------
-- Inser default user

insert into public.userdetails (sno,userid,password,firstname_en,middle_name,
lastname_en,contactnumber,activestatus,belongs_to,entered_date,email,designation,
organisation,verifycode_pwd,isloggedin,user_approval) values(1,'00001','superadmin@gmail.com',
'super','default','admin','1234567898','1','Admin','2021-02-04 17:50:58.47','superadmin@gmail.com','ADMIN',
'MSP','superadmin@gamil.com','0','approved')
==========================================
