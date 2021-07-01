output "sql_ip"{
	value = aws_instance.sql_instance.public_ip
}

output "tomcat_ip"{
	value = aws_instance.tomcat_instance.public_ip
}