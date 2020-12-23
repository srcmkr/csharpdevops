echo "***********************************************************************"
echo "****************** STEP 2: CLUSTER INIT, NET, TOKEN *******************"
echo "***********************************************************************"

kubeadm config images pull
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
mkdir /root/.kube
cp /etc/kubernetes/admin.conf /root/.kube/config

kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

echo "***********************************************************************"
echo "************ STEP 3: PLEASE SAVE A COPY OF KUBECTL CONFIG *************"
echo "***********************************************************************"
echo "SCP auf den Master + download der Datei /root/.kube/"

echo "***********************************************************************"
echo "*************** STEP 4: PLEASE EXECUTE ON WORKER NODES ****************"
echo "***********************************************************************"

kubeadm token create --print-join-command