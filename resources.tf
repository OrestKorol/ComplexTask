resource "aws_vpc" "complex_vpc" {
	cidr_block = "10.0.0.0/16"
	
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

resource "aws_default_route_table" "complex_route_table" {
	default_route_table_id = aws_vpc.complex_vpc.default_route_table_id
	
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.complex_gateway.id
	}
	
	tags = {
		Name = "default route table"
	}
}

resource "aws_key_pair" "ssh-key" {
	key_name = "complex-key"
	public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDyFO85Bz5tGehYachlOEaHQWUSLRmLcnq2BuX3KoCqmQtPN19BkaDARG2CW0xJHZkumdomz6P6Ihn6msUGNgQLn5MTJxalXWsrVvKgndB+RJg1rOJ4rdeszL/wzWa/1VbBr0dOI3lxuPCv9LbRV7ZgCGutNpuLygEwi6Vu18FIsxF7xotIazqbC5SMG/oDgZOR9m5u0PMFwb82JXIb/JqOezDd7uT1ZAQPQ75QBuHBjm48m5kL2j3SX6u8GUnCuQCIvG7dE77FoCaeyK7oJ7C51UI8vqpKuSsr5urFdGSv289EpjIP/cGyeAzA/yZ/Td7O14xGXvVF0ka/TFr9Kn8WHDC+F1addKIVMNj9NceBtAdEiCSdR44kC0D9pmIa6EOgJi25LZbxXUDqmEYzjxQeb+Cv/jMmgLVWO1bhOrEWIaFEa9yglOfUnWUdDIY3c5grTlxpL1Yd7cAC4Jc0DGXvGyo3//NOtFSqynlifS+r3P4uCFGbG1ygT/Z41V2zhrs= Orest Korol@ThatITGuy"
}

resource "aws_instance" "sql_instance"{
	ami = "ami-0721c9af7b9b75114"
	instance_type = "t2.micro"
	key_name = "complex-key"
	subnet_id = aws_subnet.complex_subnet.id
	

	tags = {
		Name = "SQL_Instance"
	}
}

resource "aws_instance" "tomcat_instance"{
	ami = "ami-0721c9af7b9b75114"
	instance_type = "t2.micro"
	key_name = "complex-key"
	subnet_id = aws_subnet.complex_subnet.id

	tags = {
		Name = "TomCat_Instance"
	}
}