variable "vms" {
  description = "Map of VMs to create with their specific configurations"
  type = map(object({
    description       = string
    target_node       = string
    vmid              = number
    cores             = number
    sockets           = number
    memory            = number
    disk_size         = string
    ip_config         = string
    clone_template    = string
    disk_storage      = string
    cloudinit_storage = string
  }))
}

variable "full_clone" {
  description = "Whether to perform a full clone"
  type        = bool
  default     = true
}

variable "agent" {
  description = "Enable QEMU guest agent"
  type        = number
  default     = 1
}

variable "os_type" {
  description = "Operating system type"
  type        = string
  default     = "cloud-init"
}

variable "bios" {
  description = "BIOS type"
  type        = string
  default     = "seabios"
}

variable "cpu_type" {
  description = "CPU type"
  type        = string
  default     = "host"
}

variable "scsihw" {
  description = "SCSI hardware type"
  type        = string
  default     = "virtio-scsi-pci"
}

variable "bootdisk" {
  description = "Boot disk"
  type        = string
  default     = "scsi0"
}

variable "onboot" {
  description = "Start VM on boot"
  type        = bool
  default     = true
}

variable "vm_state" {
  description = "Desired VM state"
  type        = string
  default     = "started"
}

variable "disk_discard" {
  description = "Enable disk discard"
  type        = bool
  default     = true
}

variable "disk_iothread" {
  description = "Enable disk iothread"
  type        = bool
  default     = true
}

variable "network_model" {
  description = "Network interface model"
  type        = string
  default     = "virtio"
}

variable "network_bridge" {
  description = "Network bridge"
  type        = string
  default     = "vmbr0"
}

variable "network_firewall" {
  description = "Enable network firewall"
  type        = bool
  default     = false
}

variable "ci_user" {
  description = "Cloud-init user"
  type        = string
  default     = "fer"
}

variable "ci_password" {
  description = "Cloud-init password"
  type        = string
  default     = "change-me"
}

variable "nameserver" {
  description = "DNS nameserver"
  type        = string
  default     = "8.8.8.8"
}

variable "ci_upgrade" {
  description = "Enable cloud-init upgrade"
  type        = bool
  default     = true
}

variable "ssh_keys" {
  description = "SSH public keys for cloud-init"
  type        = string
  default     = ""
}

variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_id" {
  type = string
}

variable "proxmox_api_token" {
  type = string
}
