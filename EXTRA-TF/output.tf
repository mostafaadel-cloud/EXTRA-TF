output "created_vpcs" {
  value = module.VPCs.vpc_names
}

output "created_subnets" {
  value = module.VPCs.subnet_names
}