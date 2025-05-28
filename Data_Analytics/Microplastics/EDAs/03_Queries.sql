SELECT unit, AVG(measurement) AS promedio_measurement
FROM samples
GROUP BY unit;

/*Las unidades pieces/10min parece ser la correspondiente al metodo de muestreo
Hand picking, lo confirma la siguiente Query*/

SELECT DISTINCT sampling_method, unit
FROM samples
ORDER BY sampling_method, unit;

/*Cantidad de muestreos por océanos*/

SELECT oceans, COUNT(*) AS muestreos
FROM samples
GROUP BY oceans
ORDER BY muestreos DESC;

/* Cual es la region con mayor mesurement piezas/m3*/

SELECT oceans, organization, regions,
       unit,
       SUM(measurement) AS max_measurement
FROM samples
GROUP BY regions, unit, oceans, organization
ORDER BY max_measurement DESC
LIMIT 100;
/* Tenemos que, donde mayor muestra se ha encontrado es en el oceano atlatico
en general, porque no tenemos el dato de la region. El primer dato
que tenemos completo es el del gulf of mexico*/


SELECT DISTINCT regions, oceans
FROM samples
WHERE organization = 'Sea Education Association';




