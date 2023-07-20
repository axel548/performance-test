#!/bin/bash

# Iniciar InfluxDB
influxd &

# Iniciar Grafana
service grafana-server start

# Mantener el contenedor en ejecución para que los servicios no se detengan
tail -f /dev/null
