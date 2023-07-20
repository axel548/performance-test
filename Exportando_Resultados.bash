# Da el resultado completo del test
k6 run --out json=output.json stages.js


# Da el resumen del test
k6 run --summary-export=results.json stages.js


# Instalar herramientas graficas
# Grafana: crear dashboard y verlo de manera visual
https://grafana.com/


# Influxdb
sudo apt install influxdb