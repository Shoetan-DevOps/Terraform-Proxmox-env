locals {
  tokens = yamldecode(file("./token.yaml"))
  lxc    = yamldecode(file("./lxc.yaml"))
  
}