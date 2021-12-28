## Creación de instancia

Con terrafom somos capaces de crear la infraestructura necesaria para nuestros proyectos, como: Load Balancers, Security Groups, Instancias, Subnets, etc.

### Provider

Dentro de nuestro archivo `main.tf` nos encargamos de especificar nuestros providers (en este caso AWS). En el ejemplo colocamos los valores de:

- **region:** La region en la que buscamos desplegar nuestra instancia
- **profile:** El perfil del cual obtendremos las Access Keys

##### \* El campo de profile nos ayuda a trabajar con distintas cuentas de AWS. Puedes mostrar la lista de tus profiles registrados con `aws configure list-profiles`. Evita el cambio constante de variables de entorno dependiendo del proyecto en el que te encuentres trabajando, ya que normalmente guardas las Access Keys de cada cuenta dentro de `aws configure --profile <nombre-del-proyecto>`.

## Resource

En esta sección se especifica el recurso a crear, o sea: `aws_instance` y el nombre por el cual nos dirigimos a ella `platzi-instance`.

Especificamos el id de la ami y su tipo, por lo que se creará una instancia `Linux 2` de tipo `t2.micro` para mantener nuestra capa gratuita.

Y por último, los tags que queramos colocar como el nombre y el stage o entorno en el que se colocará nuestra instancia.

## Deploy de main.tf

Antes de hacer deploy a nuestro archivo `main.tf` ejecutaremos un par de comandos para evitar errores futuros, como por ejemplo:

- **terraform validate:** Para asegurarnos de que la sintaxis de nuestro archivo sea válida.
- **terraform fmt**: Para dar formato correcto a nuestro archivo

_Nota:_ Si no habías realizado un deploy anteriormente con terraform es probable que necesites ejecutrar `terraform init` para instalar los pluggins necesarios para desplegar la infraestructura.

**terraform plan** es otro comando que desplegará la serie de pasos a seguir con base a tu archivo de definición, esto nos ayuda a evitar despliegues no deseados y saber con antelación que ocurrirá.

Si hasta el momento todo marcha como lo esperamos, ejecutamos **terraform apply** para desplegar nuestra instancia, en un par de segundos podrás ver el reflejo de los cambios desde tu consola de AWS.
