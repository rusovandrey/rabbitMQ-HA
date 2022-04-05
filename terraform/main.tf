terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
     selectel = {
      source  = "selectel/selectel"
      version = "~> 3.6.2"
   }
  }
}

provider "openstack" {
  auth_url    = "https://api.selvpc.ru/identity/v3"
  domain_name = var.selectel_account
  tenant_id   = var.project_id
  user_name   = var.user_name
  password    = var.user_password
  region      = var.region
}

provider "selectel" {
  token = var.sel_token
}

data "openstack_images_image_v2" "centos_image" {
  most_recent = true
  visibility  = "public"
  name        = "CentOS 7 Minimal 64-bit"
}

resource "openstack_compute_flavor_v2" "flavor_server" {
  name      = "arusov-devops-task"
  ram       = "1024"
  vcpus     = "1"
  disk      = "0"
  is_public = "false"
}
