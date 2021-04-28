# Домашнее задание: развертывание виртуальных машин на proxmox с помощью terraform
Для работы с прокмоксом используем терраформ с плагином для proxmox. 
Логика работы скрипта терраформ не меняется при смене хостинга с AdvancedHosting на proxmox. Разница лишь в указании плагина, через которого будет взаимодействие.
Текст скрипта в файле main.tf
После запуска 
```
terraform plan
``` 
мы получим планируемую инфраструктуру с указанием ресурсов, которые будут созданы после отработки скрипта
```
Terraform will perform the following actions:
# proxmox_vm_qemu.proxmox_vm[0] will be created
  + resource "proxmox_vm_qemu" "proxmox_vm" {
      + agent        = 0
      + balloon      = 0
      + boot         = "cdn"
      + bootdisk     = "scsi0"
      + clone        = "debian-cloudinit"
      + clone_wait   = 15
      + cores        = 4
      + cpu          = "host"
      + force_create = false
      + full_clone   = true
      + hotplug      = "network,disk,usb"
      + id           = (known after apply)
      + ipconfig0    = "ip=10.10.10.151/24,gw=10.10.10.1"
      + memory       = 2028
      + name         = "tf-vm-0"
      + numa         = false
      + onboot       = true
      + os_type      = "cloud-init"
      + preprovision = true
      + scsihw       = "virtio-scsi-pci"
      + sockets      = 1
      + ssh_host     = (known after apply)
      + ssh_port     = (known after apply)
      + sshkeys      = <<~EOT
              ssh-rsa ...
        EOT
      + target_node  = "pmx-01"
      + vcpus        = 0
      + vlan         = -1
+ disk {
          + backup       = false
          + cache        = "none"
          + format       = "raw"
          + id           = 0
          + iothread     = true
          + mbps         = 0
          + mbps_rd      = 0
          + mbps_rd_max  = 0
          + mbps_wr      = 0
          + mbps_wr_max  = 0
          + replicate    = false
          + size         = "20"
          + storage      = "data2"
          + storage_type = "lvm"
          + type         = "scsi"
        }
+ network {
          + bridge    = "vmbr0"
          + firewall  = false
          + id        = 0
          + link_down = false
          + model     = "virtio"
          + queues    = -1
          + rate      = -1
          + tag       = -1
        }
    }
Plan: 1 to add, 0 to change, 0 to destroy.
```
После запуска команды
```
terraform apply --auto-approve
```
Указанные в плане ресурсы развернутся на прокмоксе хосте.
