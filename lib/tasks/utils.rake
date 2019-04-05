namespace :utils do

  desc "Add addmins Faker"

  task genereate_admins: :environment do

    p "Saving admins faker"
      10.times do
        Admin.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          password: "teste123",
          password_confirmation: "teste123",
          role: [0,0,1,1,1].sample
        )
      end
    p "..[OK]"

  end

end
