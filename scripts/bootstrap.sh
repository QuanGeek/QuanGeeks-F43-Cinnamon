#!/usr/bin/env bash
set -euo pipefail
sudo dnf install -y ansible git
ansible-playbook -i inventory/localhost.yml playbooks/workstation.yml --ask-become-pass
