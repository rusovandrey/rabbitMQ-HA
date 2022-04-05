resource "openstack_blockstorage_volume_v3" "volume_hap" {
  name                 = "haproxy-volume"
  size                 = "5"
  image_id             = data.openstack_images_image_v2.centos_image.id
  volume_type          = var.volume_type
  availability_zone    = var.az_zone
  enable_online_resize = true
  lifecycle {
    ignore_changes = [image_id]
  }
}

resource "openstack_compute_instance_v2" "haproxy" {
  name              = "haproxy"
  flavor_id         = openstack_compute_flavor_v2.flavor_server.id
  key_pair          = openstack_compute_keypair_v2.key_tf.id
  availability_zone = var.az_zone
  network {
    uuid = openstack_networking_network_v2.network_tf.id
  }

 /* security_groups = [
    openstack_compute_secgroup_v2.ssh.id,
    openstack_compute_secgroup_v2.hap.id,
  ]
*/

  block_device {
    uuid             = openstack_blockstorage_volume_v3.volume_hap.id
    source_type      = "volume"
    destination_type = "volume"
    boot_index       = 0
  }
  vendor_options {
    ignore_resize_confirmation = true
  }
  lifecycle {
    ignore_changes = [image_id]
  }
}

resource "openstack_networking_floatingip_v2" "fip_hap" {
    pool            = "external-network"
}

resource "openstack_compute_floatingip_associate_v2" "fip_hap" {
    floating_ip     = openstack_networking_floatingip_v2.fip_hap.address
    instance_id     = openstack_compute_instance_v2.haproxy.id
}
