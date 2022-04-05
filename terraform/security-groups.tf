/*resource "openstack_compute_secgroup_v2" "hap" {
  name        = "hap"
  description = "Open input hap port"
  dynamic "rule" {
    for_each = var.hap_ports
    content {
      from_port   = rule.value
      to_port     = rule.value
      ip_protocol = "tcp"
      cidr        = "0.0.0.0/0"
    }
    
  }
}

resource "openstack_compute_secgroup_v2" "rmq" {
  name        = "rmq"
  description = "Open input rmq port"
  dynamic "rule" {
    for_each = var.rmq_ports
    content {
      from_port   = rule.value
      to_port     = rule.value
      ip_protocol = "tcp"
      cidr        = var.subnet_cidr
    }
    
  }
}

# Open Apache2 port
resource "openstack_compute_secgroup_v2" "ssh" {
  name        = "ssh"
  description = "Open input ssh port"
  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}
*/