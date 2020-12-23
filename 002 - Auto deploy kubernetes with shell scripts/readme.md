### Der "Fast"-automatische Deploy von Kuberenetes auf Bare-Metal Hetzner Cloud

Auf allen Nodes (Master und Worker) ausführen:
```
curl -s -L https://raw.githubusercontent.com/srcmkr/csharpdevops/master/002%20-%20Auto%20deploy%20kubernetes%20with%20shell%20scripts/scripts/step1-allnodes.sh | sh -
```
(Vorher anschauen: https://github.com/srcmkr/csharpdevops/blob/master/002%20-%20Auto%20deploy%20kubernetes%20with%20shell%20scripts/scripts/step1-allnodes.sh)

Nur auf dem Master ausführen:
```
curl -s -L https://raw.githubusercontent.com/srcmkr/csharpdevops/master/002%20-%20Auto%20deploy%20kubernetes%20with%20shell%20scripts/scripts/step2-masteronly.sh | sh -
```
(Vorher anschauen: https://github.com/srcmkr/csharpdevops/blob/master/002%20-%20Auto%20deploy%20kubernetes%20with%20shell%20scripts/scripts/step2-masteronly.sh)

