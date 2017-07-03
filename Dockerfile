FROM ubuntu:16.04
MAINTAINER Vik Bhatti <github@vikbhatti.com>

RUN \
  apt-get -qq update && \
  apt-get install -y --no-install-recommends \
    libssl-dev \
    build-essential \
    libffi-dev \
    python-dev \
    python-virtualenv \
    python-setuptools && \
  rm -rf /var/cache/apt/* && \
  rm -rf /var/lib/apt/lists/*

RUN easy_install pip && \
    pip install -U pip ansible==2.3.0.0

# Copy ansible files into image
COPY ansible/ /ansible

ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_SSH_PIPELINING true
ENV ANSIBLE_ROLES_PATH /ansible/roles

# Provision using ansible and cleanup
RUN ansible-playbook -i "localhost" -c local /ansible/site.yml && \
  apt-get -y clean && \
  apt-get -y autoremove

# Start nginx
EXPOSE 80
STOPSIGNAL SIGTERM
CMD ["nginx", "-g", "daemon off;"]
