locals {
  tokens = yamldecode(file("./vault/token.yaml"))
  lxc    = yamldecode(file("./lxc.yaml"))
  
}