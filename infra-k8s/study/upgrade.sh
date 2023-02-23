#!/bin/bash -ex

kubectl delete -k .
kubectl apply -k .

sleep 5
kubectl logs secret-pod
