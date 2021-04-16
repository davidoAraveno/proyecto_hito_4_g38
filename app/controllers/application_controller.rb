class ApplicationController < ActionController::Base

    def info(name1, name2, pass)
        mensaje_cliente = Mailgun::Client.new('key-04cfb57c40302fbf30cb96aec59bede3') 

        mensaje_parametros = {
            from: 'bodas@mail.cl',
            to: 'david.aravenap@gmail.com',
            text: "Hola #{name1} y #{name2} ya pueden comenzar a organizar su matrimonio. Entren a www.juanpabloensegundos.cl con su id de novios: #{pass} (este id es secreto. No puede ser divulgado",
            subject: 'Esta todo listo para que comienzes a organizar tu matrimonio'
        }
        mensaje_cliente.send_message('sandbox15447205526e42d8aaeb52ad32ca95f7.mailgun.org', mensaje_parametros)
    end

end
