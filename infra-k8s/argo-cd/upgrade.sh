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
# obtain pwd for admin
# kubectl get pod -n argocd |grep argocd-server

# Guide to learn rollouts
# https://wghdr.top/archives/1724
# brew install argoproj/tap/kubectl-argo-rollouts

# https://www.eksworkshop.com/docs/automation/gitops/
# https://catalog.workshops.aws/eks-blueprints-terraform/en-US/060-argo-rollout/1-enable-argo-rollout