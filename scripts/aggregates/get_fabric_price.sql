DECLARE @version INT = 0;
SELECT JSON_QUERY((
    SELECT
        CASE a.SYS_CHANGE_OPERATION 
            WHEN 'I' THEN 'created'
            WHEN 'U' THEN 'updated'
            WHEN 'D' THEN 'deleted'
        END AS change_operation,
        a.SYS_CHANGE_VERSION as change_version,
        CONVERT(VARCHAR(32), HASHBYTES('MD5', CAST(c.TwC_TwrNumer AS VARCHAR(40))), 2) AS aggregate_key,
        t.TwR_Kod as aggregate_id,
        JSON_QUERY((
            SELECT
                c.twc_tcnid as pricelist_id,
                c.twc_id as price_id,
                SUBSTRING(x.naz_nazwa,1,10) as pricelist,
                c.twc_waluta as currency,
                c.twc_wartosc as price,
                SUBSTRING(x.naz_nazwa,11,1) AS net_gross
            FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
    )) AS aggregate_data
    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
)) AS aggregates
FROM CHANGETABLE(CHANGES ERPXL_GO.CDN.TwrCeny, @version) AS a
    JOIN ERPXL_GO.CDN.TwrCeny c ON a.TwC_ID = c.TwC_ID
    JOIN ERPXL_GO.CDN.TwrCenyNag n ON c.TwC_TcNId = n.TCN_Id
    JOIN ERPXL_GO.CDN.TwrKarty t ON c.TwC_TwrNumer = t.Twr_GIDNumer
    JOIN ERPXL_GO.CDN.Nazwy x ON n.TCN_RodzajCeny = x.Naz_GIDLp AND x.Naz_GIDTyp = 64
    JOIN ERPXL_GO.CDN.TwrGrupyDom d ON t.Twr_GIDNumer = d.TGD_GIDNumer and t.Twr_GIDTyp = d.TGD_GIDTyp
    JOIN ERPXL_GO.CDN.TwrGrupyDom e ON d.TGD_GrONumer = e.TGD_GIDNumer and d.TGD_GrOTyp = e.TGD_GIDTyp
    JOIN ERPXL_GO.CDN.TwrGrupyDom f ON e.TGD_GrONumer = f.TGD_GIDNumer and e.TGD_GrOTyp = f.TGD_GIDTyp
WHERE 1=1
    AND n.tcn_stan = 5
    AND f.TGD_GrOTyp = -16
    AND f.TGD_GrONumer = 2
    AND t.Twr_Archiwalny = 0