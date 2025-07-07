resource "proxmox_vm_qemu" "vm" {
  for_each = var.vms

  name        = each.key
  desc        = each.value.description
  target_node = each.value.target_node
  vmid        = each.value.vmid
  clone       = each.value.clone_template
  full_clone  = var.full_clone
  agent       = var.agent
  os_type     = var.os_type
  bios        = var.bios
  cores       = each.value.cores
  sockets     = each.value.sockets
  cpu_type    = var.cpu_type
  memory      = each.value.memory
  scsihw      = var.scsihw
  bootdisk    = var.bootdisk
  onboot      = var.onboot
  vm_state    = var.vm_state

  # Cloud-init disk
  disk {
    type    = "cloudinit"
    storage = var.cloudinit_storage
    slot    = "ide2"
  }

  # Main disk
  disk {
    type     = "disk"
    storage  = var.disk_storage
    size     = each.value.disk_size
    slot     = "scsi0"
    discard  = var.disk_discard
    iothread = var.disk_iothread
  }

  # Network configuration
  network {
    id       = 0
    model    = var.network_model
    bridge   = var.network_bridge
    firewall = var.network_firewall
  }

  # Cloud-init configuration
  ciuser     = var.ci_user
  ipconfig0  = each.value.ip_config
  nameserver = var.nameserver
  ciupgrade  = var.ci_upgrade
  sshkeys    = var.ssh_keys
}
