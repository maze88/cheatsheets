#KUBERNETES
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.7/components.yaml  # setup monitoring with metrics-server, then can use `kubectl top ...`.
kubectl get pods -o custom-columns='NAME:metadata.name,IMAGE:spec.containers[*].image'  # list images used in all containers in all pods.
kubectl get svcs -o custom-columns='NAME:.metadata.name,PORTS:.spec.ports[*].port' svc  # get all external ports of all services.
kubectl patch configmap www -p "$(cat patch.yaml)"  # applied changes in patch.yaml to configmap 'www'.
kubectl wait --for=condition=available deployment web  # wait for deployment 'web' to be available.
kubectl wait --for=condition=ready pod -l app=foo  # wait for pods with label 'app=foo' to be ready.
kubectl wait --for=condition=complete job/myjob  # wait for job 'myjob' to be complete.
kubectl expose deployment web-deployment --name web-svc --port=80 --target-port=5000  # imperativley create service web-svc for deployment web-deployment.
kubectl port-forward svc/kibana 5601  # expose kibana service over localhost:5601.
kubectl port-forward PODNAME HOSTPORT:PODPORT  # forward a port from within a pod (its container) to my localhost.

# MINIKUBE
eval $(minikube docker-env)  # exports the minikube VM to local env, in which we can (for instance) build a docker image directly into minikube.
minikube service SERVICENAME --url  # display the relative local url for SERVICENAME on minikube node.
minikube tunnel  # TBD
