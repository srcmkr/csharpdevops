# ---------------------------------------
# change to your api token here
# ---------------------------------------
variable "hcloud_token" {
    default = "######TOKEN_HIER_EINFÜGEN########"
}

# no changes required below (❁´◡`❁)

# ---------------------------------------
# adding hetzner cloud terraform provider
# ---------------------------------------
terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

# ----------------------------------------
# add (existing) SSH key to login remotely
# ----------------------------------------
resource "hcloud_ssh_key" "default" {
  name = "Default SSH Key"
  public_key = file("test.rsa.pub")
}

# ---------------------------------------
# Adding two servers (1 master + 1 node)
# ---------------------------------------
resource "hcloud_server" "master1" {
 name = "k8s-master-1"
 image = "ubuntu-20.04"
 location = "fsn1"
 server_type = "cx21"
 ssh_keys = [hcloud_ssh_key.default.name]
}

resource "hcloud_server" "node1" {
 name = "k8s-node-1"
 image = "ubuntu-20.04"
 server_type = "cx21"
 ssh_keys = [hcloud_ssh_key.default.name]
}

# ----------------------------------------
# Adding load balancer and point to master
# ----------------------------------------
resource "hcloud_load_balancer" "load_balancer" {
  name       = "load_balancer"
  load_balancer_type = "lb11"
  location   = "fsn1"
  target {
    type = "server"
    server_id = hcloud_server.master1.id
  }
}

resource "hcloud_load_balancer_service" "load_balancer_service" {
    load_balancer_id = hcloud_load_balancer.load_balancer.id
    protocol = "http"
    listen_port = "80"
    destination_port = "30080"
}

# ------------------------------------------
# Get IP to update DNS (point @ and * to IP)
# ------------------------------------------
output "ipv4" {
  value = hcloud_load_balancer.load_balancer.ipv4
}
