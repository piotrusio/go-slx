DECLARE @version INT = 0;
WITH changetracking_changes AS (
	SELECT
		c.SYS_CHANGE_OPERATION as change_operation,
		c.SYS_CHANGE_VERSION as change_version,
		c.Knt_GidNumer as customer_id
	FROM CHANGETABLE(CHANGES ERPXL_GO.CDN.KntKarty, @version) AS c
	UNION
	SELECT
		c.SYS_CHANGE_OPERATION,
		c.SYS_CHANGE_VERSION,
		a.KnA_KntNumer
	FROM CHANGETABLE(CHANGES ERPXL_GO.CDN.KntAdresy, @version) AS c
		JOIN ERPXL_GO.CDN.KntAdresy a ON c.KnA_GidNumer = a.KnA_GIDNumer
	UNION
	SELECT
		c.SYS_CHANGE_OPERATION,
		c.SYS_CHANGE_VERSION,
		c.KnS_KntNumer
	FROM CHANGETABLE(CHANGES ERPXL_GO.CDN.KntOsoby, @version) AS c
), customers AS (
	SELECT
		customer_id,
		MAX(change_version) as change_version,
		MAX(change_operation) as change_operation
	FROM
		changetracking_changes
	GROUP BY
		customer_id
)
-- delete operations does not have aggregate_data
SELECT
	CASE c.change_operation
		WHEN 'I' THEN 'created'
		WHEN 'U' THEN 'updated'
		WHEN 'D' THEN 'deleted'
	END AS change_operation,
	c.change_version,
	CONVERT(VARCHAR(32), HASHBYTES('MD5', CAST(c.customer_id AS VARCHAR(40))), 2) AS aggregate_key,
	'{}' as payload
FROM customers AS c
WHERE c.change_operation = 'D'

UNION ALL

SELECT
	c.change_operation,
	c.change_version,
	CONVERT(VARCHAR(32), HASHBYTES('MD5', CAST(c.customer_id AS VARCHAR(40))), 2) AS aggregate_key,
	JSON_QUERY((
		SELECT
			k.knt_akronim as customer_code,
			e.KGD_Kod as customer_group,
			UPPER(COALESCE(NULLIF(TRIM(CONCAT_WS(' ', p.prc_imie1, p.prc_nazwisko)), ''), 'N/D')) AS customer_owner,        
			UPPER(TRIM(CONCAT_WS(' ', k.knt_nazwa1, k.knt_nazwa2, k.knt_nazwa3))) AS customer_name,
			k.knt_nipprefiks as customer_tax_prefix,
			COALESCE(k.knt_nipe, k.knt_nip) AS customer_tax_id,
			TRIM(SUBSTRING(n.naz_nazwa,1,10)) AS customer_price_list,
			CASE k.knt_archiwalny WHEN 0 THEN 'AKTYWNY' ELSE 'NIEAKTYWNY' END AS customer_status,
			JSON_QUERY((
				SELECT
					a.kna_akronim as adress_code,
					CASE
						WHEN k.knt_knanumer = a.KnA_GIDNumer THEN 'AKTUALNY'
						WHEN a.kna_wysylkowy = 1 THEN 'WYSYŁKOWY'
						ELSE 'INNY'
					END AS address_type,
					UPPER(a.kna_ulica) as adress_street,
					UPPER(a.kna_kraj) as adress_country,
					UPPER(a.kna_kodp) as adress_zip,
					UPPER(a.kna_miasto) as adress_city,
					UPPER(a.kna_wojewodztwo) as adress_district,
					a.kna_telefon1 as adress_phone1,
					a.kna_telefon2 as adress_phone2,
					a.kna_fax as adress_fax,
					a.kna_modem as adress_mode,
					a.kna_telex as adress_gsm,
					a.kna_email as adress_email
				FROM ERPXL_GO.CDN.KntAdresy a
				WHERE a.KnA_KntNumer = k.Knt_GIDNumer AND a.kna_dataarc = 0
				FOR JSON PATH
			)) AS adresses,
			JSON_QUERY((
				SELECT
					o.kns_kntlp as id,
					o.kns_nazwa as name,
					o.kns_stanowisko as position,
					o.kns_email as email,
					o.kns_telefon as phone,
					o.kns_telefonk as mobile
				FROM ERPXL_GO.CDN.KntOsoby o
				WHERE k.Knt_GIDNumer = o.KnS_KntNumer AND o.kns_archiwalny = 0
				FOR JSON PATH
			)) AS contacts,
			JSON_QUERY((
				SELECT
					o.klk_id as credit_id,
					DATEADD(DAY, o.klk_dataod, '1800-12-28') as valid_from,
					DATEADD(DAY, o.klk_datado, '1800-12-28') as valid_to,
					o.klk_maxlimitwart as credit_value,
					o.klk_waluta as credit_currency
				FROM ERPXL_GO.CDN.KntLimityK o
				WHERE k.Knt_GIDNumer = o.Klk_KntNumer
					AND o.klk_datado > DATEDIFF(DAY, '1800-12-28', GETDATE())
				FOR JSON PATH
			)) AS credits
		FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
	)) AS payload
FROM customers AS c
	JOIN ERPXL_GO.CDN.KntKarty AS k ON c.customer_id = k.knt_gidnumer
	JOIN ERPXL_GO.CDN.KntGrupyDom d ON k.knt_gidnumer = d.kgd_gidnumer AND d.kgd_gidtyp = k.knt_gidtyp
	JOIN ERPXL_GO.CDN.KntGrupyDom e ON d.kgd_grotyp = e.kgd_gidtyp AND d.kgd_gronumer = e.kgd_gidnumer
	LEFT JOIN ERPXL_GO.CDN.KntOpiekun o ON k.knt_gidnumer = o.kto_kntnumer AND k.knt_gidtyp = o.kto_knttyp
	LEFT JOIN ERPXL_GO.CDN.PrcKarty p ON o.kto_prcnumer = p.prc_gidnumer
	LEFT JOIN ERPXL_GO.CDN.Nazwy n ON k.knt_cena = n.naz_gidlp AND n.naz_gidtyp = 64;