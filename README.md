# lamp-vagrant

Máquina virtual LAMP (Linux, Apache, MariaDB y PHP) creada con Vagrant sobre Debian Bookworm de 64 bits (`debian/bookworm64`).

## Estructura

```
lamp-vagrant/
├── Vagrantfile
├── files/info.php
└── scripts/
    ├── 01_install_packages.sh
    └── 02_configure_lamp.sh
```

- `Vagrantfile`: caja `debian/bookworm64`, redirección del puerto 8080 del anfitrión al 80 de la MV y dos bloques de aprovisionamiento con scripts externos (`install_packages` y `configure_lamp`).
- `scripts/01_install_packages.sh`: actualiza los repositorios e instala Apache2, MariaDB y PHP.
- `scripts/02_configure_lamp.sh`: copia la página de prueba, ajusta permisos y habilita Apache y MariaDB.
- `files/info.php`: página de prueba con `phpinfo()`.

## Uso

```bash
vagrant up                                                          # crea y aprovisiona la MV
vagrant provision --provision-with install_packages                 # solo instalación de paquetes
vagrant provision --provision-with configure_lamp                   # solo configuración de LAMP
vagrant provision --provision-with install_packages,configure_lamp  # ambos en secuencia
vagrant ssh                                                         # acceso por SSH
vagrant halt                                                        # apagar la MV
vagrant destroy                                                     # eliminar la MV
```

Verificación: abrir <http://localhost:8080/info.php> en el navegador del anfitrión.

## Cambios respecto al enunciado

- En `02_configure_lamp.sh`, `chown` y `chmod` aparecían en la misma línea; se han separado en dos órdenes.
- La página de prueba se copia desde `/vagrant/files/info.php` (carpeta compartida por defecto de Vagrant; `/files` no existe en la MV) a `/var/www/html/info.php`, que es la URL que se comprueba en la verificación.

Probado con Vagrant 2.4.9 y VirtualBox 7.2.4 en Windows 11.
