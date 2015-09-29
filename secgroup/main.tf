variable cluster_name { }

resource "openstack_compute_secgroup_v2" "cluster" {
    name = "${ var.cluster_name }"
    description = "OSEV3 Security Group for ${ var.cluster_name }"
    rule {
       from_port = -1
       to_port = -1
       ip_protocol = "icmp"
       self = true
     }
     rule {
       from_port = 22
       to_port = 22
       ip_protocol = "tcp"
       cidr = "0.0.0.0/0"
     }
     rule {
       from_port = 53
       to_port = 53
       ip_protocol = "tcp"
       cidr = "0.0.0.0/0"
     }
     rule {
       from_port = 80
       to_port = 80
       ip_protocol = "tcp"
       cidr = "0.0.0.0/0"
     }
     rule {
       from_port = 443
       to_port = 443
       ip_protocol = "tcp"
       cidr = "0.0.0.0/0"
     }
     rule {
       from_port = 1936
       to_port = 1936
       ip_protocol = "tcp"
       cidr = "0.0.0.0/0"
     }
     rule {
       from_port = 4001
       to_port = 4001
       ip_protocol = "tcp"
       cidr = "0.0.0.0/0"
     }
     rule {
       from_port = 7001
       to_port = 7001
       ip_protocol = "tcp"
       cidr = "0.0.0.0/0"
     }
     rule {
       from_port = 8443
       to_port = 8444
       ip_protocol = "tcp"
       cidr = "0.0.0.0/0"
     }
     rule {
       from_port = 10250
       to_port = 10250
       ip_protocol = "tcp"
       cidr = "0.0.0.0/0"
     }
     rule {
       from_port = 24224
       to_port = 24224
       ip_protocol = "tcp"
       cidr = "0.0.0.0/0"
     }
     rule {
         from_port = 53
         to_port = 53
         ip_protocol = "udp"
         cidr = "0.0.0.0/0"
     }
     rule {
         from_port = 4789
         to_port = 4789
         ip_protocol = "udp"
         cidr = "0.0.0.0/0"
     }
     rule {
         from_port = 24224
         to_port = 24224
         ip_protocol = "udp"
         cidr = "0.0.0.0/0"
     }
    rule {
        from_port = 1
        to_port = 65535
        ip_protocol = "tcp"
        self = true
    }
    rule {
        from_port = 1
        to_port = 65535
        ip_protocol = "udp"
        self = true
    }
}

output "cluster_name" {
    value = "${ openstack_compute_secgroup_v2.cluster.name }"
}
