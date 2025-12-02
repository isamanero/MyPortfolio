#Importaciones de módulos necesarios

from qgis.core import (
    QgsProject, QgsVectorLayer, QgsFeature, QgsGeometry, QgsPointXY,
    QgsFields, QgsField, QgsVectorFileWriter, QgsWkbTypes
)
from PyQt5.QtCore import QVariant
import math, os

# Ruta completa al GeoPackage
gpkg_path = r"Tu_ruta(en este caso es un GeoPackage)"

# Nombre de la capa dentro del GPKG
layer_name = "Nombre de tu capa"

# Cargar capa desde el geopackage
uri = f"{gpkg_path}|layername={layer_name}"
layer = QgsVectorLayer(uri, layer_name, "ogr")

if not layer.isValid():
    raise Exception(f"No se pudo cargar la capa '{layer_name}' desde {gpkg_path}")

# Extraer puntos
points = []
for feat in layer.getFeatures():
    geom = feat.geometry()
    if geom.type() == QgsWkbTypes.PointGeometry:
        p = geom.asPoint()
        points.append(QgsPointXY(p.x(), p.y()))

if len(points) < 3:
    raise Exception("La capa necesita al menos 3 puntos para crear un polígono.")

# Ordenar puntos alrededor del centro
cx = sum(p.x() for p in points) / len(points)
cy = sum(p.y() for p in points) / len(points)

points_sorted = sorted(points, key=lambda p: math.atan2(p.y() - cy, p.x() - cx))

# Cerrar polígono
ring = points_sorted + [points_sorted[0]]

# Crear capa de salida, nuestra futura capa de poligono (shapefile)
out_path = r"Tu ruta de salida"

fields = QgsFields()
fields.append(QgsField("id", QVariant.Int))

writer = QgsVectorFileWriter(
    out_path,
    "UTF-8",
    fields,
    QgsWkbTypes.Polygon,
    layer.crs(),
    "ESRI Shapefile"
)

feat = QgsFeature()
feat.setFields(fields)
feat.setAttribute("id", 1)
feat.setGeometry(QgsGeometry.fromPolygonXY([ring]))

writer.addFeature(feat)
del writer

print(f"Polígono creado en: {out_path}")

#¡LISTO! Espero qu te sirva - Isabel Mañero
