variable auth_url { }
variable tenant_id { }
variable tenant_name { }
variable public_key { }
variable keypair_name { }
variable cluster_name { }
variable datacenter { }
variable master_flavor { }
variable node_flavor { }
variable image_name { }
variable master_count { }
variable node_count { }
variable floating_pool { }
variable external_net_id { }

provider "openstack" {
  auth_url = "${ var.auth_url }"
  tenant_id = "${ var.tenant_id }"
  tenant_name = "${ var.tenant_name }"
}

module "openshift-keypair" {
  source = "./keypair"
  public_key = "${ var.public_key }"
  keypair_name = "${ var.keypair_name }"
}

module "openshift-secgroup" {
  source = "./secgroup"
  cluster_name = "${ var.cluster_name }"
}

module "openshift-hosts-floating" {
  source = "./hosts"
  datacenter = "${ var.datacenter }"
  master_flavor = "${ var.master_flavor }"
  node_flavor = "${ var.node_flavor }"
  image_name = "${ var.image_name }"
  keypair_name = "${ module.openshift-keypair.keypair_name }"
  security_groups = "${ module.openshift-secgroup.cluster_name }"
  master_count = "${ var.master_count }"
  node_count = "${ var.node_count }"
  floating_pool = "${ var.floating_pool }"
  external_net_id = "${ var.external_net_id }"
}
