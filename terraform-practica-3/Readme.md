## Condiciones - Uso de variables por archivo

En la práctica pasada vimos como podemos proporcionar un archivo de variables a nuestro documento de Terraform con el comando `terraform apply -var-file <arhivo>.tfvars`, esto nos ayuda a mantener nuestra infraestructura por ambientes, por lo que, si deseamos utlizar las variables para un ambiente de test o prod, solo basta con indicar el archivo correspondiente dentro del comando visto previamente.

_Nota:_ Si nombramos nuestro archivo de variables .auto.tfvars ya no será necesario pasarle el parametro -var-file a Terraform.

## Dynamics

Usando la palabra reservada dynamic podemos iterar sobre un objeto para que Terraform configure varios recursos similares.

## Interpolación

Nos ayuda a referenciar recursos creados entre ellos, en este ejemplo vemos como hacemos uso de la interpolación al crear un Security Group y llamarlo dentro de nuestra instancia con:

```
#security_groups = [<recurso>.<nombre-del-recurso>.<valor-del-recurso>]
security_groups = [aws_security_group.ssh_conection.name]
```

En pocas palabras, lo que hacemos es:

1. Decir que nuestra instancia tendrá un security group con la palabra reservada `security_groups`
2. Dentro de la lista, el primer valor antes del punto es referenciar al recurso, `aws_security_group`
3. Como recordarás, al crear un recurso colocas el tipo, seguido de un nombre para identificarlo, eso es el segundo valor `ssh_connection`
4. Valor de nuestro security group a llamar, en este caso `name`
