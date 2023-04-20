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

  
