output "vm_ids" {
  description = "Map of VM names to their IDs"
  value       = { for k, v in proxmox_vm_qemu.vm : k => v.vmid }
}

output "vm_names" {
  description = "List of VM names"
  value       = keys(proxmox_vm_qemu.vm)
}

output "vm_ips" {
  description = "Map of VM names to their IP configurations"
  value       = { for k, v in proxmox_vm_qemu.vm : k => v.ipconfig0 }
}

output "vm_nodes" {
  description = "Map of VM names to their target nodes"
  value       = { for k, v in proxmox_vm_qemu.vm : k => v.target_node }
}

output "vm_details" {
  description = "Complete VM details"
  value = {
    for k, v in proxmox_vm_qemu.vm : k => {
      id          = v.vmid
      name        = v.name
      target_node = v.target_node
      cores       = v.cores
      memory      = v.memory
      ip_config   = v.ipconfig0
    }
  }
}
