DECLARE @version INT = 0;
SELECT
  c.SYS_CHANGE_OPERATION as change_operation,
  c.SYS_CHANGE_VERSION as change_version,
  CONVERT(VARCHAR(32), HASHBYTES('MD5', CAST(c.Twr_GidNumer AS VARCHAR(40))), 2) AS aggregate_key,
	JSON_QUERY((
		SELECT
      c.Twr_GidNumer as sku_id
		FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
	)) AS payload
FROM CHANGETABLE(CHANGES CDN.TwrKarty, @version) AS c
WHERE c.SYS_CHANGE_OPERATION = 'D'

UNION ALL

SELECT
  c.SYS_CHANGE_OPERATION AS change_operation,
  c.SYS_CHANGE_VERSION as change_version,
  CONVERT(VARCHAR(32), HASHBYTES('MD5', CAST(c.Twr_GidNumer AS VARCHAR(40))), 2) AS aggregate_key,
  JSON_QUERY((
    SELECT
        c.Twr_GidNumer as sku_id,
        f.TGD_Kod as sku_group,
        e.TGD_Kod sku_subgroup,
        UPPER(t.twr_kod) as sku_code,
        UPPER(t.twr_nazwa) as sku_name,
        t.twr_ean as sku_ean_code,
        UPPER(t.twr_jm) as sku_unit_prefix,
        CASE t.twr_archiwalny WHEN 0 THEN 'AKTYWNY' ELSE 'NIEAKTYWNY' END AS sku_status
    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
  )) AS payload
FROM CHANGETABLE(CHANGES CDN.TwrKarty, @version) AS c
    JOIN CDN.TwrKarty t ON c.Twr_GIDNumer = t.Twr_GIDNumer
    JOIN CDN.TwrGrupyDom d ON t.Twr_GIDNumer = d.TGD_GIDNumer and t.Twr_GIDTyp = d.TGD_GIDTyp
    JOIN CDN.TwrGrupyDom e ON d.TGD_GrONumer = e.TGD_GIDNumer and d.TGD_GrOTyp = e.TGD_GIDTyp
    JOIN CDN.TwrGrupyDom f ON e.TGD_GrONumer = f.TGD_GIDNumer and e.TGD_GrOTyp = f.TGD_GIDTyp
WHERE 1=1
    AND f.TGD_GrOTyp = -16
    AND f.TGD_GrONumer = 2;