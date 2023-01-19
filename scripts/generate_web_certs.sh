#!/usr/bin/env bash

domain_list=""
root_domain="${1}"
output_directory="output"
root_key="${output_directory}/root.pem"
root_cert="${output_directory}/root.cer"
web_key="${output_directory}/${root_domain}.pem"
web_csr="${output_directory}/${root_domain}.csr"
web_cert="${output_directory}/${root_domain}.cer"

echo ${root_domain}

if [ root_domain == "" ]; then
  echo "Sorry, needs at least one domain as an argument."
  exit 1
fi

for var in "$@"
do
  domain_list+=",DNS:${var}"
done

# strip out the leading comma
domain_list="${domain_list:1}"

openssl genrsa -out "${root_key}" 4096
openssl req -x509 -new -nodes -key "${root_key}" -sha256 -days 3650 -out "${root_cert}" -subj "/C=AU/ST=NSW/O=DEMO/CN=Transient CA"
openssl genrsa -out "${web_key}" 2048

openssl req -new -sha256 \
    -key "${web_key}" \
    -subj "/C=AU/ST=NSW/O=DEMO/CN=${root_domain}" \
    -out "${web_csr}"

openssl x509 -req -in "${web_csr}" \
    -CA "${root_cert}" -CAkey "${root_key}" \
    -CAcreateserial -out "${web_cert}" -days 3650 -sha256 \
    -extfile <(printf "subjectAltName=%s" "${domain_list}")
