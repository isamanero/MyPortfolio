SELECT * FROM tiburones.tiburones;

/*Vamos a realizar diferentes consultas a nuestra base de datos. Sólo tenemos una base de datos
asi que será sencillo
NEXT STEPS: Añadir nuevas tablas para hacer conexiones con otros datos, utilizando el nombre
científico como PK*/

-- Muestra todos los tiburones con clasificación "EN" en Status:IUCN.

SELECT *
	FROM tiburones
    WHERE Status_IUCN  = "EN";

-- 8 de 31 tienen esa clasificación

--  Hay tiburones descritos por un mismo descriptor?

SELECT Descriptor, Año, COUNT(*) AS cantidad
	FROM tiburones
	GROUP BY Descriptor, Año
	HAVING cantidad > 1;
    
-- Tamaño medio de todos los tiburones:

SELECT AVG(Tamaño_medio) AS tamaño_promedio
	FROM tiburones;
    
-- Y de los de género Carcharhinus

SELECT AVG(Tamaño_medio) AS tamaño_promedio
	FROM tiburones
    WHERE Genero = 'Carcharhinus';
    
SELECT MAX(Tamaño_medio) AS mayor_tamaño
	FROM tiburones;






    