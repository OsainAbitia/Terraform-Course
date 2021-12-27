## Estructura de nuestro archivo Packer

Como recordarás, la estructura de los archivos de definición de packer contienen distintos bloques (variables, builders, provisioners, etc.), comenzaremos hablando breviamente dentro de cada uno de ellos y su contenido.

### Variables

Dentro de esta sección declararemos nuestas access y secret keys, recuerda no escribirlas directamente en el archivo, en su lugar aprovecha el uso de las variables de entorno.

### Builders

Aquí colocaremos datos sobre nuestra imagen base, como el typo (en este caso `amazon-ebs`), nuestras access keys, region, etc.

Algo importante de mencionar es que dentro de esta sección deberás remplazar el valor de owners por el id de tu cuenta de AWS.

### Provisioners

Dentro de provisioners colocamos las carectiristicas para personalizar las AMIs, en este caso, registrar nuestra llave publica dentro de las llaves autorizadas y ejecutar el script para la instalación de docker.

## Antes de comenzar con el demo

Deberás crear una instancia desde la consola de aws con centos para posteriormente crear la AMI con nuestro archivo de Packer.

Recuerda que puedes lograrlo con los siguientes pasos:

1. Accede a tu cuenta de AWS
2. Ve al servicio de EC2
3. En el menu lateral, accede a instancias (en caso de que no te redirija a esta seccion de forma automática)
4. Por la parte superior derecha, deberás ver el botón de crear instancias o launch instances, da click.
5. Busca la imagen que contenga Centos y se encuentre dentro del Free tier para no recaer en gastos inecesarios, y termina de configurar tu instancia (puedes dejar la mayoria de los campos en default para no salir de la capa gratuita).

Dentro de esta instancia debes realizar el paso para generar las llaves públicas y privadas descrito en la siguiente sección (el comando que comienza con ssh-keygen)

## Demo

En esta demo se creara una AMI para AWS con una llave publica personalizada y con docker. En esta demo se asumirá que ya tienes una cuenta de AWS previamente creada.

- Crear un usuario en tu cuenta de AWS y obtener las credenciales (secret_id y secret_key) de AWS
- Configurar las credenciales como variables de entorno

  ```
    $ export AWS_ACCESS_KEY_ID=""
    $ export AWS_SECRET_ACCESS_KEY=""
  ```

- Dentro del directorio `scripts` se encuentra la llave publica que se agregara a la imagen base resultante. Por cuestiones se seguridad no se encuentra la llave privada por lo que se sugiere que se cree un set de llaves y se remplace el contendido del archivo scripts/packer-key.pub por el valor de llave publica generada (.pub). Para generar el set de llaves puedes seguir las siguientes instrucciones:

  ```
    $ ssh-keygen -f ~/.ssh/packer-key -t rsa
    # Este comando generará 2 archivos "packer-key" que contiene la llave privada y "packer-key.pub" que contiene la llave publica, el contenido de esta es el que e reemplazara en el archivo "scripts/packer-key.pub" dentro de esta carpeta.
  ```

- Para validar la sintaxis del archivo de definición que contiene todas las configuraciones necesarias se ejecutará el siguiente comando:

  ```
    $ cd demo-packer
    $ packer validate aws-ami.json
  ```

- Finalmente se procede a crear el AMI en la cuenta de AWS configurada previamente. y para ello es necesario ejecutar el siguiente commando
  ```
    $ cd demo-packer
    $ packer build aws-ami.json
  ```
