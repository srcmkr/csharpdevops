echo "***********************************************************************"
echo "****************** STEP 1: KEYS, REPOS, DOCKER, K8S *******************"
echo "***********************************************************************"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update

sudo apt-get install -y docker-ce=5:19.03.13~3-0~ubuntu-$(lsb_release -cs) kubelet=1.19.4-00 kubeadm=1.19.4-00 kubectl=1.19.4-00
sudo apt-mark hold docker-ce kubelet kubeadm kubectl

echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p