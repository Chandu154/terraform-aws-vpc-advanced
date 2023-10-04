
# it query the all zones in the availabilty zone
data "aws_availability_zones" "available" {
  state = "available"
}

# it is for to demonstrate the list of zones
# output "azs" {
#     value = data.aws_availability_zones.available.names
  
# }

data "aws_vpc" "default" {
  default = true
}