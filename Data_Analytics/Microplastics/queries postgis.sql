SELECT * FROM public.marine_gis

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'marine_gis';

CREATE EXTENSION IF NOT EXISTS postgis;

ALTER TABLE marine_gis ADD COLUMN geom geometry(Point, 4326);

UPDATE marine_gis
SET geom = ST_SetSRID(ST_MakePoint("Longitude", "Latitude"), 4326);

UPDATE marine_gis m
SET "Regions" = r.name
FROM regiones_mundo r
WHERE m."Regions" IS NULL
  AND ST_Contains(r.geom, m.geom);


