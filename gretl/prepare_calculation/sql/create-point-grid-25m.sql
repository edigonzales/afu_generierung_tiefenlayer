INSERT INTO ${schema_name}.grundlagen_grid25m (geometrie) 
SELECT
   --ST_SetSRID(ST_Collect(ST_POINT(x,y)), 2056)
   point
FROM
  (
    SELECT
      ST_SetSRID((ST_MakePoint(x,y,0.0)), 2056) AS point
    FROM
      afu_generierung_tiefenlayer.grundlagen_abfrageperimeter AS p,
      generate_series(floor(floor(ST_XMin(geometrie))::numeric/25)*25::numeric, floor(ceiling(ST_XMax(geometrie))::numeric/25)*25::numeric, 25) as x,
      generate_series(floor(floor(ST_YMin(geometrie))::numeric/25)*25::numeric, floor(ceiling(ST_YMax(geometrie))::numeric/25)*25::numeric, 25) as y
    WHERE
      colorid = 0
      AND
      ST_Intersects(ST_SetSRID((ST_POINT(x,y)), 2056), p.geometrie)
  ) AS foo,
  afu_generierung_tiefenlayer.grundlagen_abfrageperimeter AS p
WHERE
  ST_X(point) < 2593270
  AND
  point && p.geometrie
  AND
  ST_Intersects(point, p.geometrie);