minikube delete

minikube start --vm-driver=virtualbox

#To point your shell to minikube's docker-daemon, run:
eval $(minikube docker-env)
#
docker build -t nginx       ./srcs/build_images/nginx
docker build -t phpmyadmin  ./srcs/build_images/phpmyadmin
docker build -t wordpress   ./srcs/build_images/wordpress
docker build -t mysql       ./srcs/build_images/mysql
docker build -t influxdb    ./srcs/build_images/influxdb
docker build -t ftps       ./srcs/build_images/ftps
docker build -t grafana    ./srcs/build_images/grafana
# 
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
#
kubectl apply -f ./srcs/metallb.yaml
#
kubectl apply -f ./srcs/build_images/ftps/srcs/ftps.yaml
kubectl apply -f ./srcs/build_images/Grafana/srcs/Grafana.yaml
kubectl apply -f ./srcs/build_images/nginx/srcs/nginx.yaml
kubectl apply -f ./srcs/build_images/mysql/srcs/mysql.yaml
kubectl apply -f ./srcs/build_images/wordpress/srcs/wordpress.yaml
kubectl apply -f ./srcs/build_images/phpmyadmin/srcs/phpmyadmin.yaml
kubectl apply -f ./srcs/build_images/influxdb/srcs/influxdb.yaml
minikube dashboard