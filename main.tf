resource "proxmox_lxc" "containers" {
  for_each     = local.lxc
  
  description  = each.value.description
  unprivileged = true
  target_node  = "pve01"
  hostname     = each.key
  ostemplate   = each.value.ostemplate
  password     = local.tokens.password
  cores        = each.value.cpu
  memory       = each.value.mem
  onboot       = true
  start        = true

  // root file system
  rootfs {
    storage = "local-lvm"
    size    = each.value.size
  }

  // network
  network {
    name     = "eth0"
    bridge   = "vmbr0"
    ip       = each.value.ip #10.0.0.145,7/24 dhcp
    gw       = "10.0.0.1"
    firewall = true
  }
}