## Creación de bucket para Terraform backend

Antes de comenzar, recuerda que el nombre de los buckets es global y solo puede existir un bucket con un mismo nombre, por lo tanto, recuerda modificar el nombre dentro de `variables.tf`.

Para poder colocar nuestro archivo de estado de forma remota necesitamos crear un bucket de s3 para trasladar nuestros cambios locales, esto mejora la seguridad, de forma que solo los usuarios de nuestra organización pueden acceder a ellos.

Para completar estra práctica crea los archivos de `main.tf` y `variables.tf`, después, ejecuta `terraform init`, esto creará nuestros archivos de estado en forma local como de costumbre.

Una vez te asegures de que tu bucket ha sido creado, crea el archivo de `backend.tf` y ejecuta nuevamente `terraform init`. Si te das cuenta, nuestro antiguo archivo para guardar el estado de terraform se encuentra vacío, por lo que hemos trasladado nuestro estado de forma exitosa.
