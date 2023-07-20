# Definir la imagen base para k6
FROM loadimpact/k6:latest as k6

# Etiqueta para identificar el contenedor
LABEL maintainer="Axel axel.aatl@gmail.com"

# Instalar dependencias para Grafana e InfluxDB
RUN apt-get update \
    && apt-get install -y wget gnupg2 curl \
    && wget -q -O - https://packages.grafana.com/gpg.key | apt-key add - \
    && echo "deb https://packages.grafana.com/oss/deb stable main" | tee -a /etc/apt/sources.list.d/grafana.list \
    && curl -sL https://repos.influxdata.com/influxdb.key | apt-key add - \
    && echo "deb https://repos.influxdata.com/debian buster stable" | tee /etc/apt/sources.list.d/influxdb.list \
    && apt-get update

# Instalar Grafana e InfluxDB
RUN apt-get install -y grafana influxdb

# Copiar el archivo de configuración de Grafana
COPY grafana.ini /etc/grafana/grafana.ini

# Exponer los puertos para Grafana e InfluxDB
EXPOSE 3000 8086

# Copiar el script para iniciar los servicios
COPY start_services.sh /usr/bin/start_services.sh

# Asignar permisos de ejecución al script
RUN chmod +x /usr/bin/start_services.sh

# Comando para iniciar los servicios (Grafana e InfluxDB)
CMD ["/usr/bin/start_services.sh"]
