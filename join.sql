
---------- TEST JOIN ------------

-- INNER JOIN
SELECT * FROM public.tb_t1 t1
INNER JOIN public.tb_t2 t2 on t2.id = t1.id;
-- LEFT JOIN
SELECT * FROM public.tb_t1 t1
LEFT JOIN public.tb_t2 t2 on t2.id = t1.id;
-- RIGHT JOIN
SELECT * FROM public.tb_t1 t1
RIGHT JOIN public.tb_t2 t2 on t2.id = t1.id;
-- FULL OUTER
SELECT * FROM public.tb_t1 t1
FULL OUTER JOIN public.tb_t2 t2 on t2.id = t1.id;

----------------------------------

-- JOIN
SELECT * FROM genel.tb_kitaplar k
JOIN genel.tb_kitap_tipi kt ON kt.id = k.kitap_tipi_id
WHERE
kt.kitap_tipi = 'Biyografi';


SELECT * FROM genel.tb_kitaplar k
JOIN genel.tb_kitap_tipi kt ON kt.id = k.kitap_tipi_id
WHERE
kt.kitap_tipi = 'Çizgi-Roman';

SELECT kt.kitap_tipi, COUNT(kt.kitap_tipi) FROM genel.tb_kitaplar k
JOIN genel.tb_kitap_tipi kt ON kt.id = k.kitap_tipi_id
WHERE kt.id = 3
GROUP BY kt.kitap_tipi;
