USE abc;

/*¿Cuántos trabajadores se han ido de la empresa?*/

SELECT attrition, COUNT(*) as cantidad
	FROM employee_data
    GROUP BY attrition;
    
/*Cual es la media de jobsatisfaction de los trabajadores que
dejaron el trabajo y de los que siguen trabajando*/

SELECT attrition as "¿dejó la empresa?", AVG(jobSatisfaction) AS "Satisfacción laboral sobre 4"
	FROM employee_data
	GROUP BY attrition;
# Se puede comprobar que la satisfacción es parecida, y en ambos casos, superior a la media

/*Lo mismo pero con el salario*/

SELECT attrition as "¿dejó la empresa?", AVG(salary) AS "Salario"
	FROM employee_data
	GROUP BY attrition;

# Los empleados que se fueron cobraban menos que los que se quedaron.

/*¿De que departamento se fueron mas empleados?*/

SELECT jobrole, COUNT(*) AS num_empleados_que_se_fueron
	FROM employee_data
	WHERE attrition = 'Yes'
	GROUP BY jobrole
	ORDER BY num_empleados_que_se_fueron DESC
	LIMIT 15;
    
/*¿Influye maritalstatus?*/

SELECT maritalstatus, COUNT(*) as num_empleados_que_se_fueron
	FROM employee_data
    WHERE attrition = 'Yes'
	GROUP BY maritalstatus
	ORDER BY num_empleados_que_se_fueron DESC
    LIMIT 4;

# Se fueron más solteros, que casados... el 50,3 % eran solteros.

/*Edad: Tenemos el año de nacimiento, podemos calcular una columna provisional que sea
edad, respecto al 2025*/

SELECT datebirth, COUNT(*) as num_empleados_que_se_fueron
	FROM employee_data
    WHERE attrition = 'Yes'
	GROUP BY datebirth
	ORDER BY num_empleados_que_se_fueron DESC;

SELECT 
    CASE 
        WHEN YEAR(CURDATE()) - datebirth BETWEEN 18 AND 25 THEN '18-25 años'
        WHEN YEAR(CURDATE()) - datebirth BETWEEN 26 AND 35 THEN '26-35 años'
        WHEN YEAR(CURDATE()) - datebirth BETWEEN 36 AND 45 THEN '36-45 años'
        WHEN YEAR(CURDATE()) - datebirth BETWEEN 46 AND 55 THEN '46-55 años'
        WHEN YEAR(CURDATE()) - datebirth > 55 THEN '56+ años'
        ELSE 'Desconocido'
    END AS rango_edad,
    COUNT(*) AS num_empleados_que_se_fueron
FROM employee_data
WHERE attrition = 'Yes'
GROUP BY rango_edad
ORDER BY num_empleados_que_se_fueron DESC;

# YEAR(CURDATE()) - datebirth AS edad → Calcula la edad de los empleados en 2025 restando su año de nacimiento al año actual.

/*120 de 259 son: 46,33 % de los trabajadores que se han ido tienen entre 26 y 35 años */

/*Comparando con yearatcompany, porque vimos que mucha de la gente se
iba los primeros años*/

SELECT YearsAtCompany, COUNT(*) as cantidad
	FROM employee_data
    WHERE attrition ="No" # De los que siguen trabajando
    GROUP BY YearsAtCompany
    order by YearsAtCompany;
    
/*La mayor parte de los trabajadores llevan poco tiempo, hay muchos trabajadores que llevan entre 1-10 años.
Siguiente query: ( Casi el 82% de los trabajadores, llevan menos de 10 años, ROTACIÓN EVIDENTE)*/

SELECT 
    CASE 
		WHEN YearsAtCompany BETWEEN 0 AND 5 THEN 'Primeros 5 años'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN 'Entre 6 y 10 años'
        WHEN YearsAtCompany BETWEEN 11 AND 20 THEN 'Entre 11 y 20 años'
        WHEN YearsAtCompany BETWEEN 21 AND 37 THEN 'Más de 21 años'
        ELSE '37+ años'
    END AS rango_antiguedad,
    COUNT(*) AS num_empleados_que_se_fueron
FROM employee_data
WHERE attrition = "Yes"
GROUP BY rango_antiguedad
ORDER BY rango_antiguedad DESC;

 
SELECT 
    CASE 
        WHEN YearsAtCompany BETWEEN 0 AND 10 THEN 'Primeros 10 años'
        WHEN YearsAtCompany BETWEEN 11 AND 20 THEN 'Entre 11 y 20 años'
        WHEN YearsAtCompany BETWEEN 21 AND 37 THEN 'Más de 21 años'
        ELSE '37+ años'
    END AS rango_antiguedad,
   AVG(TrainingTimesLastYear) AS entrenamiento_promedio,
    COUNT(*) AS num_empleados
FROM employee_data
GROUP BY rango_antiguedad
ORDER BY rango_antiguedad;
/* Comparando YearsAtCompany con TrainingTimesLastYear, también aparece
que los empleados con menos años en la empresa, son los que menos formación
reciben de promedio. Aunque no es significativo.*/

SELECT 
    Gender,
    AVG(JobSatisfaction) AS satisfaccion_promedio,
    COUNT(*) AS num_empleados
FROM employee_data
GROUP BY Gender
ORDER BY satisfaccion_promedio DESC;
