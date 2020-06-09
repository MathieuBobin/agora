City.destroy_all
puts "Les villes ont été détruites"
User.destroy_all
puts "Les utilisateurs ont été détruits"


City.create!(name: "Paris", zip_code: "75000")
City.create!(name: "Lyon", zip_code: "69000")
City.create!(name: "Marseille", zip_code: "13000")
City.create!(name: "Bordeaux", zip_code: "33000")

puts "Les villes ont été créées"

10.times do 
  User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    city: City.first.id,
    email: Faker::Internet.email,
    encrypted_password: "coucou"
  )
end

puts "Les utilisateurs ont été créées"



