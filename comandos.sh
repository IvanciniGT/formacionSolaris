#!/bin/bash
# Script: modulo1-punto3-parte1.sh
# Descripción: Este script proporciona ejemplos de comandos para la gestión de procesos y la configuración de redes en Solaris 11.

echo "Listando los procesos actuales..."
prstat 1 1

echo "Terminando un proceso con PID 1234..."
pkill -TERM -p 1234

echo "Cambiando la prioridad de un proceso con PID 1234 a una prioridad 'nice' de 10..."
nice -n 10 -p 1234

echo "Configuración de interfaces de red..."
dladm show-phys
ipadm show-if

echo "Creando una VNIC llamada vnic0 sobre la interfaz física net0..."
dladm create-vnic -l net0 vnic0

echo "Mostrando configuración de la red virtual..."
dladm show-vnic
ipadm show-addr

# Fin del script

#!/bin/bash
# Script: modulo1-punto3-parte2.sh
# Descripción: Comandos de ejemplo para gestión de memoria y swapping/paging en Solaris 11.

echo "Ver la cantidad total de memoria y su uso..."
echo "::memstat" | mdb -k

echo "Visualizar información sobre la cantidad de swapping..."
swap -l
swap -s

echo "Mostrar estadísticas de paging..."
vmstat 5 5

# Fin del script
#!/bin/bash
# Script: modulo1-punto3-parte3.sh
# Descripción: Comandos de ejemplo para la gestión básica del sistema de archivos ZFS en Solaris 11.

echo "Mostrar los pools ZFS disponibles..."
zpool list

echo "Crear un snapshot de un dataset ZFS llamado 'tank/mydataset'..."
zfs snapshot tank/mydataset@snap1

echo "Listar todos los snapshots disponibles..."
zfs list -t snapshot

echo "Crear un nuevo filesystem ZFS a partir de un snapshot..."
zfs clone tank/mydataset@snap1 tank/mycloneddataset

echo "Mostrar el estado de los pools ZFS, incluyendo errores..."
zpool status

# Fin del script

#!/bin/bash
# Script: modulo1-punto3-parte3.sh
# Descripción: Comandos de ejemplo para la gestión básica del sistema de archivos ZFS en Solaris 11, incluyendo la creación de recursos necesarios.
#!/bin/bash
# Script: modulo1-punto3-parte3.sh
# Descripción: Comandos de ejemplo para la gestión básica del sistema de archivos ZFS en Solaris 11, incluyendo la creación de recursos necesarios.

echo "Por favor, ejecute 'format' manualmente para identificar el disco a utilizar y luego actualice la variable DISPOSITIVO_ZFS en este script."

# Pausa para asegurar que el usuario vea el mensaje anterior.
read -p "Presione [Enter] una vez que haya actualizado la variable DISPOSITIVO_ZFS con el identificador de su disco..."

# Reemplaza esto con el identificador del dispositivo obtenido del comando 'format'.
DISPOSITIVO_ZFS='identificador_del_disco'

# El resto del script sigue igual...


# Reemplaza '/dev/disk/by-id/id_del_disco' con el identificador de tu dispositivo de almacenamiento real.
DISPOSITIVO_ZFS='/dev/disk/by-id/id_del_disco'

# Crear un pool ZFS si aún no existe. Reemplaza 'mi_pool' con el nombre deseado para tu pool ZFS.
NOMBRE_POOL='mi_pool'
if ! zpool list | grep -q "$NOMBRE_POOL"; then
    echo "Creando pool ZFS llamado $NOMBRE_POOL..."
    zpool create $NOMBRE_POOL $DISPOSITIVO_ZFS
else
    echo "El pool ZFS $NOMBRE_POOL ya existe."
fi

# Crear un dataset ZFS si aún no existe. Reemplaza 'mi_dataset' con el nombre deseado para tu dataset.
NOMBRE_DATASET="${NOMBRE_POOL}/mi_dataset"
if ! zfs list | grep -q "$NOMBRE_DATASET"; then
    echo "Creando dataset ZFS llamado $NOMBRE_DATASET..."
    zfs create $NOMBRE_DATASET
else
    echo "El dataset ZFS $NOMBRE_DATASET ya existe."
fi

# Crear un snapshot de un dataset ZFS
echo "Creando un snapshot del dataset ZFS $NOMBRE_DATASET..."
zfs snapshot ${NOMBRE_DATASET}@snap1

# Listar todos los snapshots disponibles
echo "Listando todos los snapshots disponibles..."
zfs list -t snapshot

# Crear un nuevo filesystem ZFS a partir de un snapshot
echo "Creando un nuevo filesystem ZFS a partir de un snapshot..."
zfs clone ${NOMBRE_DATASET}@snap1 ${NOMBRE_POOL}/mi_clon

# Mostrar el estado de los pools ZFS, incluyendo errores
echo "Mostrando el estado de los pools ZFS..."
zpool status

# Fin del script

**Script para la gestión básica de ZFS:**

```bash
#!/bin/bash
# Script: gestion_zfs_basica.sh
# Descripción: Ejemplos de comandos para la gestión básica de ZFS.

# Listar todos los pools ZFS disponibles.
echo "Pools ZFS disponibles:"
zpool list

# Crear un nuevo dataset ZFS para proyectos.
# Reemplazar 'rpool' con el nombre de tu pool si es diferente.
echo "Creando un nuevo dataset para proyectos..."
zfs create rpool/proyectos

# Establecer una cuota de 100G para el dataset de proyectos.
echo "Estableciendo una cuota de 100G para el dataset de proyectos..."
zfs set quota=100G rpool/proyectos

# Habilitar la compresión en el dataset de proyectos.
echo "Habilitando la compresión en el dataset de proyectos..."
zfs set compression=on rpool/proyectos

# Crear un snapshot del dataset de proyectos.
echo "Creando un snapshot del dataset de proyectos..."
zfs snapshot rpool/proyectos@snap1

# Listar todos los snapshots del dataset de proyectos.
echo "Listando snapshots del dataset de proyectos..."
zfs list -t snapshot -r rpool/proyectos

# Clonar un snapshot a un nuevo dataset.
echo "Clonando el snapshot a un nuevo dataset para pruebas..."
zfs clone rpool/proyectos@snap1 rpool/proyectos_pruebas

# Mostrar el estado de los pools ZFS, incluyendo errores.
echo "Estado de los pools ZFS:"
zpool status

# Fin del script.
```
#!/bin/bash
# Script: modulo1-punto4.sh
# Descripción: Ejemplos de comandos para la administración de sistemas en Oracle Solaris 11.

echo "Ejemplos de administración de sistemas en Oracle Solaris 11"

# Gestión de Usuarios y Grupos
echo "Creando un nuevo usuario llamado 'nuevousuario'..."
useradd nuevousuario

echo "Estableciendo una contraseña para 'nuevousuario'..."
passwd nuevousuario

echo "Creando un nuevo grupo llamado 'nuevogrupo'..."
groupadd nuevogrupo

echo "Añadiendo 'nuevousuario' al grupo 'nuevogrupo'..."
usermod -G nuevogrupo nuevousuario

# Gestión de Paquetes con IPS
echo "Actualizando todos los paquetes del sistema..."
pkg update

echo "Instalando el editor de texto nano..."
pkg install nano

echo "Buscando paquetes relacionados con Apache..."
pkg search apache

# Monitoreo Básico del Sistema
echo "Mostrando las 5 principales tareas que consumen más CPU..."
prstat -n 5

echo "Mostrando el uso de la memoria..."
vmstat 1 5

echo "Listando el estado de los pools ZFS..."
zpool list

# Recuerda, algunos comandos en este script necesitan privilegios de root para ejecutarse.
# Usa con precaución y modifica según las necesidades de tu entorno.

# Fin del script.

#!/bin/bash
# Script: modulo2-smf.sh
# Descripción: Ejemplos de comandos para la gestión de servicios SMF en Oracle Solaris 11.

echo "Gestión de Servicios con SMF en Oracle Solaris 11"

# Listar todos los servicios y su estado actual
echo "Listando todos los servicios y su estado..."
svcs

# Consultar información detallada sobre un servicio específico, por ejemplo, el servicio SSH
echo "Consultando información detallada sobre el servicio SSH..."
svcs -l ssh

# Habilitar un servicio, usando el servicio SSH como ejemplo
echo "Habilitando el servicio SSH..."
svcadm enable ssh

# Deshabilitar un servicio, usando el servicio SSH como ejemplo
echo "Deshabilitando el servicio SSH..."
svcadm disable ssh

# Reiniciar un servicio, usando el servicio SSH como ejemplo
echo "Reiniciando el servicio SSH..."
svcadm restart ssh

# Modificar una propiedad de configuración de un servicio, como ejemplo, cambiar el nivel de log del servicio de DNS
# Nota: Asegúrate de entender las propiedades específicas y sus valores válidos antes de hacer cambios.
echo "Cambiando la propiedad de configuración de un servicio..."
svccfg -s dns/server setprop config/loglevel = error

# Refrescar un servicio después de cambiar su configuración
echo "Refrescando el servicio DNS para aplicar los cambios..."
svcadm refresh dns/server

# Ver los logs de un servicio para solucionar problemas, usando el servicio SSH como ejemplo
echo "Viendo los últimos 10 mensajes de log del servicio SSH..."
tail -10 /var/svc/log/network-ssh:default.log

# Analizar las dependencias de un servicio, usando el servicio de red como ejemplo
echo "Analizando las dependencias del servicio de red..."
svcs -D network/service

# Listar los servicios que dependen de un servicio específico, usando el servicio de red como ejemplo
echo "Listando los servicios que dependen del servicio de red..."
svcs -d network/service

# Recuerda, algunos comandos en este script necesitan privilegios de root para ejecutarse.
# Usa con precaución y modifica según las necesidades de tu entorno.

# Fin del script.

```bash
#!/bin/bash
# Script: solucion_problemas_smf.sh
# Descripción: Herramientas básicas para diagnóstico y solución de problemas en servicios SMF.

echo "Diagnóstico de Servicios con Problemas"
svcs -xv

echo "Revisión de Logs de un Servicio con Problemas (Ejemplo: network/smtp:sendmail)"
tail -20 /var/svc/log/network-smtp-sendmail:default.log

echo "Intento de Reinicio del Servicio con Problemas"
svcadm restart network/smtp:sendmail

echo "Si el servicio está en estado de mantenimiento, limpiar el estado y reintentar"
svcadm clear network/smtp:sendmail

echo "Revisión post-reinicio o post-limpieza"
svcs -xv
```

```bash
#!/bin/bash
# Listar paquetes instalados
pkg list

# Instalar un paquete, ej. editor nano
pkg install nano

# Buscar un paquete, ej. git
pkg search git
```

