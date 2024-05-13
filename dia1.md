
# Solaris: 

Sistema Operativo de la familia UNIX.

## Qué era UNIX?

Un SO de los lab. Bell de la americana de telecomunicaciones AT&T.
En su época de esplendor llegó a haber más de 400 versiones diferentes.
Muchas de esas versiones eran incompatibles entre si:
Programas que funcionaban en algunas versiones, no lo hacían en otras.

Para poner orden salen 2 estándares, que controlaban la evolución de UNIX:
- POSIX
  - El sistema de archivos:
     / raiz
         bin/       Programas del SO (comandos)
            ls
            mkdir
            touch
            cat
            cp
            mv
            sh      Shell para interactuar con el SO
                Lenguaje propio de programación:
                - Variables
                - Estructuras de control(if, for, while)
                - Funciones
                - Pipes
                - Redirecciones
         opt/       Programas de terceros
         var/       Datos de los programas (logs, archivos de datos de una BBDD, páginas html o php, etc.)
         tmp/       Temporales
         etc/       Configuración del SO y de los programas
         home/      Es la carpeta donde se encuentran las carpetas de los usuarios (c:\Usuarios)
         root/      Es la carpeta del usuario root (administrador)
- SUS (Single UNIX Specification)

En los albores de los 2000 muere el SO UNIX, pero no el estándar.

## Qué es UNIX?

No nos referimos al SO antiguo... si no a los estándares que controlan cómo debe ser un SO según esos estándares.
Muchos fabricantes de Hardware, empiezan a montar so que cumplen con esos estándares.

HP: HP-UX (SO certificado UNIX®)
IBM: AIX  (SO certificado UNIX®)
Sun -> Oracle: Solaris (SO certificado UNIX®)
Apple: MacOS (SO certificado UNIX®)

En un momento dado, algunas personas / organizaciones deciden crear SO gratuitos y de libre distribución que cumplan con esos estándares.

## Univ de Berkeley : 386-BSD
                           v
8088 -> 8086 -> 80286 -> 80386 -> 80486 -> Pentium -> Xeon -> i3 -> i5 -> i7 -> i9 -> i11

Se metieron en un follón legal de narices. Litigios y litigios en USA... y años y años... y el proyecto murió... no el código.

## GNU 

Richard Stallman, decide crear un SO que sea libre y gratuito, y que cumpla con los estándares UNIX.
Pero, para que no le jodieran los de AT&T, decide llamar a la organización GNU: "GNU is Not UNIX".

La idea estuvo guay... pero no valieron. Eso si, montaron un huevo de cosas... pero no un SO.
- Shell de tipo cli: bash
- Shell de tipo gui: gnome (hoy en día usada por solaris)
- Juegos: chess
- Editores de texto: emacs, gedit
- Compiladores de c: gcc
No valieron para montar un kernel.

Entonces, un hombrecillo que estaba trabajando en la univ de Helsinki, decide montar un kernel de SO, que cumpla con los estándares UNIX: Linus Torvalds -> Linux.
Linux es un kernel de SO, supuestamente compatible con los estándares UNIX.... pero ni lo sabemos, ni nos importa hoy en día.

De hecho es el Kernel de SO más usado del mundo: Android

Pasó lo que os podéis imaginar: GNU + Linux = GNU (70%) / Linux (30%) (SO, que se distribuye mediante compendios: RedHat, Debian, Ubuntu, Suse, Fedora, Gentoo, Arch, Slackware, ...)

## Un SO no es un programa.

Un SO es un conjunto de programas que se ejecutan en un ordenador controlando el hardware, y que permiten que otros programas se ejecuten en ese ordenador haciendo uso de ese hierro.

Todo SO tiene lo que llamamos un kernel: el núcleo del SO.
Alrededor de ese kernel se montan otro tipo de programas:
- shell: interactuar a humanos con el kernel:
  - shell de tipo cli: línea de comandos sh, bash,...
  - shell de tipo gui: entorno gráfico


# Solaris:

Solaris es un SO de la familia UNIX, que fue desarrollado por Sun Microsystems, y que actualmente es propiedad de Oracle.

Originalmente se llamaba SunOS, y es un SO que se desarrolla para la arquitectura SPARC (RISC) y para la arquitectura x86 (CISC).

Ese SO cumple con los estándares UNIX, y es un SO certificado UNIX®.
Y eso le confiere una serie de características que nos resultan familiares: POSIX:
    Sistema de archivos,
    Gestión de usuarios / grupos / Permisos

Pero, el SO pone muchas cosas encima de la mesa.
- Hay una gran grado de libertad a la hora de crear un SO que cumpla con esos estándares, en lo referente a algunas tareas habituales:
  - Elección de Formato/sistema de archivos: zfs
  - Gestión de servicios: smf **
  - Procedimiento para instalar software ***
- Solaris está pensado para una arquitectura de servidores y para un hardware de alta disponibilidad... y por ello tiene funcionalidades que no tienen otros SO UNIX:
  - Zonas

** Gestión de servicios en SO UNIX o similares:

Antaño teníamos unos scripts que arrancaban y paraban programas, cuando arrancaba o paraba el SO.
Los metíamos en /etc/rc.d/init.d: Init Scripts... Iban agrupados por niveles de ejecución.
Ese se hizo muy popular en los SO UNIX, y se llamaba System V.
Sirvió de base para la gestión de servicios en los SO UNIX, y en los SO que cumplen con los estándares UNIX.

En Linux por ejemplo hoy en día, la gestión de servicios se hace mediante el demonio systemd.
Y nosotros hablamos con ese demonio mediante un cliente: systemctl.

En windows, tenéis una aplicación que se llama services.msc, que os permite hacer lo mismo.

En solaris, la gestión de servicios se hace mediante el demonio smf, y nosotros hablamos con ese demonio mediante un cliente: svcadm.

*** Instalar software en SO UNIX o similares:

Antiguamente era una tortura.
Me tenía que descargar el código fuente de un programa, y compilarlo para mi SO y mi arquitectura concreta. (gcc, make).
Los fabricantes nos daban scripts para hacerlo más fácil: configure, make, make install.
Pero ni aún así.

Poco a poco se empezó a estandarizar la forma de instalar software en SO UNIX y surgen herramientas que serían comparables a lo que hoy en día es la TIENDA DE WINDOWS.
En el mundo linux por ejemplo hay muchos de esos programas:
Debian: apt
    Ubuntu: apt + snap
RHEL + fedora: dnf, yum

En solaris tenemos nuestro propio gestor de paquetes: pkg... formalmente el IPS (Image Packaging System)

Estos programas funcionan todos más o menos igual:
- Tienen registrados repositorios de software
- En esos repositorios hay paquetes de software instalables
- Nosotros podemos buscar, instalar, desinstalar, actualizar, ... esos paquetes de software.
- Esas herramientas me permiten configurar los repositorios de software que quiero usar.

Cuando hablamos de repos oficiales, hablamos de repos que son mantenidos por el fabricante del SO.

# Entornos de producción:

- Alta disponibilidad (Hardware y Software)

    Tratar de garantizar que un sistema va a estar en funcionamiento un determinado porcentaje del tiempo que debería estarlo.
    Se suele pactar contractualmente con el cliente un porcentaje de tiempo de funcionamiento.
    Se suele medir en nueves: 99.9% 
    
        90%     -> 36,5 días al año el sistema puede estar caído        |   €
        99%     -> 3,65 días al año el sistema puede estar caído        |   €€
            Página web de una peluquería.                               |
            La tengo instalada en el PC Gamer de mi hijo.               |
        99,9%   -> 8,76 horas al año el sistema puede estar caído       |   €€€€
            Compro una computadora con:
                2 fuentes de alimentación.
                2 tarjetas de RED
                Dos HDD en espejo RAID1
            Contratar doble proveedor de internet
            Fuente de alimentación con protección anti caidas (baterías : SAI)
        99,99%  -> 52,56 minutos al año el sistema puede estar caído    |   €€€€€€€€€
            Monto eso mismo, pero... en 2 ubicaciones geográficas distintas.
            Contratando proveedores de electricidad distintos.
            Montando generadores de electricidad.
            Sistemas de extinción de incendios.
        100%    -> 0 minutos al año el sistema puede estar caído        v   €€€€€€€€€€€€€€€€€€€€
            Yo puedo asegurarlo nunca... Estamos hablando de componentes electrónicos, y de software... y de seres humanos. Puede haber fallos... y según Murphy, los habrá.
            Llevados al extremo: CAE UN METEORITO EN EL DATACENTER y ya se jodió todo.

    Esos 9 son solamente una forma de indicar la criticidad de un servicio.

  ^ REDUNDANCIA 

    DATOS / Almacenamiento.
    En un entorno de producción el estándar hoy en día es tener al menos 3 copias del dato: Si 2 almacenamientos de la información se pierden, debo seguir pudiendo prestar servicio.
    El dato es lo más valioso para el negocio.

    BACKUPS


- Escalabilidad
    Como ajusto la infra a las necesidades de cada momento.
    
        Ejemplo App1:
            dia 1:      100 usuarios
            dia 100:    98 usuarios         En este caso no necesito escalar.
            dia 1000:   103 usuarios
        
        Ejemplo App2:
            dia 1:      100 usuarios
            dia 100:    1000 usuarios       En este caso necesito escalar: Escalar verticalmente:
            dia 1000:   10000 usuarios              MAS MAQUINA
        
        Ejemplo App3: ES EL HOY EN DIA (Internet)
            hora 0:     10000 usuarios
            hora 1:     1000000 usuarios        
            dia n+2:    10 usuarios
            dia n+3:    10000000 usuarios       

                Web del telepi: 
                    00:00 Usuario: 0
                    01:00 Usuario: 0
                    09:00 Usuario: 0        En este caso necesito escalar. Escalar horizontalmente:
                    12:00 Usuario: 10               MAS MAQUINAS / MENOS MAQUINAS
                    14:00 Usuario: 1000
                    16:30 Usuario: 100
                    20:00 Usuario: 100000000

    Quién me permite hoy en día el contratar o descontratar infra con esta flexibilidad? CLOUDs
        AWS
        AZURE
        GCP
        ...
        Oracle Cloud
        IBM Cloud


    Servidor 1 (cojonudo): 192.168.100.101  <
        Apache .. mi web                        Balanceador 192.168.100.100 <  Proxy reverso <  Clientes
    Servidor 2 (cojonudo): 192.168.100.102  <       Apache 
        Apache .. mi web

    Situación 1
        Servidor 1: CPU 50%
        Servidor 2: CPU 50%

    Estamos bien? o necesitamos más máquinas? en esta situación? NO... TENGO LOS PELOS COMO ESCARPIAS... ACOJONADO ESTOY
    Si se cae el servidor 2, el servidor 1 tiene capacidad para atender a todos los clientes? NO
    Y tengo una caída del cluster en cascada.

        + Servidor 3: Por si se cae algo.

+ Seguridad (Para mi es clave en todos los entornos)

---

# Procedimientos de instalación de software

Para montar ese apache podría optar por:

## 1. Instalación tradicional a HIERRO

      App1 + App2 + App3            Esto NO VALE EN UN ENTORNO DE PRODUCCION
    ----------------------          Problemas:
      Sistema Operativo                 - Qué pasa si una de esas apps tiene dependencias
    ----------------------                incompatibles con otra de esas apps
            HIERRO                      - Qué pasa si una de esas apps tiene una vulnerabilidad
                                          o si entra un virus.
                                        - Qué pasa si app1 se vuelve loca (100% CPU)
                                            App1 pasa a estado OFFLINE 
                                            App2 pasa a estado OFFLINE
                                            App3 pasa a estado OFFLINE

    La instalación la puedo tener AUTOMATIZADA: Ansible, Puppet, Scripts shell...

    Quiero instalar el MySQL:
    PASO 1: Descargar el instalador de MySQL
    PASO 2: Lo ejecuto... lo que puede ser más o menos sencillo o complejo.
    PASO 3: Arranco la moto

        La instalación se realiza en c:\Archivos de programa\MySQL -> ZIP -> EMAIL
        Pues ese ZIP es una IMAGEN DE CONTENEDOR.


## 2. Máquinas virtuales

La virtualización me ofrece un entorno AISLADO donde ejecutar mis programas.

    --------------------
       App1   | App2 + App3
    --------------------
        SO1   |   SO2
    --------------------
        MV1   |   MV2
    --------------------
     Hipervisor:
     VirtualBox, VMware, HyperV, KVM, ...
     Oracle VM Server for SPARC
    --------------------
     Sistema Operativo
    --------------------
          HIERRO

    Esto me resuelve todos los problemas que me dan las instalaciones a HIERRO.
    Pero... viene cargado con sus propios problemas nuevos:
        - Compatibilidad con cierto hardware (El el hipervisor no exponga ciertas características del hardware al SO de la MV)
        - Compartición de recursos entre las VM y el hierro
        - Complejidad de la instalación
        - Complejidad en el mnto.
        - Merma de recursos en el servidor.
        - Perdida de performance.

## 2.1: Dominios de Oracle VM Server

La virtualización me ofrece un entorno AISLADO donde ejecutar mis programas.

                                                    ----------------------------------------
                                                        App1     | App2 + App3
                                                    ----------------------------------------
                                                        SO1      |      SO2
                                                    ----------------------------------------
                                                    Dominio1     |    Dominio 2
    ----------------------------------------------------------------------------------------
     Sistema Operativo Solaris BASE (VM Server)       vvvv              vvv
                vvvvv
    ----------------------------------------------------------------------------------------
                                        Firmware
    ----------------------------------------------------------------------------------------
                                       HIERRO SPARC


## 2.5: Zonas de Solaris

    ----------------------------------
       App1   | App2 + App3
    ----------------------------------
        ZONA1 |   ZONA2
    ----------------------------------
     Sistema Operativo SOLARIS
    ----------------------------------
          HIERRO (x86, **SPARC**)

Con una arquitectura más sencilla, ya que viene integrado en el SO.
Y más eficiente que las MVs y que los contenedores.
En el caso de los contenedores, esos entornos aislados son gestionados por el kernel del SO anfitrión.
En el caso de las zonas, esos entornos aislados son gestionados con ayudas (usando) funciones específicas del Hardware (arquitectura SPARC).

Los contenedores extienden los conceptos base de las zonas de Solaris, estandarizándolos para su uso en:
- cualquier arquitectura de hardware
- cualquier so, mientras sea linux.
- cuqluier "hipervisor"-> GESTOR DE CONTENEDORES
- EXTANDARIZANDO LA FORMA DE DESPLEGAR Y OPERAR SOFTWARE <<<< MAGIA 

## 3. Contenedores

    --------------------
       App1   | App2 + App3
    --------------------
        C1   |   C2
    ------------------------
     Gestor de contenedores:
     Docker, podman, crio
    ------------------------
     Sistema Operativo LINUX (que ejecute un kernel linux)
    ------------------------
          HIERRO

    Un contenedor es un entorno aislado dentro de un Kernel Linux de ejecución de procesos.
    Donde, cada entorno tiene:
    - Sus propias variables de entorno
    - Su propia configuración de red -> Sus propias IPs
    - Su propio sistema de archivos, independiente del sistema de archivos del SO anfitrión.
    - Puede tener limitaciones de recursos: CPU, RAM, HDD, ...
  
TODAS las empresas de software, distribuyen su software mediante imágenes de contenedor.

Los contenedores estandarizan la forma de operar con software.

docker start nginx
             mariadb
             postgresql
             jenkins
             sonarqube

docker logs nginx
             mariadb
             postgresql
             jenkins
             sonarqube

docker restart nginx
             mariadb
             postgresql
             jenkins
             sonarqube

# DEV-->OPS

Es una cultura, un movimiento en pro de la automatización. De qué? De todo lo que hay entre el DEV -> y la operación de ese sistema OPS

Herramientas que nos ayudan a automatizar trabajos: 
- Sistemas: Ansible, Puppet, Chef, SaltStack, Terraform, CloudFormation, Kubernetes, Docker, Vagrant, ...
- Tester:   JMETER, Selenium, Appium, Karma, Mocha, Chai, ...
- Desarrollo: Git, Jenkins, Travis, CircleCI, ...

---

Repaso de algunas cuestiones básicas de funcionamiento de SO Unix:
- Gestión de procesos
- Gestión de memoria
- Sistema de archivos

Revisión a la infra que vamos a utilizar en la formación.


# Proceso

Un proceso es un programa en ejecución.
De mismo programa, puedo tener varias ejecuciones simultáneas.... dando lugar a varios procesos a nivel de SO.
Quién arranca procesos en el SO? El kernel.
Yo humano no arranco procesos... le pido al kernel, mediante una shell que arranque procesos.

Lo primero que ocurre cuando creamos un proceso (arrancamos un programa) es que el kernel crea una estructura de datos en la que guarda información sobre ese proceso: Estado, PID, PPID, UID, GID,
el código de salida de ese proceso... Esa información la almacena en una estructura de datos que se llama PCB (Process Control Block) que guarda en RAM.
El SO va a crear un Thread... hilo de ejecución para ese proceso: Main Thread.
El hilo es el que lleva las órdenes a la CPU.
Un proceso(programa en ejecución) puede optar posteriormente por arrancar más hilos de ejecución.

Pero, el SO reserva mucha más memoria para ese proceso:
- El código del programa (generalmente poco espacio)
- Thread Stack: Datos que permiten al SO realizar un seguimiento de lo que está ejecutando cada hilo de ejecución del proceso. (generalmente poco espacio)
- Datos de trabajo: Variables, estructuras de datos, (generalmente más espacio)
- Caches: Datos que se guardan en memoria para que el proceso no tenga que ir a buscarlos a su origen... porque es lento: Leer unos archivos de disco... leer unos datos de una BBDD (que le hago un query)
   Un programa bien implementado, va metiendo datos en cache, mientras tenga espacio.. y con las mismas, si en un momento está falto de espacio, libera memoria, eliminando datos de la cache.

Esta memoria la gestiona el SO... no va asociada al proceso concreto que estamos ejecutando.
- Buffers de entrada salida al hardware: Enviar datos a la pantalla, por red... o leer desde un HDD un archivo.
- Cache: Los archivos que va leyendo del HDD, los guarda en cache... por si se vuelven a pedir... Si hace memoria, estos datos son eliminados de la cache.

La computadora tiene una cantidad de memoria RAM finita. Si estamos escasos de RAM, el SO puede intentar liberar RAM:
- Eliminando datos de las caches
- Swapping: Me lleva las páginas de memoria de un proceso a HDD... TODAS
- Paging: Me lleva algunas páginas de memoria de un proceso a HDD... ALGUNAS
  Permite un uso más granular de la memoria que el swapping.

Si tengo un proceso que no se está necesitando (ejecutando activamente) en un momento dado, el SO puede optar llevar toda la información de ese proceso a HDD... y liberar la RAM: SWAPPING

Si tengo un proceso que está corriendo activamente, pero hay datos que ahora mismo no se están usando, el SO puede optar por llevar esos datos a HDD... y liberar la RAM: PAGING

El PAGING suele ser más rápido que el SWAPPING.
Ambas estrategias pueden ralentizar el sistema... y ofrecen un comportamiento no determinista (no predecible) en el sistema.
En un momento dado, puedo ver que las cosas van más lento. A veces incluso desactivar el SWAPPING y el PAGING.

Un programa que tenga unos requisitos de 4Gbs para funcionar... a nivel de SO... quizás consume 6 o 7... por esos buffers.

En los SO Unix, los procesos se organizan en un árbol de procesos... y no es casual.
Esto ocurre porque todos los procesos tienen un padre... excepto el primer proceso que arranca el SO: init (pid 1)
De esos procesos se hace forking. Se hace un fork... y se crea un hijo.
El fork de un proceso... no es sino un clon de ese proceso.

Todo proceso tiene al menos 3 canales de comunicación con el SO:
                                        ID
- STDIN: Canal de entrada de datos      0
- STDOUT: Canal de salida de datos      1
- STDERR: Canal de salida de errores    2

    echo "hola" > /tmp/salida.txt
    echo "hola" 1> /tmp/salida.txt
    echo "hola" 2> /tmp/salida.txt
    Por defecto, cuando se redirecciona un canal de comunicación, se redirecciona el canal STDOUT (1)
    echo "hola" 1> /tmp/salida.txt 2>&1
    El canal 1 queda redireccionado a un fichero... y el canal 2 queda redireccionado al mismo sitio que el canal 1.

Cuando cualquier proceso acaba, devuelve un código de salida.
Si es 0, todo ha ido bien.
Si es distinto de 0, algo ha ido mal.
Dependiendo del programa concreto, así el significado de ese código de salida.

# Comunicaciones entre procesos

El SO nos ofrece muchas estrategias para que los procesos se comuniquen entre si:
- Memoria compartida: Shared Memory : Una parte de la RAM se comparte entre varios procesos.
  Varios procesos pueden escribir y leer de esa memoria compartida.
- Pipes: Unidireccionales. Un proceso escribe en un extremo, y otro lee del otro extremo.

    tail -f miarchivo.log | grep "ERROR" > errores.log
    Los dos procesos se ejecutan en paralelo, uno alimentando al otro.

- FIFOs: Unidireccionales. Un proceso escribe en un extremo, y otro lee del otro extremo.
- Signals: Un proceso envía una señal a otro proceso.

       $ kill -<SIGNAL_ID> <PROCESO_ID>
- Socket: Bidireccionales. Dos procesos pueden escribir y leer de un socket.

Los procesos pueden optar por abrir más canales de comunicación con el SO:
- Ficheros
- Sockets

# Sistema de archivos en un entorno UNIX

El sistema de archivos va mucho más allá de una estructura de carpetas y archivos donde guardar información, dentro de un SO UNIX.
    c:\Users\alumno\Documentos\miarchivo.txt
Pero en UNIX, dentro del sistema de archivos, encontramos mappeados:
- dispositivos de hardware
- sockets
- la información de un proceso /proc/p1234 -> Region de la RAM
- puedo tener una zona de la memoria ram, montada como si fuera una carpeta dentro del sistema de archivos.

No podemos asociar... que es un pensamiento muy típico en Windows... que un sistema sistema de archivos es una estructura de carpetas y archivos que tengo guardados en un HDD.
    c:\Sus carpetas... que se guardan en el disco duro, al que he asignado una letra C.

En windows, los HDD los particiono.. Y a cada partición le asigno un formato de sistema de archivos: NTFS, FAT32, exFAT, ... y una letra.

El sistema de archivos tiene una raíz: 
/ (root del fs.... no lo confundamos con el usuario root)
Sobre esa referencia raíz, empezamos a montar otras referencias... que manejaremos como si fueran carpetas y archivos.
    bin/
    opt/
    var/
        carpetaDATOS/ -> Apuntando a otro Pool de almacenamiento de ZFS
        carpeta2/ -> Apuntando a una unidad de almacenamiento en red
    tmp/
        proc/ -> Apuntando a la RAM

# ZFS

De hecho, cuando vayamos a zfs... vamos a poner patas arriba todo esto.
Lo que haremos será tomar varios discos duros... y usarlos para configurar un pool de almacenamiento.
Donde limitaremos el pool para que no haga uso de más de un determinado porcentaje de la capacidad de esos discos duros.

Nos vamos a quitar de en medio la necesidad de un sistema de particionado de discos duros.... y gestión de volúmenes lógicos.... lo que en linux sería el LVM.

ZFS no es solo un formato de sistema de archivos al uso... es un sistema de archivos + un sistema de volúmenes lógicos + un sistema de RAID.... muy optimizado.

/ 
    root/
    home/
    var/
        log/    -> Donde se guardan los logs de los programas
        spool/  -> Donde se guardan los datos de las colas de impresión
        cache/  -> Donde se guardan los datos de cache de los programas
    etc/
        PROGRAMAS
        SO
            RED
            SERVICIOS
    bin/
    opt/
    tmp/
    dev/
    proc/
    run/
        88... MSDOS
        command.com ---> Los programas necesitaban continuamente acceso a ese fichero... Venía en el Floppy del SO.

Nosotros tendremos utilidades que nos ayudan a gestionar ciertas configuraciones ...
Pero esas configuraciones al final se reflejan en archivos que encontramos en el sistema de archivos: /etc.


---

Si instalo de repo (pkg install) me viene todo guay... preconfigurado
    apache
Si no... follones varios
    nginx
        compilar el codigo:  gcc-45 / make... make install  ***
        script de arranque          .sh         Nos lo dan
        manifiesto para SMF         .xml        Nos lo dan
    mysql
        código estaba compilado
            descargarlo
        lo instalamos con pkgadd
            script de arranque       .sh         Nos lo dan (que lo metieron en la carpeta init.d = RUINA !)
        manifiesto para SMF          .xml        No nos lo dan
                    Puedo meter dependencias entre servicios
                    Y se gestiona mediante svcadm
    svcadm: Operar el servicio: enable, disable, restart, refresh, ...
    svccfg: Configurar el servicio: setprop editprop (abre un editor interactivo)

En linux es el equivalente al systemd, que manejamos con el systemctl
En solaris es                 smf,     que manejamos con el svcadm y el svccfg

En linux, el systemd, lee ficheros "de manifiesto" pero con sintaxis ".ini" (.service , .mount)
pero no tenemos nada de configuración... Si dependencias entre servicios, pero no tengo nada de configuración.

---

Weblogic

En cada máquina se monta un nodeManager (esto es un proceso que permite remotamente reiniciar las instancias de weblogic)
En unas máquinas N, montamos un DOMINIO de weblogic (es una agrupación de instancias de weblogic)
En esas máquinas levantamos instancias
    Una de ellas es el ADMIN SERVER

Vereis 800 procesos JAVA:
    NodeManager - proceso JAVA
        ^^^ Para arrancar las instancias de weblogic
    AdminServer - proceso JAVA
    Cada instancia de weblogic - proceso JAVA
    Por delante se pone el loadbalancer (apache, o el ohs de oracle)

    
---

# ZFS

Pool es una agrupación de discos.

Tipos de pool
STRIPE: RAID0
        No tiene redundancia. Lo que obtenemos es un volumen lógico provisionado (que opera) sobre N discos físicos.
        Si tengo más de uno es como si se añadieran por detrás... se suman capacidades.
            1 HDD 1Tb -> Pool 1Tbs... donde los datos no se guardarán redundantes
            2 HDD 1Tb -> Pool 2Tbs... donde los datos no se guardarán redundantes
MIRROR: RAID1.
        Si tenemos redundancia
        Al menos 2 HDD... pero los uso como si fueran un único disco. Los datos se guardan duplicados
        Si pongo 3 discos, permito la perdida de 2 HDD sin perder datos (Los datos se guardan triplicados)
        Mucha seguridad... mucha pasta
            3 HDD 1Tb -> Pool 1Tb... donde los datos se guardarán redundantes
                Pierdo 2x1Tb de capacidad de almacenamiento
RAIDZ:
    RAIDZ1: RAID5           Aguanto la pérdida de 1 HDD
        3 HDD 
    RAIDZ2: RAID6           Aguanto la pérdida de 2 HDD
        5 HDD
    RAIDZ3:                 Aguanto la pérdida de 3 HDD
        8 HDD

    Los RAIDZ tienen una cosita, comparada con el MIRROR:
        En el mirror los datos de guardan duplicados en los discos.
            Si un disco se pierde, los datos los tengo disponibles directamente en otros discos.
        En el raidz, los datos no se guardan duplicados.
            Los datos los tenemos disponibles en algún disco (1 de ellos)
            Y en los otros se guarda información para poder en un momento dado reconstruir los datos perdidos.
        PROBLEMA: Si estoy en RAIDZ1... y un disco se pierde... no pierdo los datos, pero si el servicio.
        El raidz necesita reconstruir los datos... y eso es un proceso que consume recursos de CPU y de HDD.... y tiempo.

Si tengo una bd de prod. optaré por un MIRROR... no me puedo quedar sin servicio.... y eso cuesta pasta!
Si tengo los backups de la BBDD, optaré por un RAIDZ... me sale más barato... y no pasa nada si en un momento hay que reconstruir los datos perdidos de un disco que se haya jodido.

A nivel de HW, depende la controladora que usemos, podemos montar RAIDS... qué irán más rápido que los montados por software.

Y tengo 6 discos.
A nivel de la controladora, puedo montar 2 raids

ilom = firmware
mainldom            1HDD RAID   - 1 HDD
                                - 1 HDD
4 ldom
    bbdd            1 HDD
        oradata
        redo
    jde             1 HDD
    weblogic1       1 HDD
    weblogic2       1 HDD

---

En OracleDB: Hacemos backups de la BD... Hay 3 cosas que podemos hacer
- Full Backup: Copia de seguridad de toda la BD
  Cada 7 días: Los domingos 
- Incremental Backup: Copia de seguridad de los cambios desde el último backup
    Cada noche
- Archivelog Backup:Cada operación que se hace sobre la BBDD (SQL) se va guardando en un fichero: Archivelog
    Si se pierde la BD, puedo reconstruirla a partir de los backups + los archivelogs

    Me interesa restaurar hasta las 15:00pm del jueves

    Restaurar el backup full del domingo
    Restaurar los incrementales desde el domingo hasta el jueves
    Aplicar los archivelogs desde el último incremental hasta las 15:00pm del jueves

---

ilom = firmware
mainldom            1HDD RAID   - 1 HDD         Sistema operativo - primary
                                - 1 HDD

                    1HDD RAID   - 1 HDD         Datos + Programas
                                - 1 HDD   
                                - 1 HDD         

                                - 1 HDD         Redo - SDD pequeño
                    Spare disks  
    4 zonas
        bbdd            1 HDD
            oradata
            redo
        jde             1 HDD
        weblogic1       1 HDD
        weblogic2       1 HDD


Los Backups no tienen nada que ver con la replicación en prod.
        ||                                  ||
    Para datos corruptos                 Disponibilidad

---

carpeta:
    fichero1(v1)
    fichero2(v1)
    fichero3(v1)

Hago un snapshot1:
    carpeta de snapshot1... que contiene:
        ->carpeta/fichero1(v1)
        ->carpeta/fichero2(v1)
        ->carpeta/fichero3(v1)

Hago un cambio:
    carpeta:
        fichero1(v1)
        fichero2(v2)
    carpeta de snapshot1:
        ->carpeta/fichero1(v1)
        carpeta/fichero2(v1)
        carpeta/fichero3(v1)

Hago un snapshot2:
    ->carpeta/fichero1(v1)
    ->carpeta/fichero2(v2)

Más cambios:
    carpeta:
        fichero2(v3)
        fichero4(v1)
    carpeta de snapshot1:
        carpeta/fichero1(v1)
        carpeta/fichero2(v1)
        carpeta/fichero3(v1)
    carpeta de snapshot2:
        ->carpeta del snapshot1/fichero1(v1)
        carpeta/fichero2(v2)


Los snapshots me dan Alta Disponibilidad? NO
    Me dan la posibilidad de volver a un estado anterior de los datos... Me resuelven corrupción de datos. = BACKUP EN UNA BBDD
    La Alta Disponibilidad la consigo con replicación. (en el caso de zfs: MIRROR, RAIDZ)
---

POOL es una agrupación de discos:
    - STRIPE: RAID0
    - MIRROR: RAID1                     \
    - RAIDZ: RAID5, RAID6, RAID7        /   Alta disponibilidad / Tolerancia a fallas de HDD

Dentro de los pool nos creamos datasets... como si fueran carpetas... pero que:
- Tienen configuraciones avanzadas, con respecto a las carpetas estandar de un SO:
  - Pueden tener configuraciones de compresión
  - Puedo hacer snapshots de esos datasets
  - Puedo hacer clones de esos datasets
  - Puedo limitar las cuotas de espacio de esos datasets

Snapshots: Me permiten volver a un estado anterior de los datos         Resolución de corrupción de datos
     -> Rollback (perdiendo los datos que se han modificado desde el snapshot)
     -> Clone (manteniendo los datos que se han modificado desde el snapshot)

    El hacer snapshots y clones, no requiere de espacio adicional en el pool... En los snapshots y en clones quedan punteros a los datos que hay en la carpeta original.

Vamos a poder exportar / importar pools de almacenamiento:
    - Llevarnos discos de un servidor a otro (físico o virtual)
    - Manteniendo TODAS las configuraciones de los pools y datasets

Y Los raids, si bien no son tan rápidos como los montados por HW... son más flexibles y más baratos... y voy a poder crear más.
Las controladores van muy limitadas en cuanto a número de raids que puedo montar.

zfs es el comando para atacar datasets
    zfs list
    zfs create MIPOOL/dataset1
    zfs destroy MIPOOL/dataset1
    zfs snapshot MIPOOL/dataset1@SNAPSHOT1
    zfs rollback MIPOOL/dataset1@SNAPSHOT1
    zfs clone MIPOOL/dataset1@SNAPSHOT1 MIPOOL/dataset2
    zfs get all MIPOOL/dataset1
    zfs set compression=on MIPOOL/dataset1
    zfs set mountpoint=/mnt/dataset1 MIPOOL/dataset1
zpool es el comando para atacar pools
    zpool status MIPOOL
    zpool list
    zpool import MIPOOL
    zpool export MIPOOL
    zpool create MIPOOL RAIDZ1 DISCO1 DISCO2 DISCO3
    zpool destroy MIPOOL

----


T8: 6 HDD

Los presentais directamente al SO

    MAIN LDOM = Sistema operativo que montains a nivel del HOST (equivalente al windows en vuetra máquina)
        HDD1 \
        HDD2 / ZFS MIRROR para el mainldom (primary)
        HDD3 \
        HDD4  \ RAIDZ1 para los 4 LDOMs = ldoms_pool
        HDD5  /
        HDD6 /

         ldm (equivalente al virtualbox)... pero que tiene integración a nivel del fiormware (y esa es la diferencia con virtualbox)
            oracle
            weblogic 1
            weblogic 2
            jde

La controladora SAS que tenis en el servidor (que cuesta una pasta y es diferenciadora) NO LA ESTAIS USANDO
El zfs: 
    - Algo menos eficiente (rendimiento) que un RAID montado por HW
    - Pero mucho más facil de configurar / mantener


En este pool, se han creado N datasets:
en el primary tienes 6HDD físicos:
    2 pools de almacenamiento:
        - rpool         2 discos
        - ldoms_pool    4 discos
            oracle-root         4 datasets de tipo VOLUMEN... que cada uno se presenta al ldom como un HDD
            oracle-redo
            oracle-oradata
            oracle-ora (app) 

    primary:                Para el ldom del oracle:    otro pool dentro del ldom... con su dataset
    oracle-root                 disco0                  rpool (llevan implicito un dataset de tipo fs)
    oracle-redo                 disco1                  redo
    oracle-oradata              disco2                  oradata
    oracle-ora (app)            disco3                  ora

en el primary tienes 6HDD físicos:
    2 pools de almacenamiento:
        - rpool         2 discos
        - ldoms_pool    4 discos
            oracle

    primary:                Para el ldom del oracle:    otro pool dentro del ldom... con su dataset
    oracle                      disco0                  rpool               rpool
                                                                            rpool/redo
                                                                            rpool/oradata
                                                                            rpool/ora   

                                                                            Me interesan como datasets:
                                                                                - snapshots
                                                                                - quotas