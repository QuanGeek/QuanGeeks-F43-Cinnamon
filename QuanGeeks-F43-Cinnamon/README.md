# Fedora Cinnamon Workstation Provisioning

This Ansible project rebuilds the Fedora Cinnamon workstation setup shown in the uploaded screenshots and exported state files.

## What it configures

- Fedora Cinnamon workstation packages
- Brave, Chrome, Slack, 1Password, Terminator, Tilix
- Cinnamon top panel, favorites, dark red theme, Papirus icons, wallpaper settings
- Terminator transparent terminal profile
- Tilix background/transparency settings
- Flatpak + Pika Backup
- KVM/QEMU/libvirt/virt-manager virtualization stack
- Firewall and fail2ban
- Cleanup of overlapping VMware/VirtualBox services if enabled

## Recommended Run

```bash
cd fedora-workstation-ansible
./scripts/bootstrap.sh
```

Or run manually:

```bash
sudo dnf install -y ansible git
ansible-playbook -i inventory/localhost.yml playbooks/workstation.yml --ask-become-pass
```

## Important cleanup setting

In `group_vars/all.yml`:

```yaml
cleanup_virtualization_overlap: true
```

This disables/removes VMware/VirtualBox overlap and keeps KVM/libvirt as the primary stack.

Set it to `false` if you are running Fedora inside a VMware or VirtualBox VM.

## Notes

You still need to copy your actual wallpaper images into:

```text
~/Pictures/Wallpaper/Iron Man/
```

The playbook restores the dconf configuration, but it cannot recreate image files that were not uploaded.
