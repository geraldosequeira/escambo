namespace :dev do

  desc "Setup Development"
  task setup: :environment do
    images_path = Rails.root.join("public","system")
    puts "Executando o setup para desenvolvimento..."

    puts "#{%x(rake db:drop)}"
    puts "#{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_admins)
    puts %x(rake dev:generate_members)
    puts "Deleting images olds of ADS #{%x(rm -rf #{images_path})}"
    puts "..[OK]"
    puts %x(rake dev:generate_ads)
    puts %x(rake dev:generate_comment)
  end

  desc "Create admins Faker"
  task generate_admins: :environment do
    p "=" * 50
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
    p "=" * 50
    puts "Create Members Fakes..."

    50.times do
      member = Member.new(
        email: Faker::Internet.email,
        password: "teste123",
        password_confirmation: "teste123"
      )

      member.build_profile_member

      member.profile_member.first_name = Faker::Name.first_name
      member.profile_member.second_name = Faker::Name.last_name
      member.save

    end

    puts "..[OK]"
  end

  desc "Create ADS Faker"
  task generate_ads: :environment do
    p "=" * 50

    def markdown_fake
      %x(ruby -e "require 'doctor_ipsum'; puts DoctorIpsum::Markdown.entry ")
    end

    p "Create ADS faker"
    5.times do
      Ad.create!(
          title: Faker::Lorem.sentence(1),
          description_short: Faker::Lorem.sentence([2,3].sample),
          description_md: markdown_fake,
          member: Member.first,
          category: Category.all.sample,
          price: "#{Random.rand(500)},#{99}",
          finish_date: Date.today + Random.rand(30),
          picture: File.new(Rails.root.join('public', 'template', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
        )
    end

      10.times do
        Ad.create!(
          title: Faker::Lorem.sentence(1),
          description_short: Faker::Lorem.sentence([2,3].sample),
          description_md: markdown_fake,
          member: Member.all.sample,
          category: Category.all.sample,
          price: "#{Random.rand(500)},#{99}",
          finish_date: Date.today + Random.rand(10),
          picture: File.new(Rails.root.join('public', 'template', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
        )
      end
    p "..[OK]"
  end

  desc "Create comment Faker"
  task generate_comment: :environment do
    p "=" * 50
    p "Create Comment Faker"

    Ad.all.each do |ad|
      (Random.rand(1..4)).times do
        Comment.create!(
          body: Faker::Lorem.paragraph([2,3,4].sample),
          member: Member.all.sample,
          ad: ad
        )
      end
    end
    p "..[OK]"
  end

end
