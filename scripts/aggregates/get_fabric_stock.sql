SELECT JSON_QUERY((
    SELECT
        CONVERT(VARCHAR(32), HASHBYTES('MD5', CAST(t.Twr_GidNumer AS VARCHAR(40))), 2) AS aggregate_key,
        t.twr_kod as aggregate_id,
        JSON_QUERY((
            SELECT
                x.Dst_Cecha as batch_number,
                t.Twr_Kod fabric_code,
                m.MAG_Kod warhouse_code,
                m.MAG_Nazwa warehouse_name,
                z.TwZ_IlSpr stock_qty
            FROM ERPXL_GO.CDN.TwrZasoby z
                JOIN ERPXL_GO.CDN.Dostawy x ON x.Dst_GidNumer = z.TwZ_DstNumer AND x.Dst_GidTyp = z.TwZ_DstTyp
                JOIN ERPXL_GO.CDN.Magazyny m ON z.TwZ_MagNumer = m.MAG_GIDNumer
            WHERE z.TwZ_TwrNumer = t.Twr_GIDNumer
                AND z.TwZ_MagNumer IN (1, 14, 19, 23, 29, 30, 35, 70, 81, 83, 87, 88)
            FOR JSON PATH
        )) AS aggregate_data
    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
)) AS aggregates
FROM ERPXL_GO.CDN.TwrKarty t
    JOIN ERPXL_GO.CDN.TwrGrupyDom d ON t.Twr_GIDNumer = d.TGD_GIDNumer and t.Twr_GIDTyp = d.TGD_GIDTyp
    JOIN ERPXL_GO.CDN.TwrGrupyDom e ON d.TGD_GrONumer = e.TGD_GIDNumer and d.TGD_GrOTyp = e.TGD_GIDTyp
    JOIN ERPXL_GO.CDN.TwrGrupyDom f ON e.TGD_GrONumer = f.TGD_GIDNumer and e.TGD_GrOTyp = f.TGD_GIDTyp
WHERE 1=1
    AND f.TGD_GrOTyp = -16
    AND f.TGD_GrONumer = 2
    AND t.Twr_Archiwalny = 0
