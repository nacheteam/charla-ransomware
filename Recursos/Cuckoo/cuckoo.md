# Guía de uso e instalación de Cuckoo

Para la instalación de cuckoo usa el script [cuckoo.sh]() (sólo distros basadas en Debian). Si tu distro no es Debian te recomiendo que mires los paquetes que se instalan y los busques en tu distro.  
Debes instalar en virtualbox una máquina virtual con Windows XP y rellenar los archivos de configuración de Cuckoo con los datos de tu host y tu máquina virtual.  
En la máquina virtual se deben instalar Python 2.7 y Python PIL. Tras esto debemos hacer una carpeta compartida con la máquina virtual y pasarle el archivo python que encontraremos en ``/home/usuario/.cuckoo/agent``.  
Debemos instalar las VirtualBox Guest Additions en la máquina para poder tener carpetas compartidas. Así mismo debemos configurar una red "Host Only" y no "NAT". Cuando acabemos de configurar todo debemos ejecutar el fichero agent.py y hacer una insantánea de la máquina en ese momento.

## Uso básico de Cuckoo

Para ejecutar Cuckoo en nuestro test debemos abrir dos terminales, en una ejecutaremos el comando:

``` bash
    cuckoo -d
```

En la otra ejecutaremos el comando:
``` bash
    cuckoo submit /path/to/file
```

Tras esto debería abrirse la máquina virtual instalada y ejecutar el análisis.
