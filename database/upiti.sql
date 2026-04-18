USE nk_samobor_juniori2;

-- 1. SVI AKTIVNI IGRACI 2008. GODIŠTA
SELECT *
FROM igraci
WHERE status_u_klubu = 'aktivan'
  AND godiste = 2008
ORDER BY prezime, ime;

-- 2. TOP 5 STRIJELACA
SELECT ime, prezime, golovi
FROM igraci
ORDER BY golovi DESC, prezime ASC, ime ASC
LIMIT 5;

-- 3. TOP 5 PO NASTUPIMA, PA MINUTAMA
SELECT ime, prezime, broj_nastupa, broj_minuta
FROM igraci
ORDER BY broj_nastupa DESC, broj_minuta DESC, prezime ASC, ime ASC
LIMIT 5;

-- 4. TOP 5 PO MINUTAMA
SELECT ime, prezime, broj_minuta, broj_nastupa
FROM igraci
ORDER BY broj_minuta DESC, broj_nastupa DESC, prezime ASC, ime ASC
LIMIT 5;

-- 5. IGRACI S NAJVISE ZUTIH KARTONA
SELECT ime, prezime, zuti_kartoni
FROM igraci
WHERE zuti_kartoni > 0
ORDER BY zuti_kartoni DESC, prezime ASC, ime ASC
LIMIT 5;

-- 6. IGRACI S NAJVISE CRVENIH KARTONA
SELECT ime, prezime, crveni_kartoni
FROM igraci
WHERE crveni_kartoni > 0
ORDER BY crveni_kartoni DESC, prezime ASC, ime ASC
LIMIT 5;

-- 7. IGRACI KOJI SU OTIŠLI
SELECT ime, prezime, godiste, broj_dresa, primarna_pozicija
FROM igraci
WHERE status_u_klubu = 'otisao'
ORDER BY prezime, ime;

-- 8. AKTIVNO OSOBLJE
SELECT ime, prezime, uloga, status_u_klubu
FROM osoblje
WHERE status_u_klubu = 'aktivan'
ORDER BY uloga, prezime, ime;

-- 9. BIVSE OSOBLJE
SELECT ime, prezime, uloga, status_u_klubu
FROM osoblje
WHERE status_u_klubu = 'otisao'
ORDER BY uloga, prezime, ime;

-- 10. SVE ODIGRANE UTAKMICE SORTIRANE PO KOLU
SELECT kolo, datum_vrijeme, protivnik, lokacija, domacin_gost,
       golovi_samobor, golovi_protivnik
FROM utakmice
WHERE golovi_samobor IS NOT NULL
  AND golovi_protivnik IS NOT NULL
ORDER BY kolo ASC;

-- 11. ZADNJA ODIGRANA UTAKMICA
SELECT kolo, datum_vrijeme, protivnik, lokacija, domacin_gost,
       golovi_samobor, golovi_protivnik
FROM utakmice
WHERE golovi_samobor IS NOT NULL
  AND golovi_protivnik IS NOT NULL
ORDER BY datum_vrijeme DESC
LIMIT 1;

-- 12. SLJEDECA UTAKMICA
SELECT kolo, datum_vrijeme, protivnik, lokacija, domacin_gost
FROM utakmice
WHERE datum_vrijeme > NOW()
ORDER BY datum_vrijeme ASC
LIMIT 1;

-- 13. STATISTIKA EKIPE
SELECT
    COUNT(*) AS odigrane_utakmice,
    SUM(CASE WHEN golovi_samobor > golovi_protivnik THEN 1 ELSE 0 END) AS pobjede,
    SUM(CASE WHEN golovi_samobor = golovi_protivnik THEN 1 ELSE 0 END) AS nerijeseno,
    SUM(CASE WHEN golovi_samobor < golovi_protivnik THEN 1 ELSE 0 END) AS porazi,
    SUM(golovi_samobor) AS postignuti_golovi,
    SUM(golovi_protivnik) AS primljeni_golovi,
    SUM(golovi_samobor) - SUM(golovi_protivnik) AS gol_razlika,
    SUM(
        CASE
            WHEN golovi_samobor > golovi_protivnik THEN 3
            WHEN golovi_samobor = golovi_protivnik THEN 1
            ELSE 0
        END
    ) AS bodovi
FROM utakmice
WHERE golovi_samobor IS NOT NULL
  AND golovi_protivnik IS NOT NULL;

-- 14. BROJ ODIGRANIH DOMACIH I GOSTUJUCIH UTAKMICA
SELECT domacin_gost, COUNT(*) AS broj_utakmica
FROM utakmice
WHERE golovi_samobor IS NOT NULL
  AND golovi_protivnik IS NOT NULL
GROUP BY domacin_gost;

-- 15. SVI TRENINZI SORTIRANI PO DATUMU
SELECT datum, vrsta_treninga, trajanje_min, lokacija
FROM treninzi
ORDER BY datum ASC;

-- 16. BROJ DOLAZAKA PO IGRACU
SELECT i.ime, i.prezime,
       SUM(CASE WHEN p.status = 'prisutan' THEN 1 ELSE 0 END) AS broj_dolazaka
FROM prisustvo p
JOIN igraci i ON p.id_igraca = i.id_igraca
GROUP BY p.id_igraca, i.ime, i.prezime
ORDER BY broj_dolazaka DESC, i.prezime ASC, i.ime ASC;

-- 17. BROJ IZOSTANAKA PO IGRACU
SELECT i.ime, i.prezime,
       SUM(CASE WHEN p.status IN ('izostao', 'opravdano', 'ozlijeden') THEN 1 ELSE 0 END) AS broj_izostanaka
FROM prisustvo p
JOIN igraci i ON p.id_igraca = i.id_igraca
GROUP BY p.id_igraca, i.ime, i.prezime
ORDER BY broj_izostanaka DESC, i.prezime ASC, i.ime ASC;

-- 18. BROJ NEOPRAVDANIH IZOSTANAKA PO IGRACU
SELECT i.ime, i.prezime,
       SUM(CASE WHEN p.status = 'izostao' THEN 1 ELSE 0 END) AS neopravdani_izostanci
FROM prisustvo p
JOIN igraci i ON p.id_igraca = i.id_igraca
GROUP BY p.id_igraca, i.ime, i.prezime
HAVING neopravdani_izostanci >= 1
ORDER BY neopravdani_izostanci DESC, i.prezime ASC, i.ime ASC;

-- 19. BROJ TRENINGA KOJI SU PROPUSTENI ZBOG OZLJEDE
SELECT i.ime, i.prezime,
       COUNT(*) AS broj_ozljeda
FROM prisustvo p
JOIN igraci i ON p.id_igraca = i.id_igraca
WHERE p.status = 'ozlijeden'
GROUP BY p.id_igraca, i.ime, i.prezime
ORDER BY broj_ozljeda DESC, i.prezime ASC, i.ime ASC;

-- 20. SVI TRENINZI JEDNOG IGRACA
SELECT i.ime, i.prezime, t.datum, t.vrsta_treninga, t.lokacija, p.status
FROM prisustvo p
JOIN igraci i ON p.id_igraca = i.id_igraca
JOIN treninzi t ON p.id_treninga = t.id_treninga
WHERE i.id_igraca = 25
ORDER BY t.datum ASC;

-- 21. PRISUSTVO PO TRENINGU
SELECT t.id_treninga, t.datum, t.vrsta_treninga,
       SUM(CASE WHEN p.status = 'prisutan' THEN 1 ELSE 0 END) AS prisutni,
       SUM(CASE WHEN p.status = 'izostao' THEN 1 ELSE 0 END) AS izostali,
       SUM(CASE WHEN p.status = 'opravdano' THEN 1 ELSE 0 END) AS opravdano,
       SUM(CASE WHEN p.status = 'ozlijeden' THEN 1 ELSE 0 END) AS ozlijedeni
FROM prisustvo p
JOIN treninzi t ON p.id_treninga = t.id_treninga
GROUP BY t.id_treninga, t.datum, t.vrsta_treninga
ORDER BY t.datum ASC;