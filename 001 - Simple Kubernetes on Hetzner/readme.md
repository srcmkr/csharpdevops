# kubernetes-on-hetzner

Videoanleitung:
https://www.youtube.com/watch?v=6VUlLha0HxA&

1. SSH-Key für Hetzner erstellen
```
ssh-keygen -t ed25519 -C "Kommentar" -f id_rsa
```

2. Netzwerk erstellen
3. Für alle Nodes via SSH:
```
swapoff -a; sed -i '/swap/d' /etc/fstab
```
und
```
sysctl settings for Kubernetes networking
cat >>/etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system
```
4. Auf allen Nodes docker installieren:
```
apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update
apt install -y docker-ce=5:19.03.10~3-0~ubuntu-focal containerd.io
```
5. Auf allen Nodes Kubernetes installieren:
```
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
apt update && apt install -y kubeadm=1.18.5-00 kubelet=1.18.5-00 kubectl=1.18.5-00
```
6. Nur auf dem Master: Cluster initialisieren ("public-IP" und "private-network" ersetzen!):
```
kubeadm init --apiserver-advertise-address=<public-IP> --pod-network-cidr=<private-network>  --ignore-preflight-errors=all
```
7. Auf dem Master das Calico-Netzwerk installieren:
```
kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://docs.projectcalico.org/v3.14/manifests/calico.yaml
```
8. Auf dem Master den Befehl zum Joinen erstellen lassen:
```
kubeadm token create --print-join-command
```
9. Join-Befehl auf allen Nodes ausführen
10. Kubernetes-Admin-Konfiguration in Homeverzeichnis kopieren, um kubectl "freizuschalten"
```
cd ~
cp /etc/kubernetes/admin.conf .kube/config
```

Viel Spaß!
