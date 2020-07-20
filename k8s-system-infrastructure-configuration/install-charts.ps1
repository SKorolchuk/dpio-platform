kubectl create -f .\local-storage.yaml
kubectl create -f .\local-volume.yaml

helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm install --name consul-controller -f .\consul-values.yaml stable/consul
helm install --name elastic-server -f .\elastic-values.yaml stable/elasticsearch
helm install --name mongodb-ha -f .\mongo-values.yaml stable/mongodb-replicaset
helm install --name postgresql-ha -f .\postgres-values.yaml stable/stolon
helm install --name rabbitmq-ha-cluster -f .\rabbit-values.yaml stable/rabbitmq-ha
helm install --name redis-ha-cluster -f .\redis-values.yaml stable/redis-ha
helm install --name nginx-ingress-controller stable/nginx-ingress