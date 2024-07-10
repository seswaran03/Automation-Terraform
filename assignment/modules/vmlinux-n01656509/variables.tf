variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "subnet_id" {
  type        = string
}

variable "storage_account_uri" {
  type        = string
}

variable "admin_username" {
  type        = string
}

variable "public_key" {
  type        = string
}

variable "private_key" {
  type        = string
}

variable "linux_avs" {
  type        = string
}

variable "linux_vms" {
  type        = map(string)
}
