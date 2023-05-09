require 'google/apis/drive_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'
require 'date'
require 'dotenv'
require 'rx'

# Configurar el entorno
Dotenv.load
OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
APPLICATION_NAME = 'Drive API Ruby Quickstart'
CLIENT_SECRETS_PATH = 'client_secret_611963298214-bfuipum207i0db1avq4chmbm1rhd0jbh.apps.googleusercontent.com.json'
CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                             "drive-ruby-quickstart.yaml")
SCOPE = Google::Apis::DriveV3::AUTH_DRIVE_METADATA_READONLY
DRIVE = Google::Apis::DriveV3

# Inicializar la API de Google Drive
def initialize_google_drive_api
  servicio = DRIVE::DriveService.new
  servicio.client_options.application_name = APPLICATION_NAME
  servicio.authorization = autorizar
  return servicio
end

# Autorizar la API de Google Drive
def autorizar
  id_cliente = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
  almacen_token = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
  autorizador = Google::Auth::UserAuthorizer.new(id_cliente, SCOPE, almacen_token)
  id_usuario = 'default'
  credenciales = autorizador.get_credentials(id_usuario)
  if credenciales.nil?
    url = autorizador.get_authorization_url(
      base_url: OOB_URI)
    puts "Abra la siguiente URL en el navegador y pegue el " +
           "código resultante después de la autorización:\n" + url
    codigo = gets
    credenciales = autorizador.get_and_store_credentials_from_code(
      user_id: id_usuario, code: codigo, base_url: OOB_URI)
  end
  return credenciales
end

# Verificar la última actualización del archivo

def verificar_ultima_actualizacion(servicio)
  archivo = servicio.get_file('1vp1ngVlvRGyTYxp6W4775feD4k2ShEA8', fields: 'modified_time')
  ultima_actualizacion = archivo.modified_time
  return ultima_actualizacion
end

# Ejecutar el programa

def ejecutar
  servicio = initialize_google_drive_api
  ultima_actualizacion = verificar_ultima_actualizacion(servicio)
  puts ultima_actualizacion

  # Creamos un flujo de eventos que emite la última fecha de modificación del archivo cada hora
  Rx::Observable.interval(60*60) # Emite un evento cada hora
                .map do
    verificar_ultima_actualizacion(servicio)
  end
                .distinct_until_changed # Emite solo si la fecha de modificación ha cambiado
                .subscribe(
                  lambda { |nueva_actualizacion|
                    puts "El archivo ha sido actualizado el #{nueva_actualizacion}"
                    ultima_actualizacion = nueva_actualizacion
                  },
                  lambda { |error| puts "Error: #{error}" },
                  lambda { puts "Completado" }
                )

  # Esperamos a que se presione Enter para detener el programa
  gets

  # Finalizamos el flujo
  puts "Deteniendo el programa"
end

ejecutar