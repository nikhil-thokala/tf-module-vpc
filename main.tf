resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = merge(var.tags, { Name = "${var.env}-vpc" }
  )
  }


# Public subnets

resource "aws_subnet" "public_subnets" {
  for_each = var.public_subnets
  vpc_id = aws_vpc.main.id
  cidr_block = each.value["availability_zone"]
  tags = merge(var.tags, { Name = "${var.env}-${each.value["name"]}" }
  )
}
}