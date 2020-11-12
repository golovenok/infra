bastion_IP = 35.228.117.64 \
someinternalhost_IP = 10.166.0.7

testapp_IP = 35.236.181.42 \
testapp_port = 9292

#Создание instans reddit-app \
gcloud compute instances create reddit-app \
--boot-disk-size=10GB \
--image-family ubuntu-1604-lts \
--image-project=ubuntu-os-cloud \
--machine-type=g1-small \
--tags puma-server \
--restart-on-failure \
--metadata startup-script='wget -O -  https://gist.githubusercontent.com/golovenok/fb3c12570d4a9af2b7b62e1d21f29e2e/raw/9e0a266959610b9dbb71e62d08572b68c3ea7ae1/startup-script-url.sh | bash'

#Создание правила default-puma-server \
gcloud compute firewall-rules create default-puma-server  \
--allow=tcp:9292 \
--target-tags=puma-server \
--source-ranges="0.0.0.0/0"
