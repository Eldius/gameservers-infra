
variable "region" {}

variable "name_prefix" {}
variable "machine_type" {}
variable "user_data" {}

variable "disk_type" {
  default = "pd-ssd"
}

variable "disk_size" {}
variable "disk_image" {}

variable "disk_create_local_exec_command_or_fail" {
  default = ":"
}

variable "disk_create_local_exec_command_and_continue" {
  default = ":"
}

variable "disk_destroy_local_exec_command_or_fail" {
  default = ":"
}

variable "disk_destroy_local_exec_command_and_continue" {
  default = ":"
}

variable "servers_count" {
  description = "How much servers to create"
  default     = 1
}

variable "playbook" {
  description = "Playbook to execute"
  default     = ""
}

variable "instance_size" {
  description = "Server Size"
  default     = ""
}

variable "instance_name_pattern" {
  description = "Instance name pattern"
  default     = ""
}

variable "game_name" {
  description = "Game name"
  default     = ""
}
