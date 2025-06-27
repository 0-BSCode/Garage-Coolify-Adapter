#!/bin/sh
envsubst < garage.tmpl.toml > /etc/garage.toml
echo "garage.toml created"
/bin/garage