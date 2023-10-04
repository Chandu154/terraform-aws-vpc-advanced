
# vpc peering with default vpc
resource "aws_vpc_peering_connection" "peering" {
  count = var.is_peering_required ? 1 : 0
  #peer_owner_id = var.peer_owner_id
  peer_vpc_id   = aws_vpc.main.id
  #requestor,default VPC is our requestor
  vpc_id        = var.requestor_vpc_id
  auto_accept   = true

  tags = merge ({
    Name = "VPC Peering between default and ${var.project_name}"
  },var.common_tags
  )
}

# adding the route to the default route table to roboshop vpc through peering connection
resource "aws_route" "default_route" {
  count = var.is_peering_required ? 1 : 0  
  route_table_id            = var.default_route_table_id
  destination_cidr_block    = var.cidr_block
  # since we set count perameter , it is treated as list, even single element we should write the list syntax
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
  #depends_on                = [aws_route_table.testing]
}

#add route in roboshop in public route table

resource "aws_route" "public_peering" {
  count = var.is_peering_required ? 1 : 0  
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = var.default_vpc_cidr
  # since we set count perameter , it is treated as list, even single element we should write the list syntax
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
  #depends_on                = [aws_route_table.testing]
}

#add route in roboshop in private route table

resource "aws_route" "private_peering" {
  count = var.is_peering_required ? 1 : 0  
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = var.default_vpc_cidr
  # since we set count perameter , it is treated as list, even single element we should write the list syntax
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
  #depends_on                = [aws_route_table.testing]
}

#add route in roboshop in database route table

resource "aws_route" "database_peering" {
  count = var.is_peering_required ? 1 : 0  
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = var.default_vpc_cidr
  # since we set count perameter , it is treated as list, even single element we should write the list syntax
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
  #depends_on                = [aws_route_table.testing]
}