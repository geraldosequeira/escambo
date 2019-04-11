namespace :utils do

  desc "Create admins Faker"
  task generate_admins: :environment do
    p "Create admins faker"
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

  desc "Create Members Fake"
  task generate_members: :environment do
    puts "Create Memebers Fakes..."

    50.times do
      Member.create!(
        email: Faker::Internet.email,
        password: "teste123",
        password_confirmation: "teste123"
      )
    end

    puts "..[OK]"
  end

  desc "Create ADS Faker"
  task generate_ads: :environment do
    p "Create ADS faker"
      10.times do
        Ad.create!(
          title: Faker::Lorem.sentence(1),
          description: LeroleroGenerator.paragraph([2,3].sample),
          member: Member.all.sample,
          category: Category.all.sample,
          price: "#{Random.rand(500)},#{99}",
          picture: File.new(Rails.root.join('public', 'template', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
        )
      end
    p "..[OK]"
  end

end
