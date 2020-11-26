gcloud compute firewall-rules create default-allow-ssh  \
--allow=tcp:22 \
--source-ranges="0.0.0.0/0"
