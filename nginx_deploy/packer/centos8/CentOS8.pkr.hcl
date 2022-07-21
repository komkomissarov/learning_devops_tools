variable "shutdown_command" {
  type    = string
  default = "sudo /sbin/halt -p"
}

variable "version" {
  type    = string
  default = "2105"
}

variable "url" {
  type    = string
  default = "./centos8/CentOS-Stream-8-x86_64-latest-dvd1.iso"
}

variable "checksum" {
  type    = string
  default = "ad66d3903af5060fdd49411fc1932ca679639dcf47988ea293388f119c74f209"
}

source "vmware-iso" "vmware" {
  boot_command                   = ["<tab> text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter><wait>"]
  disk_size                      = "30000"
  guest_os_type                  = "centos-64"
  http_directory                 = "./centos8/http"
  iso_checksum                   = "sha256:${var.checksum}"
  iso_url                        = "${var.url}"
  shutdown_command               = "${var.shutdown_command}"
  ssh_password                   = "vagrant"
  ssh_timeout                    = "20m"
  ssh_username                   = "vagrant"
  tools_upload_flavor            = "linux"
  vmx_remove_ethernet_interfaces = "true"
}

build {
  sources = ["source.vmware-iso.vmware"]

  provisioner "shell" {
    execute_command = "sudo {{ .Vars }} sh {{ .Path }}"
    scripts         = ["./centos8/scripts/update.sh"]
  }

}
