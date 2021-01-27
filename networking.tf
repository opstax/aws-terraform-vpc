resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(local.common_tags, {
    Name = "vpc-${var.service_name}"
  })
}


resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(local.common_tags, {
    Name = "igw-${var.service_name}"
  })
}


resource "aws_route_table" "private_a" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw_a.id
  }
  tags = merge(local.common_tags, {
    Name = "rtb-private-a-${var.service_name}"
  })
}


resource "aws_route_table" "private_b" {
  vpc_id = aws_vpc.main.id
 route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw_b.id
  }
  tags = merge(local.common_tags, {
    Name = "rtb-private-b-${var.service_name}"
  })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = merge(local.common_tags, {
    Name = "rtb-public-${var.service_name}"
  })
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private_a.id
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private_b.id
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_subnet" "private_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, 1)
  availability_zone_id    = data.aws_availability_zone.a.zone_id
  map_public_ip_on_launch = false

  tags = merge(local.common_tags, {
    Name                  = "subnet-private-a-${var.service_name}"
  })
}

resource "aws_subnet" "private_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, 2)
  availability_zone_id    = data.aws_availability_zone.b.zone_id
  map_public_ip_on_launch = false

  tags = merge(local.common_tags, {
    Name                  = "subnet-private-b-${var.service_name}"
  })
}


resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, 3)
  availability_zone_id    = data.aws_availability_zone.a.zone_id
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
    Name                  = "subnet-public-a-${var.service_name}"
  })
}


resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, 4)
  availability_zone_id    = data.aws_availability_zone.b.zone_id
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
    Name                  = "subnet-public-b-${var.service_name}"
  })
}


resource "aws_eip" "nat_a" {
  vpc = true
  tags = merge(local.common_tags, {
    Name = "eip-nat-a-${var.service_name}"
  })
}


resource "aws_nat_gateway" "gw_a" {
  allocation_id = aws_eip.nat_a.id
  subnet_id     = aws_subnet.public_a.id

  tags = merge(local.common_tags, {
    Name = "nat-gw-a-${var.service_name}"
  })
}


resource "aws_eip" "nat_b" {
  vpc = true
  tags = merge(local.common_tags, {
    Name = "eip=nat-b-${var.service_name}"
  })
}


resource "aws_nat_gateway" "gw_b" {
  allocation_id = aws_eip.nat_b.id
  subnet_id     = aws_subnet.public_b.id

  tags = merge(local.common_tags, {
    Name = "nat-gw-b-${var.service_name}"
  })
}
