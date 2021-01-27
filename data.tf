data "aws_region" "current" {}
  
data "aws_availability_zone" "a" {
  name = "${data.aws_region.current.name}a"
}

data "aws_availability_zone" "b" {
  name = "${data.aws_region.current.name}b"
}

data "aws_availability_zone" "c" {
  name = "${data.aws_region.current.name}c"
}
