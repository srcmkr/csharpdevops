### Namespace, Configmap und Serviceaccount für den Ingress anlegen
```
kubectl apply -f yamls/001-create-ns_config_sa.yaml
```

### Ingress Controller aktivieren
**WICHTIG:** Zeile 171 anpassen (auf deine primäre Domain)  
Die Angabe hat keine Auswirkung auf die weiteren Deployments - du kannst in den Schritten 4 und 5 trotzdem jede (Sub-) Domain nutzen, die gerade zur Verfügung steht.  
```
kubectl apply -f yamls/002-create-ingress-controller-change_line-171.yaml
```

### Default-Service (=Seite bei z.B. Fehler 404)
```
kubectl apply -f yamls/003-create-backend-service.yaml
```

### Zwei Demo-Apps deployen
**WICHTIG:** Zeile 50 anpassen (auf deine Domain)
```
kubectl apply -f yamls/004-create-sampleapp1-change_line-50.yaml
```  
```
kubectl apply -f yamls/005-create-sampleapp2-change_line_50.yaml
```