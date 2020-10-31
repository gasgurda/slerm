# Ingress
1)Create ingress nginx controller
```sh
kubectl apply -f nginx-controller/deploy.yaml
```
2)Change service for nginx controller, before that change external ip for ingress controller in file 
```sh
nginx-controller/service-nodeport-nginx-controller.yml
kubectl apply -f nginx-controller/service-nodeport-nginx-controller.yml
```
3)apply ingress rules
```sh
kubectl apply -f ingress.yaml
```
# Ceph
1) Create OSD pool on ceph cluster
```sh
ceph osd pool create kube 8 8
```
2) Create client for kube pool
```sh
ceph auth add client.kube mon 'allow r' osd 'allow rwx pool=kube'
```
3) Get client token (save it)
```sh
ceph auth get-key client.kube
```
4) Get admin token (save it)
```sh
ceph auth get client.admin 2>&1 |grep "key = " |awk '{print  $3'}
```
5) Create ceph client secret on in kubernates cluster ($CLIENT_TOKEN - we took it in №3)
```sh
echo $CLIENT_TOKEN > /tmp/key.client
secret --from-file=/tmp/key.client --namespace=kube-system --type=kubernetes.io/rbd
```
6)Create ceph admin secret on in kubernates cluster ($ADMIN_TOKEN - we took it in №4)
```sh
echo $ADMIN_TOKEN > /tmp/key.admin
kubectl create secret generic ceph-admin-secret --from-file=/tmp/key.admin --namespace=kube-system --type=kubernetes.io/rbd
```
7)Install ceph.com/rbd provisioner
```sh
cd ./ceph/rbd/deploy
NAMESPACE=kube-system
sed -r -i "s/namespace: [^ ]+/namespace: $NAMESPACE/g" ./rbac/clusterrolebinding.yaml ./rbac/rolebinding.yaml
kubectl -n $NAMESPACE apply -f ./rbac
```
8) Change ip monitors in storage-class.yaml and apply
```sh
kubectl apply -f storage-class.yaml
```
9) Install ceph-common package to worker nodes
```sh
yum install ceph-common
```
10) Create PersistentVolumeClaim
```sh
kubectl apply -f claim.yaml
```
11)For test create 2 pods witch mounted claim
```sh
kubectl apply -f create-file-pod.yaml
kubectl apply -f test-pod.yaml
```
12) Check test.txt file
```sh
kubectl exec test-pod -ti sh
cat /mnt/test/test.txt
```
