CREATE SCHEMA IF NOT EXISTS ${schema_name};

CREATE TABLE IF NOT EXISTS ${schema_name}.ebene_daten_dhm (
	daten_id varchar(255),
	ebene_id varchar(1024),
	beschreibu varchar(255),
	the_geom geometry(PolygonZ, 2056)
)
WITH (
	OIDS=FALSE
);

CREATE TABLE IF NOT EXISTS ${schema_name}.ebene_daten_nagra (
	daten_id varchar(255),
	ebene_id varchar(1024),
	beschreibu varchar(255),
	the_geom geometry(PolygonZ, 2056)
)
WITH (
	OIDS=FALSE
);

CREATE TABLE IF NOT EXISTS ${schema_name}.abfrageperimeter_kanton (
	ogc_fid integer,
	dn integer,
	colorid integer,
	the_geom geometry(MultiPolygon, 2056)
)
WITH (
	OIDS=FALSE
);