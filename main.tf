resource "proxmox_lxc" "containers" {
    unprivileged = true
    target_node  = "pve01"
    hostname =  "test01"
    # ostemplate = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
    ostemplate = "local:vztmpl/debian-11-turnkey-ansible_17.1-1_amd64.tar.gz"
    password     = "test123"
    
    // root file system
    rootfs {
        storage = "local-lvm"
        size    = "8G"
    }

    // network
    network {
        name   = "eth0"
        bridge = "vmbr0"
        ip     = "10.0.0.145/24" #10.0.0.147/24 dhcp
        gw     = "10.0.0.1"
    }
}