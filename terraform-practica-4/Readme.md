## Creación de bucket para Terraform backend

Antes de comenzar, recuerda que el nombre de los buckets es global y solo puede existir un bucket con un mismo nombre, por lo tanto, recuerda modificar el nombre dentro de `variables.tf`.

Para poder colocar nuestro archivo de estado de forma remota necesitamos crear un bucket de s3 para trasladar nuestros cambios locales, esto mejora la seguridad, de forma que solo los usuarios de nuestra organización pueden acceder a ellos.

_Nota:_ Para completar estra práctica crea los archivos de `main.tf` y `variables.tf`, después, ejecuta `terraform init`, esto creará nuestros archivos de estado en forma local como de costumbre. O bien, crear un Bucket de s3 previamente.

Una vez te asegures de que tu bucket ha sido creado, crea el archivo de `backend.tf` y ejecuta nuevamente `terraform init`. Si te das cuenta, nuestro antiguo archivo para guardar el estado de terraform se encuentra vacío, por lo que hemos trasladado nuestro estado de forma exitosa.

# Enriptación de archivo de estado

Para nosotros es posible acceder al archivo de estado aún cuando este se encuentra en un bucket privado, por lo tanto, una buena práctica es encriptar nuestro archivo.

### Crear llave de KMS

KMS es un serivicio de AWS que se encarga de encriptar nuestra información y a la vez de manejar la llave de encriptación por nosotros, consulta el siguiente link para obtener más información de encriptado con KMS https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
