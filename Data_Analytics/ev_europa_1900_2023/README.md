# 🌍 Esperanza de Vida en Europa (1900–2023)
## 🎯 Objetivo
Analizar y comparar la evolución de la esperanza de vida en Europa entre 1900 y 2023.

Se destacan años clave: 1900, 1918, 1950, 1975, 2000, 2023

Atención especial a conflictos históricos y recuperación sanitaria

Visualización mediante mapas temáticos por país

---
## 📊 Fuente de datos

CSV original: life-expectancy.csv (Our World in Data)

Rango temporal: 1543–2023

Variable principal: esperanza de vida al nacer

🔗 [Our World in Data – Life Expectancy](https://ourworldindata.org/life-expectancy )

---
## 🛠 Preparación y análisis en Python

Librerías: pandas, geopandas

Procesos principales: Carga y limpieza del CSV, filtrado de países europeos, selección de años clave, exportación de CSVs limpios,unión con shapefile global (CNTR_RG_20M_2024_4326.shp)y generación del shapefile final europeo.

---
## 🗺 Mapas en QGIS

Cada año se representa como capa independiente con una simbología graduada: 5 clases, intervalos iguales y misma rampa de color.
Se crea una composición A4 vertical con mapas comparativos y como resultado: infografía visual_ev_europa.jpg

---
## 💻 Cómo replicar el proyecto
✅ Requisitos
Python ≥ 3.8
QGIS

1️⃣ Clonar el repositorio

```bash
git clone https://github.com/isamanero/MyPortfolio.git
cd MyPortfolio/Data_Analytics/ev_europa_1900_2023
```

2️⃣ Instalar dependencias
```bash
pip install -r requirements.txt
```
3️⃣ Ejecutar el notebook

EDA_life_expectancy.ipynb

Selecciona Run All

Se generarán CSVs limpios y el shapefile final

4️⃣ Archivos generados

CSVs limpios: generated_files/

Shapefile final: Europa_Life_Expectancy_SHP/

Incluye .shp, .shx, .dbf, .prj

Listo para abrir en QGIS

5️⃣ Visualización en QGIS

Abre QGIS y carga la capa desde Europa_Life_Expectancy_SHP/

Explora mapas por año y analiza la evolución de la esperanza de vida

## 📂 Organización de archivos
ev_europa_1900_2023/
├── CNTR_RG_20M_2024_4326.shp       # Shapefile base
├── EDA_life_expectancy.ipynb        # Notebook de análisis
├── life-expectancy.csv              # CSV original
├── requirements.txt                 # Librerías necesarias
├── generated_files/                 # CSVs limpios
├── Europa_Life_Expectancy_SHP/      # Shapefiles finales
└── visual_ev_europa.jpg             # Infografía final

---
## 🏆 Resultado

🔸Mapas comparativos por año
🔸Visualización del impacto histórico en la esperanza de vida
🔸Base para análisis espacial y exploración en QGIS

📌 Realizado por Isabel Mañero (2026)
