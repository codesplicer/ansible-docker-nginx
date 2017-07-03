#!/bin/bash
set -xue

# 1. Run ansible-galaxy install
ansible-galaxy install -r ansible/requirements.yml -p ansible/roles

# 2. Build docker image
docker build -t codesplicer/ansible-nginx .

# 3. Start a container exposing port 80
docker run -d -p 8080:80 codesplicer/ansible-nginx
