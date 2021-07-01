resource "aws_vpc" "complex_vpc" {
	cidr_block = "10.0.0.0/16"
	enable_dns_hostnames = true
	
	tags = {
		Name = "complex_task"
	}
}

resource "aws_subnet" "complex_subnet" {
	vpc_id = aws_vpc.complex_vpc.id
	cidr_block = "10.0.0.0/24"
	map_public_ip_on_launch = "true"
	
	tags = {
		Name = "complex_task"
	}
}

resource "aws_internet_gateway" "complex_gateway" {
	vpc_id = aws_vpc.complex_vpc.id
	
	tags = {
		Name = "complex_task"
	}
}

resource "aws_route_table" "complex_route_table" {
	vpc_id = aws_vpc.complex_vpc.id
	
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.complex_gateway.id
	}
	
	tags = {
		Name = "default route table"
	}
}

resource "aws_route_table_association" "complex_association" {
	subnet_id = aws_subnet.complex_subnet.id
	route_table_id = aws_route_table.complex_route_table.id
}

resource "aws_security_group" "complex_security" {
	name = "complex_security"
	vpc_id = aws_vpc.complex_vpc.id
	ingress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_instance" "sql_instance"{
	ami = "ami-0277b52859bac6f4b"
	instance_type = "t2.micro"
	key_name = "Pipeline"
	associate_public_ip_address = true
	subnet_id = aws_subnet.complex_subnet.id
	vpc_security_group_ids = [aws_security_group.complex_security.id]
	
	tags = {
		Name = "SQLInstance"
	}
}

resource "aws_instance" "tomcat_instance"{
	ami = "ami-0277b52859bac6f4b"
	instance_type = "t2.micro"
	key_name = "Pipeline"
	associate_public_ip_address = true
	subnet_id = aws_subnet.complex_subnet.id
	vpc_security_group_ids = [aws_security_group.complex_security.id]
	
	tags = {
		Name = "TomCatInstance"
	}
}