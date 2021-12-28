## Uso de variables

Para crear archivos de terraform escalables es necesario el uso de variables, aprovechando las ventajas de solo cambiar el valor una vez y reutilizar esta variable una infinidad de veces.

### main.tf

Dentro del archivo `main.tf` hacemos un refactor de la práctica pasada y procedemos a usar variables, accedemos a estas por medio de `var.<nombre-de-variable>`.

### variables.tf

Este archivo nos permite declarar nuestras variables y asignarles 3 atributos:

- **default:** El valor por defecto en caso de no asignarle uno directamente
- **description:** Documentar es una buena práctica así que podemosdar un breve comentario del uso de la variable
- **type:** El tipo de nuestra variable, puede ser `string | list | map`

_Nota:_ No es necesario colocar los 3

### dev.tfvars

En este archivo colocaremos siempre el valor de nuestras variables directamente, estas serán utilizadas de forma atuomática

### Extras

Una forma de desplegar nuestro archivo con variables de terraform sin interacción es `terraform apply -var-file dev.tfvars -auto-approve`

Para eliminar la infraestrucutra desplegada, utilizamos `terraform destroy -var-file dev.tfvars -auto-approve`

### Evitar eliminar infraestructura

Es común que cuando se destruye la infraestructura no se quiera destruir algún recurso en específico (por ejemplo la base de datos) de forma que podemos especificarlo en la definición de dicho recurso de la siguiente manera:

```
resource "aws_db_instance" "example" {
  # ...
  lifecycle {
    prevent_destroy = true # no destruir cuando se aplique terraform destroy
  }
  timeouts {
    create = "60m"
    delete = "2h"
  }
}
```
