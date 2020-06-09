
variable "address_space" {
  description = ""
  default     = []
}

variable "network_name" {
  description = ""
  default     = []
}

variable "tags" {
  description = ""
  default     = {}
}

variable "location" {
  description = ""
  default     = ""
}

variable "subnet_address_prefix" {
  description = ""
  default     = ""
}

variable "user_name" {
  description = ""
  default     = "usrminer"
}



variable "ansible_extra_vars" {
  description = ""
  default     = []
}

variable "servers_count" {
  description = ""
  default     = ""
}
variable "playbook" {
  description = ""
  default     = ""
}
variable "instance_size" {
  description = ""
  default     = ""
}
variable "instance_name_pattern" {
  description = ""
  default     = ""
}
variable "game_name" {
  description = ""
  default     = ""
}
