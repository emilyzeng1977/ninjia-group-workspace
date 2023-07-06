https://github.com/kubernetes/community/blob/master/contributors/devel/sig-api-machinery/strategic-merge-patch.md
kubectl port-forward svc/ninjia 8091:8081

# Simple pod to use a a test environment
https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/

kubectl exec -i -t dnsutils -- nslookup kubernetes.default
kubectl exec -i -t dnsutils -- nslookup <service-name>.<namespace>
docker pull praqma/network-multitool

kubectl exec -i -t praqma/network-multitool -- nslookup kubernetes.default
kubectl exec -i -t praqma/network-multitool -- nslookup <service-name>.<namespace>

# Ingress
https://kubernetes.io/zh-cn/docs/tasks/access-application-cluster/ingress-minikube/

minikube addons enable ingress
kubectl get pods -n ingress-nginx

