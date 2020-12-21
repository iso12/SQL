-- Table: pg_catalog.pg_type

-- DROP TABLE pg_catalog.pg_type;

CREATE TABLE pg_catalog.pg_type
(
    typname name NOT NULL,
    typnamespace oid NOT NULL,
    typowner oid NOT NULL,
    typlen smallint NOT NULL,
    typbyval boolean NOT NULL,
    typtype "char" NOT NULL,
    typcategory "char" NOT NULL,
    typispreferred boolean NOT NULL,
    typisdefined boolean NOT NULL,
    typdelim "char" NOT NULL,
    typrelid oid NOT NULL,
    typelem oid NOT NULL,
    typarray oid NOT NULL,
    typinput regproc NOT NULL,
    typoutput regproc NOT NULL,
    typreceive regproc NOT NULL,
    typsend regproc NOT NULL,
    typmodin regproc NOT NULL,
    typmodout regproc NOT NULL,
    typanalyze regproc NOT NULL,
    typalign "char" NOT NULL,
    typstorage "char" NOT NULL,
    typnotnull boolean NOT NULL,
    typbasetype oid NOT NULL,
    typtypmod integer NOT NULL,
    typndims integer NOT NULL,
    typcollation oid NOT NULL,
    typdefaultbin pg_node_tree COLLATE pg_catalog."default",
    typdefault text COLLATE pg_catalog."default",
    typacl aclitem[]
)
WITH (
    OIDS = TRUE
)
TABLESPACE pg_default;

ALTER TABLE pg_catalog.pg_type
    OWNER to postgres;

GRANT ALL ON TABLE pg_catalog.pg_type TO postgres;

GRANT SELECT ON TABLE pg_catalog.pg_type TO PUBLIC;
-- Index: pg_type_oid_index

-- DROP INDEX pg_catalog.pg_type_oid_index;

CREATE UNIQUE INDEX pg_type_oid_index
    ON pg_catalog.pg_type USING btree
    (oid ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: pg_type_typname_nsp_index

-- DROP INDEX pg_catalog.pg_type_typname_nsp_index;

CREATE UNIQUE INDEX pg_type_typname_nsp_index
    ON pg_catalog.pg_type USING btree
    (typname ASC NULLS LAST, typnamespace ASC NULLS LAST)
    TABLESPACE pg_default;