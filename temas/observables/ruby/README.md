
# Observables en Ruby
La implementación de ReactiveX en Ruby se realiza mediante la biblioteca RxRuby. Esta biblioteca proporciona una interfaz de programación para trabajar con observables y operadores de Rx en Ruby.
## Instalación
Para instalar RxRuby, se debe ejecutar el siguiente comando en la terminal:
```bash
gem install rx

```
## Ejemplo de uso
Imaginemos que somos estudiantes universitarios y debemos asistir a clases presenciales en la universidad. Pero el horario de las clases cambia constantemente sin previo aviso. En este caso, sería de gran ayuda contar con un sistema que nos notifique cuando se produzcan cambios en el horario.

Aquí es donde entra en juego el ejemplo de uso del siguiente código. Podríamos adaptarlo para que, en lugar de comprobar la última fecha de modificación de un archivo en Google Drive, compruebe la última modificación del horario de clases en línea de la universidad. De esta manera, podríamos crear un stream de eventos que nos notifique cuando se produzcan cambios en el horario de clases.

```ruby
require 'rx'
require 'google/apis/drive_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'

# Define las credenciales de autenticación
OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'.freeze
APPLICATION_NAME = 'Drive API Ruby Quickstart'.freeze
CREDENTIALS_PATH = 'credentials.json'.freeze
TOKEN_PATH = 'token.yaml'.freeze
SCOPE = Google::Apis::DriveV3::AUTH_DRIVE_READONLY

# Configura la API de Google Drive
service = Google::Apis::DriveV3::DriveService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = Google::Auth.get_application_default(SCOPE)

# Crea un stream de eventos que emite la última fecha de modificación del archivo
def crear_stream_actualizacion(nombre_archivo, id_archivo)
  Rx::Observable.interval(60) # Emite un evento cada 60 segundos
    .map do
      archivo = service.get_file(id_archivo, fields: 'modified_time')
      ultima_modificacion = archivo.modified_time
      "#{nombre_archivo} fue actualizado por última vez el #{ultima_modificacion}."
    end
end

# Suscríbete al stream de eventos y muestra los valores emitidos
crear_stream_actualizacion('Archivo de ejemplo', '1vp1ngVlvRGyTYxp6W4775feD4k2ShEA8')
  .subscribe(
    lambda { |valor| puts valor },
    lambda { |error| puts "Error: #{error}" },
    lambda { puts "Completado" }
  )

```
## Explicación del código
### Configuración de la API de Google Drive
En primer lugar, se define la configuración de la API de Google Drive. Se establecen las credenciales de autenticación y se crea una instancia de la clase `DriveService` para acceder a la API.
### Creación del stream de eventos
Para crear el stream de eventos que emite la última fecha de modificación del archivo, se utiliza la función `crear_stream_actualizacion`. Esta función recibe como parámetros el nombre del archivo y su ID en Google Drive.
En el cuerpo de la función, se utiliza la clase `Rx::Observable` para crear un stream de eventos que emite un evento cada 60 segundos (utilizando el operador `interval`). Luego, se utiliza el operador `map` para transformar cada evento emitido en una cadena de texto que contiene la información de la última fecha de modificación del archivo.
### Suscripción al stream de eventos
Finalmente, se utiliza el método `subscribe` para suscribirse al stream de eventos y recibir los valores emitidos. Este método recibe tres lambdas como parámetros: uno para manejar los valores emitidos, otro para manejar los errores y otro para manejar la finalización del stream.
En este ejemplo, se utiliza una lambda para imprimir cada valor emitido por el stream. Si se ejecuta el código, se imprimirá en la consola la última fecha de modificación del archivo cada 60 segundos.
## Prueba del código
Para probar el código, se debe ejecutar el archivo Ruby que contiene el código. Asegúrate de tener instaladas las bibliotecas RxRuby, Google APIs Client y Google Auth.
```bash
gem install rx google-api-client googleauth

```
Luego, crea un archivo llamado `credentials.json` con las credenciales de autenticación de Google Drive. Puedes obtener estas credenciales en la Consola de Desarrolladores de Google.
Finalmente, ejecuta el archivo Ruby que contiene el código:
```bash
ruby nombre_del_archivo.rb

```
Si todo ha sido configurado correctamente, se debe imprimir en la consola la última fecha de modificación del archivo cada 60 segundos.

