   email = Faker::Internet.email

   User.create!(email: email,
                password: "password",
                password_confirmation: "password",
                name: "namae"
                )
