# Adalab-proyecto-da-promo-49-modulo-3-team-2

## 📌 Introducción:

Proyecto desarrollado por Isa Mañero, Andrea Gauger, María Guisado y Adriana Arcidiacono de la empresa Letal Insight Company a petición de ABC Corporation.

## 🎯 Objetivos:

ABC nos solicita un proyecto de análisis de datos. Nuestra labor consiste en identificar los factores que más influyen en el bienestar laboral y, por extensión, en la fidelización del equipo. 

Con este proyecto, nuestro cliente ABC Corporation busca disminuir la rotación de personal, aumentar la satisfacción del entorno laboral al igual que la retención del talento.

Para ello, nos marcamos los siguientes objetivos:

- Descubrir qué hace felices a los empleados. Identificar factores clave de satisfacción
- Analizar su impacto en la retención de talento
- Proporcionar recomendaciones basadas en datos.

## 📝  Implementación del proyecto:

### ✅ Fase de Análisis Exploratorio de Datos (EDA)**

En esta primera fase, se realizó un análisis exploratorio de los datos (EDA) para comprender las características del conjunto de datos proporcionado y determinar las transformaciones necesarias. Este análisis incluyó:

Identificación de patrones, tendencias y correlaciones entre diferentes variables.

Detección de valores nulos, duplicados y anomalías en los datos.

### ✅ Fase de Transformación de Datos.**

Tras el análisis exploratorio, se llevaron a cabo las transformaciones de los datos para garantizar que estuvieran listos para su análisis y carga en la base de datos. Las transformaciones realizadas incluyen:

**Limpieza de datos**: Se eliminaron duplicados, se corrigieron errores tipográficos y se resolvieron inconsistencias en las columnas, como valores negativos en la distancia desde el hogar.

**Conversión de tipos de datos**: Se cambiaron las columnas que estaban mal tipadas (por ejemplo, columnas de texto con valores numéricos) para su posterior procesamiento.

**Reemplazo de valores categóricos**: Se reemplazaron valores como "0" y "1" en la columna de género por "Male" y "Female" para mayor claridad, o cambiar NaN's en diversas columnas por "Uknown".


### ✅ Visualización de Datos
Se emplearon visualizaciones sencillas y efectivas para facilitar la interpretación de los datos por parte del equipo directivo. Al inicio, se utilizó un mapa de calor para explorar correlaciones entre variables numéricas. Posteriormente, se recurrió principalmente a gráficos de barras para comparar frecuencias entre categorías y a gráficos de quesitos (pastel) para mostrar proporciones dentro de variables categóricas.

Estas visualizaciones permitieron comunicar de forma clara los principales hallazgos del análisis.


### ✅ Diseño y Creación de la Base de Datos
El siguiente paso consistió en diseñar la estructura de la base de datos que almacenaría la información relacionada con los empleados. En esta fase:

Se definieron las tablas necesarias y sus relaciones, así como las claves primarias y foráneas.

Se utilizó SQL para crear la base de datos y definir su arquitectura.

Los datos de empleados fueron insertados en la base de datos siguiendo el modelo establecido.

## 🛠️ Herramientas y Tecnologías Utilizadas:
- **Python:** Para el análisis de datos, limpieza, transformaciones y visualización.

- **SQL:** Para el diseño y la creación de la base de datos, así como para la inserción de datos.

- **GitHub:** Para el control de versiones y colaboración en equipo.

- **Matplotlib y Seaborn:** Para la creación de visualizaciones y gráficos.

## 🗃️ Archivos y carpetas:
### 📁 files
En esta carpeta se encuentran los csv con los que hemos ido trabajando. El original, un raw, y el csv que hemos creado tras hacer la limpieza de datos. 
### 📁 imagenes
Aquí hemos almacenado las imágenes de gráficas.
### 📁 notebooks_in_progress
Jupyter notebooks en los que se está trabajando o que están en sucio.
### 📁 notebooks_limpios
Jupyter notebooks ya limpios y ordenados
### 📃 archivos principales
- `📃 notebooks_limpios\01_cronologia_cambios.ipynb`

En este Jupyter notebook hemos realizado una cronología con los cambios y las decisiones que hemos realizado a lo largo del proyecto.
- `📃 notebooks_limpios\02_primer_analisis.ipynb`

En este Jupyter notebook se puede observar el primer análisis que realizamos y del que sacamos las conclusiones para la limpieza que se realiza después.

- `📃 notebooks_limpios\03_limpieza_datos.ipynb`

Archivo utilizado para la transformación de los datos.

- `📃 notebooks_limpios\04_visualización_datos.ipynb`

Jupyter notebook en el que se realizan las distintas gráficas para una visualizar las comparaciones de datos y sacar conclusiones.

- `📃 notebooks_limpios\05_CSVtoMYSQL.ipynb`

Con este archivo creamos una BBDD en nuestro servidor de SQL

- `📃 notebooks_limpios\05.02_Querys_abc.sql`

Archivo de SQL en el que guardamos consultas interesantes para nuestro análisis. 

## 🚀 Retos y Aprendizajes

Durante el desarrollo del proyecto se identificaron varios retos clave:

- **Limpieza y preparación de datos**: El dataset contenía errores, valores nulos y una categorización irregular, lo que requirió un trabajo exhaustivo de limpieza y estandarización para garantizar la fiabilidad del análisis.

- **Transformación de variables cualitativas**: Fue necesario convertir respuestas abiertas y cualitativas en variables cuantificables para poder analizarlas con precisión.

- **Elección adecuada de visualizaciones**: Se priorizaron gráficos claros y comprensibles, como barras y gráficos de sectores adaptados al tipo de variable.

- **Enfoque en la utilidad del análisis**: El mayor reto fue seleccionar y sintetizar los datos de forma que aportaran valor al equipo directivo, facilitando la toma de decisiones basada en evidencia.

## 🔮 Next Steps

- Proponemos a nuestro cliente realizar encuestas periódicas que incluyan factores como relaciones entre compañeros, equilibrio vida-trabajo, reconocimiento, etc.

- Proponer formaciones y actividades motivadoras.

- Detectar principales focos de insatisfacción y plantear mejoras, incluyendo encuestas breves de sugerencias de forma regular.

## 🏁 Conclusiones

- **Rotación en hombres**: Mayor rotación y menor satisfacción laboral, especialmente en hombres por su mayor representación.

- **Salarios bajos y rotación**: Puestos de salario bajo (Técnico de Laboratorio, Representante de Ventas) tienen mayor rotación y menor satisfacción.

- **Factores de abandono**: Relacionado con salarios bajos, poca antigüedad, ausencia de viajes y baja satisfacción, especialmente en RRHH.

- **Satisfacción variable**: Depende del puesto y departamento, es menor en quienes abandonan y desciende con los años en la empresa.

El **65,3 %** de los empleados/as, se fueron en los primeros 5 años de trabajo, lo que muestra una rotación evidente de empelados/as.
Casi el **82%** llevaba menos de 10 años en la empresa. ⟶ early attrition

Los empleados/as que se fueron, **cobraban un 28 % menos** que los que permanecieron en la empresa.

El **58%** era **menor de 30 años** y el **50,3 % solteros/as**

## 📩 Contacto
Si tienes preguntas o sugerencias, no dudes en contactarnos a través de correo electrónico a info@letalinsight.es

✨ ¡Gracias por tu interés en nuestro proyecto y seguimos avanzando! 🎉