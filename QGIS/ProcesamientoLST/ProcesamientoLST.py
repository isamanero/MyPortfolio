# ==============================================================================
# IMPORTACIÓN DE LIBRERÍAS CORE
# ==============================================================================
from qgis.core import *  # Núcleo de QGIS (geometría, capas, proyectos)
from qgis.analysis import QgsRasterCalculator, QgsRasterCalculatorEntry # Motor de álgebra de mapas
import processing        # Acceso a la "Caja de Herramientas" (GDAL, SAGA, Native)
import os                # Gestión de rutas del sistema operativo

# 1. ENTORNO: Capturamos el objeto de la capa seleccionada en la leyenda
layer = iface.activeLayer()

# Validación de seguridad: Evita que el script falle si no hay nada seleccionado
if not layer:
    print("ERROR: Selecciona la capa ráster antes de ejecutar.")
else:
    # Definimos rutas dinámicas usando 'os.path.join' para evitar errores de "/" o "\" entre Windows/Linux
    output_dir = os.path.join(os.path.expanduser("~"), "Desktop")
    path_celsius = os.path.join(output_dir, "LST_Temperatura_Pura.tif")
    path_vector = os.path.join(output_dir, "LST_Suavizado_Final.gpkg")

    # ==========================================================================
    # PASO 1: ÁLGEBRA DE RÁSTER (CÁLCULO FÍSICO)
    # ==========================================================================
    # Para usar la calculadora, QGIS necesita una "entrada" (Entry) que mapee 
    # el archivo físico con una variable (ej: ras@1)
    entry = QgsRasterCalculatorEntry()
    entry.ref = 'ras@1'      # Nombre de la variable dentro de la fórmula
    entry.raster = layer     # Puntero al objeto de la capa
    entry.bandNumber = 1     # La banda térmica suele ser la 1 en productos procesados
    
    # LÓGICA TÉRMICA (Landsat 8/9 C2 como ejemplo):
    # Los satélites guardan datos en DN (Digital Numbers). 
    # La fórmula $LST = (DN \times Multiplier) + Addition$ convierte DN a Kelvin/Celsius.
    # El valor -124.15 ya integra el paso de Kelvin a Celsius (-273.15).
    formula = '(ras@1 * 0.00341802) - 124.15'
    
    # Invocamos el motor de cálculo. 
    # Necesita: fórmula, ruta, formato, extensión espacial, resolución (W/H) y las entradas.
    calc = QgsRasterCalculator(
        formula, path_celsius, 'GTiff', 
        layer.extent(), layer.width(), layer.height(), [entry]
    )
    
    # Ejecutamos. Si devuelve 0, el archivo se escribió correctamente en disco.
    if calc.processCalculation() == 0:
        print("✅ Fase 1: Ráster Celsius creado sin filtros.")

        # ======================================================================
        # PASO 2: VECTORIZACIÓN (MODELO DE DATOS DISCRETO)
        # ======================================================================
        # 'gdal:polygonize' agrupa píxeles adyacentes con el mismo valor.
        # Útil para crear "islas de calor" vectoriales.
        params_poly = {
            'INPUT': path_celsius,
            'BAND': 1,
            'FIELD': 'temp_val',         # Nombre de la columna en la tabla de atributos
            'OUTPUT': 'TEMPORARY_OUTPUT' # Usamos memoria RAM para no saturar el disco
        }
        poly_result = processing.run("gdal:polygonize", params_poly)

        # ======================================================================
        # PASO 3: SUAVIZADO (CHAIKIN'S ALGORITHM)
        # ======================================================================
        # Los vectores derivados de ráster son "escalonados" (efecto sierra).
        # 'native:smoothgeometry' añade nodos intermedios para curvar las líneas.
        params_smooth = {
            'INPUT': poly_result['OUTPUT'],
            'ITERATIONS': 3,             # A más iteraciones, más redondeado (3 es el equilibrio)
            'OUTPUT': path_vector        # Ahora sí, guardamos el resultado final en GeoPackage
        }
        smooth_result = processing.run("native:smoothgeometry", params_smooth)
        print("✅ Fase 2: Vectorización y Suavizado completados.")

        # ======================================================================
        # PASO 4: SIMBOLOGÍA DINÁMICA (GRADUADA)
        # ======================================================================
        # Cargamos el archivo resultante al lienzo de QGIS
        vlayer = iface.addVectorLayer(path_vector, "Temperatura LST Suavizada", "ogr")
        
        # Creamos un renderizador graduado (para datos numéricos continuos)
        renderer = QgsGraduatedSymbolRenderer()
        renderer.setClassAttribute('temp_val') # Campo base para clasificar
        
        # MÉTODOS DE CLASIFICACIÓN:
        # EqualInterval divide el rango (Max-Min) en partes iguales. 
        # Ideal para mapas térmicos donde los saltos de temperatura son constantes.
        method = QgsClassificationEqualInterval()
        renderer.setClassificationMethod(method)
        renderer.updateClasses(vlayer, 5) # Creamos 5 rangos térmicos
        
        # GESTIÓN DE COLOR:
        # Cargamos la rampa 'RdYlGn' (Rojo-Amarillo-Verde).
        ramp = QgsStyle.defaultStyle().colorRamp('RdYlGn')
        ramp.invert() # Invertimos para que Rojo sea Calor y Verde sea Frío
        renderer.updateColorRamp(ramp)
        
        # Aplicamos y refrescamos la vista
        vlayer.setRenderer(renderer)
        vlayer.triggerRepaint()
        
        print("🚀 ¡PROCESO COMPLETADO! Capa cargada al 100%.")