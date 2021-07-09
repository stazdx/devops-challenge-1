# DevOps Challenge

Prueba diseñada para ver tus habilidades en el mundo DevOps. Se evaluará las herramientas fundamentales que utilizamos tales como docker, Nomad/Consul, CI/CD y Terraform. 

¡Te deseamos mucho éxito!


## Tareas
* Dockerizar la aplicacion node
* Crear un pipleine para construir la imagen.
* Crear un Nomad job para desplegar la imagen en Nomad
* Crear un archivo Terraform para lanzar una instancia en EC2 con estas caracteristicas: 
  * Instancia **t3a.nano**
  * Disco con **20GB**
  * Acceso SSH a la IP **11.22.33.44**
  * Imagen base **Amazon Linux 2**
* Documentar las acciones realizadas 
  
**Importante**    
> Documentar correctamente el proceso es muy importante para asegurar que el equipo pueda continuar con las tareas de ser necesario. 

## Bonus
* Imagen docker pequeña
* Ejecutar con un usuario distinto a root
* Que el pipeline ejecute los tests antes de hacer build
* Usar Forever o PM2

