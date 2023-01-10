# Practice to use docker-compose

## Set up host machine with VirturalBox

- Memory: 4096MB(4GB)
- VDI: 10GB

### Guest additions CD on Debian

- Menu - Devices - Insert guest additions CD...

```
$ mkdir -p /mnt/cdrom
$ mount /dev/cdrom /mnt/cdrom
$ sh /mnt/cdrom/VBoxLinuxAdditions.run --nox11
$ shutdown -r now
```

### Add user to sudo group

```bash
$ su -
$ usermod -a -G sudo `whoami`
$ usermod -a -G root `whoami`
$ echo "`whoami` ALL=(ALL:ALL) ALL" >> /etc/sudoers
```

### Install packages
```bash
$ su -
$ apt-get update
$ apt-get install sudo git make vim curl apt-transport-https ca-certificates gnupg lsb-release systemd software-properties-common
```

### Install docker
```bash
$ mkdir -p /etc/apt/keyrings
$ curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
$ sudo apt-get update
$ sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
$ sudo chmod 666 /var/run/docker.sock
```

# Makefile to use docker-compose

```bash
$ make build
```

- `help`: Show help
- `build`: Build containers
- `up`: Create and start containers
- `down`: Stop and remove containers, networks
- `start`: Start services
- `stop`: Stop running containers
- `rm`: Removes stopped service containers
- `show`: Show containers, images, and logs
- `clean`: Stop and remove running containers, networks, images, and volumes
- `re`: clean & build
