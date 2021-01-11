## Schritt 1: K8s Cluster erstellen  
- Auf allen Nodes ```curl -s -L https://raw.githubusercontent.com/srcmkr/csharpdevops/master/002%20-%20Auto%20deploy%20kubernetes%20with%20shell%20scripts/scripts/step1-allnodes.sh | sh -```  
- Auf dem Master ```curl -s -L https://raw.githubusercontent.com/srcmkr/csharpdevops/master/002%20-%20Auto%20deploy%20kubernetes%20with%20shell%20scripts/scripts/step2-masteronly.sh | sh -```  

## Schritt 2: Helm lokal installieren
https://helm.sh/docs/intro/install/  
(Experimental Windows AMD64 => Unzip der .exe in $PATH)  
Test auf erfolgreiche Installation: ```helm version```  

## Schritt 3: Prometheus Stack lokal hinzufügen
```helm repo add prometheus-community https://prometheus-community.github.io/helm-charts```  
```helm repo add stable https://charts.helm.sh/stable```  
```helm repo update```  

## Schritt 4: Prometheus im K8s installieren
$ ```kubectl create namespace prometheus```  
$ ```helm install prometheus prometheus-community/kube-prometheus-stack --namespace prometheus```  
$ ```kubectl get pods -n prometheus```  

## Schritt 5: Ingress installieren
$ ```kubectl apply -f https://raw.githubusercontent.com/srcmkr/csharpdevops/master/003%20-%20Ingress%20for%20Hetzner%20with%20Loadbalancer/yamls/001-create-ns_config_sa.yaml```  
$ ```kubectl apply -f https://raw.githubusercontent.com/srcmkr/csharpdevops/master/003%20-%20Ingress%20for%20Hetzner%20with%20Loadbalancer/yamls/002-create-ingress-controller-change_line-171.yaml```  
$ ```kubectl apply -f https://raw.githubusercontent.com/srcmkr/csharpdevops/master/003%20-%20Ingress%20for%20Hetzner%20with%20Loadbalancer/yamls/003-create-backend-service.yaml```  

Danach: Ingress für Grafana hinzufügen (Zeile 11 anpassen):
$ ```kubectl apply -f deploy-grafana.yaml```

## Schritt 6: 
URL aus deploy-grafana.yaml, Zeile 11 aufrufen
login: admin // prom-operator

## Schritt 7:
Dashboards wählen / einrichten  
Große Auswahl: https://grafana.com/grafana/dashboards?dataSource=prometheus&direction=desc&orderBy=downloads  

Beispiel: https://grafana.com/grafana/dashboards/7249  
  
Änderung des Default Dashboards: https://monitoring.d3v.to/profile  
oder: https://monitoring.d3v.to/org