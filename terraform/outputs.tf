output "rmq_fixed_ips" {
    value = tomap({
    for key, pool in openstack_compute_floatingip_associate_v2.fip_rmq : key => pool.floating_ip
  })
}

output "hap_fixed_ip" {
    value     = openstack_compute_floatingip_associate_v2.fip_hap.floating_ip
}