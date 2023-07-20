import http from "k6/http"
import { Gauge } from "k6/metrics"

export const options = {
    vus: 10,
    duration: "20s"
}

const waitingTime = new Gauge("waiting_time")

export default function(){
    const request = http.get("https://api.escuelajs.co/api/v1/users")

    waitingTime.add(request.timings.waiting + request.timings.sending)
    console.log(waitingTime.name)
}
