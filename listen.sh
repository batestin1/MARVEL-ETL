#!/bin/sh

WATCH_DIR="dataset"
TERRAFORM_DIR="infra"

while true; do
  inotifywait -r -e create $WATCH_DIR && cd $TERRAFORM_DIR && terraform apply -auto-approve
done
