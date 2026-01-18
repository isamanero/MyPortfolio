Requisitos previos
Antes de comenzar, asegúrate de tener instalados:
•	Python (recomendado >= 3.8)
•	QGIS (para visualizar los shapefiles generados)

1️⃣ Clona el repositorio
Abre la terminal (o Visual Studio Code con terminal integrada) y ejecuta:

git clone https://tu-repositorio.git
cd tu-repositorio


2️⃣ Instala las dependencias
Ejecuta el siguiente comando para instalar todas las librerías necesarias:

pip install -r requirements.txt

Esto instalará automáticamente paquetes como pandas, geopandas y cualquier otra dependencia utilizada en el proyecto.

3️⃣ Ejecuta el notebook
Abre Jupyter Notebook o JupyterLab y carga el archivo:
EDA_esperanza_de_vida.ipynb
Selecciona Run All para ejecutar todas las celdas.
•	Durante la ejecución, se generarán múltiples CSVs que registran los datos filtrados y transformados.
•	También se generará la capa final de shapefile (SHP) con los datos de esperanza de vida en Europa.

4️⃣ Archivos generados
Todos los CSV generados durante el EDA se guardan en la carpeta: generated_files
Todos los archivos asociados al shapefile se guardan en la carpeta: europa_life_expectancy_shp
Incluye archivos .shp, .shx, .dbf, .prj, etc.
•	Listos para abrir directamente en QGIS y explorar mapas interactivos con la información de esperanza de vida.

5️⃣ Uso en QGIS
•	Abre QGIS y carga la capa desde la carpeta Europa_Life_Expectancy_SHP.
•	Ahora puedes visualizar, analizar y crear mapas interpretativos de la esperanza de vida en Europa.