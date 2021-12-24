# Curso de Terraform

Hola! En este repositorio podrás encontrar un poco de información básica sobre terraform y un par de ejemplos, espero te sean útiles tanto como a mi.

Happy learning!

## Capítulo 1 - Infraestructura como código 🚀

La infraestructura como código es un enfoque para la automatización de infraestructura basado en las prácticas del desarrollo de software.

Los principios de la infrastructura como codigo son los siguientes:

- Los sistemas se pueden reproducir fácilmente
- Los sistemas son desechables
- Los sistemas son consistentes
- Los sistemas son repetibles
- El diseño siempre está cambiando

Algunas prácticas generales suelen ser:

- Utilizar archivos de definición
- Sistemas y procesos autodocumentados
- Versionar todas las cosas
- Prefeferir cambios pequeños
- Mantener los servicios continuamente disponibles

## Capítulo 2 - Tipos de herramientas para implementar infraestructura como código 🚀

Las herramientas para definición de infraestructura nos permiten especificar qué recursos de infraestructura se desean crear y cómo configurarlos.

Por otro lado, los archivos de configuraciones nos permiten escribir la infraestructura que queremos crear y son útiles para la automatización.

A continuacion podemos ver un archivo de terraform encargado de crear una subnet y una instancia dentro de AWS.

```
variable "environment" {
    type = "string
}

variable "subnets" {
    type = "map"

    default = {
        qa = "subnet-12345678"
        stage = "subnet-abcdabcd"
        prod = "subnet-a1b2c3d4"
    }
}

resource "aws_instance" "web" {
    instance_type = "t2.micro"
    ami = "ami-87654321"
    subnet_id = "${lookup(var.subnets, var.environment)}"
}
```

Luego tenemos las herramientas de configuracion de servidores,las herramientras para _definir la infraestructura_ nos ayudan a **crear la infraestructura** y las herramientas de _configurtación de servidores_ nos permiten **configurar la infraestructura**, nos permiten configurar los servidores con el estado deseado.

En pocas palabras, una vez que la infraestructura es creada, podemos especificar caracteristicas como que paquetes necesitamos, que directorios quiero crear, usuarios, permisos, etc.

Cuando se habla de herramientas de configuración de servidores es normal escuchar la palabra `Aprovisionamiento`, que se refiere al proceso que permite que un elemento esté listo para utilizarse. Por ejemplo, tener todas las dependencias listas para el despliegue de la app.

Algunos de los enfoques de gestión de servidores son:

- Configuración de servidores
- Empaquetar plantillas de servidores
- Ejecutar comandos en los servidores
- Configuración desde un registro central

Recuerda también tomar en cuenta estas opciones para elegir una herramienta:

- Modo desatendido para herramientas de líneas de comando (Ejecutar comandos sin necesidad de solicitar confirmación o intervención humana)
- Idempotencia
- Parametrizable

Los principales objetivos de la gestión automatizada de servidores:

- Un nuevo servidor puede ser aprovisionado a demanda
- Un nuevo servidor puede ser aprovisionado sin intervención humana
- Cada cambio puede ser aplicado a un fleet de servidores

Herramientas para definir infraestructura:

- Terraform (Distintos proveedores)
- Cloud formation (Para AWS)
- Oen stack heat (Para Open stack)

Herramientas de configuraciones de servidores:

- Ansible
- Chef
- Puppet

## Capítulo 3 - Beneficios de la infraestructura como código 🚀

1. **Creación rápida bajo demanda** - Capacidad de reutlizar los archivos de definiciones
2. **Automatización** - Contar con estos archivos definidos previamente, nos permite usar herramienta de CI/CD
3. **Visibilidad y trazabilidad** - Facilita el versionamiento
4. **Ambientes homogéneos** - Podemos recrear varios ambientes a partir de las mismas definiciones, por ejemplo, mantener dev y test con las mismas configuración
5. **Fácil de testear**

## Capítulo 4 - Terraform 🚀

![Terraform logo](https://res.cloudinary.com/practicaldev/image/fetch/s--B1veEEvw--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://i2.wp.com/www.thedevcoach.co.uk/wp-content/uploads/2019/08/terraform.png%3Fresize%3D760%252C399%26ssl%3D1)

[Terraform](https://www.terraform.io/) es una herramienta Open Source, creada en Go, que nos permite crear y administrar infraestructura.

Terraform interactua con las APIs de los proovedores de nube, Terraform es capaz de conocer los servicios a los cuales tiene acceso dependiendo el proveedor.

Una definición de recursos en Terraform puede verse de la siguiente manera:

```
provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web" {
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"
    tags = {
        Name = "HelloWorld"
    }
}
```

Características clave de terraform

- Es una herramienta de infraestructura como código
- Tiene planes de ejecución
- Fácil de automatizar

[Aquí](https://www.terraform.io/language/providers) podrás encontrar la lista de cloud providers soportados por Terraform!

## Capítulo 5 - Terraform vs otras herramientas de infraestructura como código 🚀

![Terraform vs other tools](https://images.clickittech.com/2020/wp-content/uploads/2021/02/19163210/CloudF-vs-Terraform_Banner-1536x772-2.jpg)

### Gestión de configuraciones vs definición de infraestructura

El _crear_ infraestrucutura y el _gestionar_ infraestructura son 2 cosas diferentes, existen herramientas como [Ansible]() que nos permiten configurar nuestra infraestructura y a la vez definirla, sin embargo, este último no es su principal función. Por esta razón, es normal utilizar herramientas como Ansible y terraform en conjunto para crear y configurar la infraestructura.

### Infraestructura mutable vs Infraestructura inmutable

_La infraestrucutra mutable_ es cuando el estado de un servidor cambia, por ejemplo, al realizar los cambios entre una version y otra.

![Ejemplo de infraestructura mutable](https://i.imgur.com/1YUMR6F.png)

_La infraestructura inmutable_, por otra parte, no crea la nueva versión de nuestra aplicación sobre la anterior, si no que destruye un servidor y crea uno con los cambios nuevos.

![Ejemplo de infraestructura inmutable](https://i.imgur.com/ELm9IB2.png)

### Lenguaje declarativo vs lenguaje procedural

En el lenguaje declarativo, nosotros indicamos a las herramientas _qué hacer_, por ejemplo:

```
resource "aws_instance" "example" {
    count         = 10
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
}
```

Mientras que en el lenguaje procedural o imperativo decimos _cómo hacerlo_, por ejemplo:

```
- ec2:
    count: 10
    image: ami-0c55b159cbfafe1f0
    instance_type: t2.micro
```

La diferencia entre estos 2 es que, si nosotros ejecutamos el código procedural inicialmente, tendremos 10 instancias pero si queremos aumentar el numero a 15 y volver a ejecutarlo, serán creadas otras 15 instancias. El lenguaje declarativo, siguiendo el mismo proceso, solo creará 5 instancias extra.

## Capítulo 6 - Packer: elementos y comandos 🚀

[Packer](https://www.packer.io/) es una herramienta para definir infraestructura inmutable, creada por HashiCorp, nos ayuda a crear imagenes o AMIs dentro de cualquier proveedor.

Elementos de Packer:

```JSON
{
    // Esta sección nos permite definir variables a utilizar
    // por ejemplo, variables de entorno
    "variables": {
        "aws_access_key": "",
    },
    // Dentro de builders especificamos de que imagen base
    // crearemos nuestra nueva imagen, en este ejmplo es Amazon
    "builders": [
        {
            "type": "amazon-ebs",
        }
    ],
    // Seccion para personalizar y agregar caracteristicas
    // nuestra imagen base
    "provisioners": [
        {
            "type": "shell",
            "script": "baseInit.sh"
        }
    ],
    // Instrucciones para ejecutar comandos después de crear
    // la AMI, esta parte es NO es ejecutada dentro de la AMI
    "post-processors": [
        {
            "type": "manifest",
            "output": "manifest.json",
            "strip_path": true
        }
    ]
}
```

## Capítulo 7 - Instalación 🚀

Es momento de comenzar con la práctica, recuerda comenzar la descarga de Packer desde [aquí](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli), después de descargarlo, asegurate de descomprimirlo y colocarlo en algún lugar como `C:\Program Files\Packer` y posteriormente registrarlo dentro de tus variables de entorno.

Para descargar Terraform accede a este [link](https://www.terraform.io/downloads) y sigue los mismos pasos para la instalacion de Packer de hace un momento.

Por último, puedes validar las instalaciones de Packer y Terrraform con `packer --version` y `terraform --version`

Con esto, estamos listos para avanzar!

## Capítulo 8 - Instalación 🚀

Dentro de este repo utilizaremos AWS como proveedor, por lo tanto crea tu cuenta root desde la [consola de AWS](https://aws.amazon.com/) y sigue los pasos indicados por Amazon.

Una vez tengas tu cuenta y puedas acceder a ella, busca el servicio de IAM, dentro del menú lateral, selecciona _Usuarios_ y luego _añadir usuarios_.

![Creación de usuario](https://i.imgur.com/NLTW0No.png)

Coloca el nombre que desees, por ejemplo tu nombre y selecciona las opciones de Acceso mediante programación y Acceso a la consola e administración, esto nos brindara nuestras access keys.

![Establecer detalles del usuario](https://i.imgur.com/kYixyld.png)

Después de colocar tu contraseña, otorga a tu usuario permisos de administrador (O los permisos que tu creas convenientes).

![Permisos](https://i.imgur.com/PpxxROz.png)

Como resultado de estos pasos, obtendrás tus Access Keys, recuerda **JAMÁS JAMÁS JAMÁS JAMÁS** compartir estas llaves, ni colocarlas en un repositorio público.

Por último, asegurate de contar con el AWS CLI instalado y configurado, puedes obtener más información de este último paso en [este enlace](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html).
