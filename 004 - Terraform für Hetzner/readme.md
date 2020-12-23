## Anforderung 1: Projekt und API-Schlüssel
Ein bestehendes Projekt bei Hetzner Cloud, sowie ein gültiger API-Schlüssel für dieses.  
Der API-Schlüssel muss in die Zeile 3 der .tf-Datei.  
Aus ```default = "######TOKEN_HIER_EINFÜGEN########"``` wird dann z.B. ```default = "abc123abc123"```  
Der Inhalt der Datei "test.rsa.pub" muss mit dem Public Key aus dem SSH-Keypair ausgetauscht werden. Alternativ kann die Zeile 30 der 001-kubernetes-cluster.tf angepasst werden (z.B. auf ~/ssh/id_rsa.pub)  

## Anforderung 2: Terraform
Terraform kann hier heruntergeladen werden: https://www.terraform.io/downloads.html  
Es ist keine Installation notwendig (portable .exe / binary)  
Die .exe-Datei entpackt ihr in einen Ordner, der in $PATH beinhaltet ist  

### Los gehts
Im diesem Verzeichnis (004 - Terraform für Hetzner) können vom lokalen Rechner folgende Befehle ausgeführt werden:  
```$ terraform init``` (= automatischer Download der Abhängigkeiten, muss einmalig durchgeführt werden)  
```$ terraform apply``` (= .tf-Datei wird angewendet, der Stand wird protokolliert und gespeichert)  
```$ terraform destroy``` (alles was angelegt/geändert wurde, wird restlos wieder entfernt)  

### Fertig?
Automatisch wurden ein Clustermaster, eine Workernode und der passende Loadbalancer angelegt.  
Der Wert "ipv4" in grün zeigt die IP-Adresse, auf welche die DNS-Einträge (A-Record für @ und *) zeigen müssen, damit der Ingress innerhalb des Clusters funktioniert.

### Weiterführende Dokumentation
Komplette Terraform-Doku für den Hetzner Provider: https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs  
Provider-Quellcode: https://github.com/hetznercloud/terraform-provider-hcloud