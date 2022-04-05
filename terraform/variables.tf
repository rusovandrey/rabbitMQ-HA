variable "region" {
  default = "ru-3"
}

variable "az_zone" {
  default = "ru-3b"
}

variable "selectel_account" {}

variable "project_id" {}

variable "user_name" {}

variable "user_password" {}

variable "sel_token" {}

variable "rmq_instances" {
  type = set(string)
  default = ["rabbit-mq-1", "rabbit-mq-2", "rabbit-mq-3"]
}

variable "volume_type" {
  default = "fast.ru-3b"
}

variable "subnet_cidr" {
  default = "10.10.0.0/24"
}

variable "rmq_ports" {
  type = set(string)
  default = ["5673", "15672", "25672", "4369"]
}

variable "hap_ports" {
  type = set(string)
  default = ["5672", "15672", "9000"]
}
