#!/bin/bash
# kubectl kustomize .
# kubectl delete -k .
# kubectl create namespace argocd
# kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
# sleep 30
# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl apply -k .
sleep 5
kubectl port-forward svc/argocd-server -n argocd 8088:443
