import { check } from "k6";
import http from "k6/http";

export const options = {
    vus: 20,
    duration: "20s",
    thresholds: {
        http_req_failed: ["rate<0.1"]
    }
};

export default function () {
    const reponse = http.get("https://api.escuelajs.co/api/v1/products/1");

    check(response, {
        "statusCode is 200": (r) => r.status === 200,
    });
}