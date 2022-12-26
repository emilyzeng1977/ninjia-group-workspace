#!/bin/bash -ex

kubectl apply -k .

sleep 3

kubectl port-forward service/traefik-dashboard-service 8080:8080

