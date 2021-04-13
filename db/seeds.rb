# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Star.destroy_all
MarriageInvited.destroy_all
Celebration.destroy_all
Ceremony.destroy_all
TemplateInvitation.destroy_all
Marriage.destroy_all
Invited.destroy_all
Admin.destroy_all


Marriage.create(
    [
        {
            name1: 'personaje1',
            name2: 'personaje2',
            phone_name1: "12345",
            phone_name2: "54321",
            email_name1: "personaje1@mail.com",
            email_name2: "personaje2@mail.com",
            link_gift: "https://club.noviosparis.cl/home/couple-catalog/18156652",
            code_gift: "73403492",
            enterprise_gift: "paris",
            password_digest: "humanos"
        },
        {
            name1: 'perro',
            name2: 'perrra',
            phone_name1: "1111",
            phone_name2: "2222",
            email_name1: "perro@mail.com",
            email_name2: "perra@mail.com",
            link_gift: "https://club.noviosparis.cl/home/couple-catalog/18156652",
            code_gift: "7456",
            enterprise_gift: "paris",
            password_digest: "perros"
        }
    ]
)

Marriage.all.each do |m|
    Invited.all.each do |i|
        MarriageInvited.create(
            [
                {
                    marriage_id: m.id,
                    invited_id: i.id,
                    message_invited: "me siento feliz por ustedes y su matrimonio"
                }
            ]
        )
    end
end

Marriage.all.each do |i|
    Celebration.create(
        [
            {
                address: "calle falsa sin numero",
                hour: "19:00",
                date: "2021/5/21",
                marriage_id: i.id,
            }
        ]
    )
    Ceremony.create(
        [
            {
                address: "calle chica sin numero",
                hour: "18:00",
                date: "2021/5/21",
                marriage_id: i.id
            }
        ]
    )
end

TemplateInvitation.create(
    [
        {
            image: "https://marketplace.canva.com/EADicj9jELQ/1/0/400w/canva-invitaci%C3%B3n-boda-de-invierno-color-morado-con-guirnalda-OAxj11LSTDk.png",
            message_personalized: "estamos muy felices de invitarte a nuestro matrimonio"
        }
    ]
)

Tutorial.create(
    [
        {
            name: "video de prueba 1",
            url: "https://www.youtube.com/watch?v=tydW2UuEeWY"
        },
        {
            name: "video de prueba 2",
            url: "https://www.youtube.com/watch?v=z3kceCmSivs"
        }
    ]
)

Admin.create(
    [
        {
            name: 'david',
            password_digest: 'david'
        }
    ]
)

PaymentMethod.create(name: 'PayPal Express Checkout', code: 'PEC')