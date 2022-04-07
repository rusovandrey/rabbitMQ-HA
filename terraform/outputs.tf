output "template" {
  value = templatefile("hosts.tmpl",
  {
    "haproxy_ip" = openstack_compute_floatingip_associate_v2.fip_hap.floating_ip
    "rmq1_ip"    = lookup(tomap({for key, pool in openstack_compute_floatingip_associate_v2.fip_rmq : key => pool.floating_ip}), "rabbit-mq-1")
    "rmq2_ip"    = lookup(tomap({for key, pool in openstack_compute_floatingip_associate_v2.fip_rmq : key => pool.floating_ip}), "rabbit-mq-2")
    "rmq3_ip"    = lookup(tomap({for key, pool in openstack_compute_floatingip_associate_v2.fip_rmq : key => pool.floating_ip}), "rabbit-mq-3")
    
  })
}
