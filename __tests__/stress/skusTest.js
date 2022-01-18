import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
  stages: [
    { duration: '10s', target: 0 },
    { duration: '10s', target: 10 },
    { duration: '10s', target: 100 },
    { duration: '10s', target: 1000 },
    { duration: '10s', target: 100 },
    { duration: '10s', target: 10 },
    { duration: '10s', target: 0 },
  ],
};

export default function () {

  let res = http.get(
    `http://localhost:3002/products/1/styles`);
    sleep(1);
    check(res, {
      'status was 200': (r) => r.status === 200
    });
}