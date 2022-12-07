#!/bin/bash -ex
# kubectl kustomize .
export AWS_ACCESS_KEY_ID_VAL="access_key_id_123"
export AWS_SECRET_ACCESS_KEY_VAL="secret_access_key_123"
export AWS_DEFAULT_REGION_VAL="default_region_123"
echo -n ${AWS_ACCESS_KEY_ID_VAL} > ./permissions/AWS_ACCESS_KEY_ID
echo -n ${AWS_SECRET_ACCESS_KEY_VAL} > ./permissions/AWS_SECRET_ACCESS_KEY
echo -n ${AWS_DEFAULT_REGION_VAL} > ./permissions/AWS_DEFAULT_REGION
kubectl apply -k .
rm ./permissions/AWS_ACCESS_KEY_ID
rm ./permissions/AWS_SECRET_ACCESS_KEY
rm ./permissions/AWS_DEFAULT_REGION
kubectl -n argo port-forward deployment/argo-server 2746:2746
