DECLARE @version INT = 0;
SELECT JSON_QUERY((
    SELECT
    CASE c.SYS_CHANGE_OPERATION 
        WHEN 'I' THEN 'created'
        WHEN 'U' THEN 'updated'
        WHEN 'D' THEN 'deleted'
    END AS change_operation,
    c.SYS_CHANGE_VERSION as change_version,
    CONVERT(VARCHAR(32), HASHBYTES('MD5', CAST(c.Twr_GidNumer AS VARCHAR(40))), 2) AS aggregate_key
    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
)) AS aggregates
FROM CHANGETABLE(CHANGES ERPXL_GO.CDN.TwrKarty, @version) AS c
WHERE c.SYS_CHANGE_OPERATION = 'D'

UNION ALL

SELECT JSON_QUERY((
    SELECT
    CASE c.SYS_CHANGE_OPERATION 
        WHEN 'I' THEN 'created'
        WHEN 'U' THEN 'updated'
        WHEN 'D' THEN 'deleted'
    END AS change_operation,
    c.SYS_CHANGE_VERSION as change_version,
    CONVERT(VARCHAR(32), HASHBYTES('MD5', CAST(c.Twr_GidNumer AS VARCHAR(40))), 2) AS aggregate_key,
    JSON_QUERY((
        SELECT
            f.TGD_Kod fabric,
            e.TGD_Kod fabric_color,
            UPPER(t.twr_kod) as fabric_code,
            UPPER(t.twr_nazwa) as fabric_name,
            t.twr_ean as ean_code,
            UPPER(t.twr_jm) as unit_prefix
        FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
    )) AS aggregate_data
    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
)) AS aggregates
FROM CHANGETABLE(CHANGES ERPXL_GO.CDN.TwrKarty, @version) AS c
    JOIN ERPXL_GO.CDN.TwrKarty t ON c.Twr_GIDNumer = t.Twr_GIDNumer
    JOIN ERPXL_GO.CDN.TwrGrupyDom d ON t.Twr_GIDNumer = d.TGD_GIDNumer and t.Twr_GIDTyp = d.TGD_GIDTyp
    JOIN ERPXL_GO.CDN.TwrGrupyDom e ON d.TGD_GrONumer = e.TGD_GIDNumer and d.TGD_GrOTyp = e.TGD_GIDTyp
    JOIN ERPXL_GO.CDN.TwrGrupyDom f ON e.TGD_GrONumer = f.TGD_GIDNumer and e.TGD_GrOTyp = f.TGD_GIDTyp
WHERE 1=1
    AND f.TGD_GrOTyp = -16
    AND f.TGD_GrONumer = 2;