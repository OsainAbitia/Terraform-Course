## Módulos

A primera vista el orden de las carpetas puede parecer confuso, te recomiendo leer este readme a la par que exploras las carpetas en otra ventana de tu explorador, sin embargo es necesario recordar los siguientes puntos cuando se habla de módulos:

1. Un módulo es una parte de código que puede ser reutilizado dentro de distintos proyectos de terraform
2. Estos módulos requieren de su _definición de recursos_ y de la _definicion de las variables_, sin embargo, la _asignación de valores de estas variables_ no necesariamente se incluye con los módulos (A excepción que coloquemos valores default dentro de la declaración con el paramtero `default`)
3. De igual forma, requerimos colocar nuestro archivo de variables en la carpeta raíz ya que al invocar un modulo, necesitamos saber que parametros (variables) necesita nuestro módulo
4. En nuestra carpeta raíz **SÍ** es necesaro colocar nuestro archivo `dev.tfvars` donde declaramos finalmente los valores para las variables.

Toma un tiempo para leer esto de nuevo ya que puede ser confuso, solo recuerda que los módulos son un fragmento de código independiente, así puedes usar tus módulos en otros proyectos.

## Módulos remotos

Los módulos locales son útiles, pero tienen la limitante de que solamente se encuentran en tu máquina. Para mejorar el trabajo remoto y reutilización de módulos podemos usar el control de versiones de preferencia, ya sea GitHub o BitBucket.
La forma en la que importamos un módulo remoto es la siguiente

```
module "app-platzi" {
  source        = "github.com/<tu-usuario>/<nombre-repositorio>/<módulo>"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  tags          = var.tags
  sg_name       = var.sg_name
  ingress_rules = var.ingress_rules
}
```

Es posibe utilizar módulos de terceros, sin embargo, recuerda siempre realizar un fork del módulo que quieras utilizar, de esta forma no tendrás conflictos coon tu trabajo en caso de que el módulo se llegue a actualizar
