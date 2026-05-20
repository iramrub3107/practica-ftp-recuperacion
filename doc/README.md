# PASO 1: Configurar DNS:

Para esto, lo haremos en base a la práctica realizada previamente sobre configurar un servidor DNS. Aquí se puede observar que el servidor funciona correctamente:

![Imagen de configuración del DNS](./img/img02.png)

# PASO 2: Configurar el cliente gráfico

+ FileZilla instalado y posicionado en la carpeta pruebasFTP
![Imagen de FileZilla 1](./img/img01.png)

+ Realización de la conexión anónima a  ftp.cica.es correcta más descarga correcta de archivos
![Imagen de FileZilla 2](./img/img03.png)

+ Intento de subida de archivos
Como se puede observar, no me deja subir el archivo de texto porque no tengo permisos
![Imagen de FileZilla 3](./img/img04.png)

# PASO 3: Instalación y configuración del servidor "vsftpd" sobre Linux
Para ello, nos instalaremos el servicio **vsftpd** ejecutando `sudo apt-get install -y vsftpd`.

Después de instalar el servicio, podremos observar que se han creado un nuevo usuario y un nuevo grupo con el mismo nombre: ftp.
![Usuario FTP](./img/img05.png)<br>
![Grupo FTP](./img/img06.png)

Además, también se crea la ruta "home" de FTP:<br>
![Home FTP](./img/img07.png)

Los usuarios que no pueden usarse están en **/etc/ftpusers**:<br>
![Usuarios sin FTP](./img/img08.png)

### Usuarios del servidor
Si ejecutamos `sudo service vsftpd status`, podremos observar que el servicio (o mejor dicho el servidor) está funcionando<br>
![FTP Funcionando](./img/img09.png)

Y el puerto 21 está abierto:<br>
![FTP Puerto abierto](./img/img10.png)

A continuación, creamos a los 3 usuarios que necesitamos (Luis, María y Miguel):<br>
![FTP Usuarios](./img/img11.png)<br>
(Hay que tener en cuenta que en la captura de pantalla pone que los usuarios ya existen porque los había creado previamente)

Antes de continuar con el siguiente apartado, haremos varias pruebas para comprobar que todo funciona bien:

+ Anónimo:
![Anónimo](./img/img12.png)

+ Luis: (Enjaulado)
![Luis](./img/img13.png)

+ Miguel: (Enjaulado)
![Miguel](./img/img14.png)

+ María: (No enjaulada)
![María](./img/img15.png)

# PASO 4: Configuración del servidor vsftpd seguro

Generamos en /etc/ssl/certs el certificado ejecutando:

`sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/izanramos.com.pem -out /etc/ssl/certs/izanramos.com.pem` <br>
