# 🌍 Esperanza de Vida en Europa (1900–2023)

En este proyecto se desarrolló un análisis espacial de la esperanza de vida en Europa entre 1900 y 2023. En primer lugar, se realizó un

Análisis Exploratorio de Datos (EDA) para depurar, estructurar y preparar los datos, garantizando su calidad y consistencia. Posteriormente,

los datos fueron integrados con un shapefile geográfico, permitiendo la visualización espacial y la relación de atributos tabulares con

información geográfica, con el objetivo de generar representaciones precisas y analíticamente útiles de la evolución de la esperanza de vida a

nivel continental.

## 🎯 Objetivo
Analizar y comparar la evolución de la esperanza de vida en Europa entre 1900 y 2023.

Se destacan años clave: 1900, 1918, 1950, 1975, 2000, 2023

Se eligen estos años con atención especial a conflictos históricos y recuperación demografica

---
## 📊 Fuente de datos

CSV original: life-expectancy.csv (Our World in Data)

Rango temporal: 1543–2023

Variable principal: esperanza de vida al nacer

🔗 [Our World in Data – Life Expectancy](https://ourworldindata.org/life-expectancy )

---
## 🛠 Preparación y análisis en Python

Librerías: pandas, geopandas

Procesos principales: Carga y limpieza del CSV, filtrado de países europeos, selección de años clave, exportación de CSVs limpios,unión con

shapefile global (CNTR_RG_20M_2024_4326.shp) y generación del shapefile final europeo.

---
## 🗺 Mapas en QGIS

Cada año se representa como capa independiente con una simbología graduada: 5 clases, intervalos iguales y misma rampa de color.

Se crea una composición A4 vertical con mapas comparativos y como resultado: infografía visual_ev_europa.jpg

---
## 💻 Cómo replicar el proyecto

✅ Requisitos
Python ≥ 3.8
QGIS

1️⃣ Crea una carpeta local dónde trabajar


2️⃣ Descarga los siguientes archivos en esa carpeta: 

-📁CNTR_RG_20M_2024_4326.shp
-📋EDA_life_expectancy.ipynb 
-📔life-expectancy.csv


3️⃣ Ejecutar el notebook 📋EDA_life_expectancy.ipynb 

Selecciona Run All
Se generarán CSVs limpios, y nuestro CSV final (life_europa_years.csv) el shapefile final (europa_life_expectancy.shp con todos sus archivos asociados)


4️⃣ Visualización en QGIS

Abre QGIS y carga la capa europa_life_expectancy.shp

¡Ahora puedes practicar! 🗺️


## 📂 Organización de archivos
ev_europa_1900_2023/
├── CNTR_RG_20M_2024_4326.shp       # Shapefile base
├── EDA_life_expectancy.ipynb        # Notebook de análisis
├── life-expectancy.csv              # CSV original
└── visual_ev_europa.jpg             # Infografía final

---
## 🏆 Resultado

🔸Mapas comparativos por año
🔸Visualización del impacto histórico en la esperanza de vida
🔸Base para análisis espacial y exploración en QGIS

📌 Realizado por Isabel Mañero (2026)
