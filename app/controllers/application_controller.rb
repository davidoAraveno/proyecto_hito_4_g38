class ApplicationController < ActionController::Base

    def info
        mensaje_cliente = Mailgun::Client.new('key-04cfb57c40302fbf30cb96aec59bede3') 
        # no hubo caso lo intente y lo intente y no pude hacer que funcione colocando una variable de entorno

        mensaje_parametros = {
            from: 'bodas@mail.cl',
            to: 'david.aravenap@gmail.com',
            text: 'Haz sido invitado al  matrimonio de......... Entra a www.bodas.cl a seguir las instrucciones'
        }
        mensaje_cliente.send_message('sandbox15447205526e42d8aaeb52ad32ca95f7.mailgun.org', mensaje_parametros)
    end

end
