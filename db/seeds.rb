# frozen_string_literal: true

Province.destroy_all
Orderproduct.destroy_all
Product.destroy_all
Order.destroy_all
Category.destroy_all
User.destroy_all

province_array = ['Alberta', 'British Columbia', 'Manitoba', 'New Brunswick',
                  'Newfoundland', 'Northwest Territories', 'Nova Scotia',
                  'Nunavut', 'Ontario', 'Prince Edward Lsland', 'Quebec', 'Saskatchewan', 'Yukon']

province_array.each do |province|
  Province.create(province: province)
end

category_array = ['Toilet Paper', 'Hand Sanitizer', 'Masks', 'Paper Towel',
                  'Gloves', 'Disenfectants']
status_array = ['sale', 'new', 'recently added', 'regular']

category_array.each do |category|
  my_category = Category.create(name: category,
                                description: Faker::Science.element)

  20.times do
    Product.create(category: my_category,
                   name: Faker::Construction.material,
                   description: Faker::Music.album,
                   cost_cents: rand(500..20_000),
                   product_status: status_array[rand(0..3)])
  end
end

10.times do
  User.create!(
    province: Province.order('RANDOM()').first,
    name: Faker::FunnyName.unique.name,
    email: Faker::Internet.unique.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    password: 'password',
    address: Faker::Address.street_address
  )
end

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end

puts "Created #{Province.count} products."
puts "Created #{Category.count} categories."
puts "Created #{Product.count} products."
puts "Created #{User.count} users."
