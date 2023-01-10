#!/bin/bash -ex

kubectl apply -k .

sleep 1

kubectl -n traefik port-forward service/traefik-web-service 8081:80

