# Mt2Web.py-docker

Despliegue automatizado de Mt2Web.py

#Motivacion

La idea de este proyecto es ayudar a las personas a desplegar la aplicación Mt2Web.py mas rapido, y puedan tener funcionando las páginas de sus servidores en menor tiempo.

#Caracteristicas principales

1. Para implementar esta pagina solo es necesario tener conocimiento basico
2. Se realizara el despliegue con un Dockerfile
3. No es necesario tener conocimientos en servidores web

#Requerimientos

1. VPS minimo de 512 MB de Ram y 5 GB disco
2. Instalar docker.io en el vps
3. Instalar git en el vps

#Despliegue

Para realizar el despliegue se usan los siguientes comandos.

```
git clone https://github.com/luisito666/Mt2Web.py-docker.git
cd Mt2Web.py-docker/
git clone https://github.com/luisito666/Mt2Web.py.git
```
Explicación:
1. Se clono el repositorio usando git.
2. Se ingresa al directorio que se clono
3. Se clona el repositorio del proyecto principal

Nota: Antes de realizar la imagen, se tiene que crear el archivo settings.py en la carpeta core del proyecto Mt2Web.py, esto para que funcione correctamente. De no realizarse la maquina que se desplega no sabra a que base de datos conectarse.
para mas informacion del archivo settings.py puedes ingresar a [Mt2Web.py](https://github.com/luisito666/Mt2Web.py)

Ahora vamos a realizar la creacion de la imagen y el despliegue de esta.

```
docker build -t luisito666/mt2web .
docker run -d -p 80:80 luisito666/mt2web
```

Si quieren ingresar al contenedor que ejecutaron.

```
docker exec -it luisito666/mt2web bash
```

Si quieren ver el estado del contenedor

```
docker ps
```

Ya con esto finalizamos el proceso de despliegue del aplicativo.

Ingresar a http://ip-o-nombre-de-tu-server.com
