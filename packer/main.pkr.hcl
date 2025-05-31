source "googlecompute" "gcp_compute_packer" {
  project_id = "canvas-voltage-460913-r5"
  source_image = "centos-stream-9-v20250513"
  ssh_username = "padiginetimanoj1997"
  temporary_key_pair_type = "rsa"
  zone = "us-central1-a"
  image_name = "manoj-workstation"
}

build {
  sources = ["sources.googlecompute.gcp_compute_packer"]
  provisioner "shell" {
    inline = [
       "sudo dnf install git -y",
        "git clone https://github.com/manojpadigineti-cloud/DevSecOps.git",
        "sudo bash /home/padiginetimanoj1997/DevSecOps/ansible/Install_terraform.sh",
        "sudo bash /home/padiginetimanoj1997/DevSecOps/ansible/install_ansible.sh",
        "sudo sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config",
        "sudo useradd -m devops && echo 'devops:Manoj@9999' | sudo chpasswd",
        "sudo sed -i '/^# %wheel[[:space:]]\\+ALL=(ALL)[[:space:]]\\+NOPASSWD: ALL$/a devops       ALL=(ALL)       NOPASSWD: ALL' /etc/sudoers",
        "sudo systemctl status sshd"
    ]
}
}
