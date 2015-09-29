# Terraform Variable Definitions
#

auth_url = ""
tenant_id = ""
tenant_name = ""
master_count = 1
node_count = 4
public_key = ""
keypair_name = ""
cluster_name = ""
datacenter = ""
master_flavor = ""
node_flavor = ""
image_name = ""
keypair_name = "${ module.openshift-keypair.keypair_name }"
security_groups = "${ module.openshift-secgroup.cluster_name }"
floating_pool = ""
external_net_id = ""
