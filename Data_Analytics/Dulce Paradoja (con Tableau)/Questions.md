-¿ Cuáles son los 3 países que mayor impacto económico y rendimiento de cultivo (tn por ha) respecto al cultivo de Sugarcane? df_sugarcane_cc --> Con Economic_Impact_Million_USD Y Crop_Yield_MT_per_HA representamos que la INDIA se encuentra en el top 3 (y es el país que coincide con el otro csv)

- ¿Es el cultivo de Sugarcane en la INDIA el de mayor relevancia?:
    df[df['Country'] == 'India']['Crop_Type'].value_counts()--> Su segundo cultivo más importante

-¿Cuál es la evolución del consumo de la INDIA en comparación con otros países? Consumo de azúcar general desde 1960 a 1990 (observar tendencia)--> df_sugar

- Repercusión de sus cultivos en el impacto ambiental y económico, en comparación con el resto de países (ver usos de pesticidas, fertilizantes, CO2,) economica (Economic_Impact_Million_USD)

- Niveles de salud INDIA (df_sugar) (Diabetes, Obesidad): Tablas de correlación(para ver Obesidad VS Consumo promedio azucar/dia) (en ambos data frames)

