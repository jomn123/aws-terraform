resource "aws_subnet" "this" {
  for_each = var.subnets

  vpc_id                  = var.vpc_id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.map_public_ip_on_launch

  assign_ipv6_address_on_creation = each.value.assign_ipv6_address_on_creation

  ipv6_cidr_block = cidrsubnet(
    var.vpc_ipv6_cidr_block,
    8, # new bits to get from /56 → /64
    index(keys(var.subnets), each.key)
  )

  tags = merge(
    {
      Name = "${var.name}-${each.key}"
    },
    each.value.tags
  )
}
