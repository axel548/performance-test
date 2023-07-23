# Da el resultado completo del test
k6 run --out json=output.json stages.js


# Da el resumen del test
k6 run --summary-export=results.json stages.js


# Instalar herramientas graficas
# Grafana: crear dashboard y verlo de manera visual
https://grafana.com/


# Influxdb
sudo apt install influxdb



# Mandar el resultado a influxdb
k6 run --out influxdb=http://localhost:8086/mk6db {tests.js}





# Grafana Cloud
k6 login cloud -t {token}
k6 run --out cloud {tests.js}


# New relic y k6

# Crear contenedor de new relic
docker run --rm \
  -d \
  --name newrelic-statsd \
  -h $(hostname) \
  -e NR_ACCOUNT_ID=4030086 \
  -e NR_API_KEY="NRAK-587KLX221VOD6R6FHHMHW1ZYEU0" \
  -p 8125:8125/udp \
  newrelic/nri-statsd:latest


k6 run --out statsd script.js

# query builder
select sum(k6.http_req_duration.sum.percentiles) AS '90th' from Metric where percentile = 90 timeseries