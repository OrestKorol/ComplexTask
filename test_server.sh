ip='terraform output -raw tomcat_ip'
ip=$(terraform output -raw tomcat_ip)
port=":8080"
adress="${ip}${port}"
echo "${adress}"
wget --spider --server-response "${address}" 2>&1 | grep '200\ OK' | wc -l
