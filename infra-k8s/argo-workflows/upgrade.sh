#!/bin/bash -ex
# kubectl kustomize .
lsof -ti:2746 | xargs kill -9
echo -n ${AWS_ACCESS_KEY_ID_VAL} > ./permissions/AWS_ACCESS_KEY_ID
echo -n ${AWS_SECRET_ACCESS_KEY_VAL} > ./permissions/AWS_SECRET_ACCESS_KEY
echo -n ${AWS_DEFAULT_REGION_VAL} > ./permissions/AWS_DEFAULT_REGION
kubectl apply -k .
rm ./permissions/AWS_ACCESS_KEY_ID
rm ./permissions/AWS_SECRET_ACCESS_KEY
rm ./permissions/AWS_DEFAULT_REGION
echo "hello"
#kubectl -n argo port-forward deployment/argo-server 2746:2746
kubectl -n argo port-forward service/argo-server 2746:2746
