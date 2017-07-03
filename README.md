Ansible + Nginx - Docker Demo
==============================

Executes ansible-playbook to provision a docker image with nginx and a simple hello-world html webpage, exposed as the default vhost.

Dependencies
------------

* Ansible 2.3.0.0 - `pip install ansible==2.3.0.0`

Usage
-----

From the project root, execute: `./build.sh`. This will:

1. Gather role dependencies via `ansible-galaxy`
2. Run a `docker build` creating an image tagged as 'codesplicer/ansible-nginx'
3. Start a container from the image built in step 2, exposing port 8080
4. Open `http://localhost:8080` to see the hello-world page


Author
-------

[Vik Bhatti](http://vikbhatti.com)
