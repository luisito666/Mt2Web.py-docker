# [Mt2Web.py-docker](https://github.com/luisito666/Mt2Web.py-docker)

Despliegue automatizado de [Mt2Web.py](https://github.com/luisito666/Mt2Web.py)

# ¿Que es Mt2Web.py-docker?

Es una imagen de docker con todas las dependencias necesarias para ejecutar la aplicacion [Mt2Web.py](https://github.com/luisito666/Mt2Web.py)


# Como usar esta imagen

Tu puedes ejecutar el proyecto [Mt2Web.py](https://github.com/luisito666/Mt2Web.py) despues de clonarlo y estando dentro del directorio donde esta todo el codigo fuente.

```
docker run -d -p 80:80 --name mt2web -v $PWD:/var/www/html/Mt2Web.py/ luisito666/mt2web
```

Ya con esto finalizamos el proceso de despliegue del aplicativo.

Ingresar a http://ip-o-nombre-de-tu-server.com

Nota: recuerda antes de ejecuar este comando debes de editar el archivo config.yml y poner los datos correspondientes a tu servidor.

# Construir la imagen localmente con Docker (opcional)

```
git clone https://github.com/luisito666/Mt2Web.py-docker.git
cd Mt2Web.py-docker/
docker build -t luisito666/mt2web .
```

# Ejecutar las migraciones

Para ejecutar las migraciones primero entramos al contenedor y ejecutamos este comando.
```
python manage.py migrate
```

Si quieren ver el estado del contenedor

```
docker ps
```

