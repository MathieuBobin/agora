Rails.application.eager_load!
ApplicationRecord.descendants.each { |model|
  unless model == User
    model.delete_all
    ActiveRecord::Base.connection.reset_pk_sequence!(model.table_name)
    puts "La table #{model.table_name} est supprimée"
  end
}

City.create!(name: "Paris", zip_code: "75000")
City.create!(name: "Lyon", zip_code: "69000")
City.create!(name: "Marseille", zip_code: "13000")
City.create!(name: "Bordeaux", zip_code: "33000")

puts "Les villes ont été créées"

10.times do 
  User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    city: City.all.sample,
    email: Faker::Internet.email,
    password: "ririri"
  )
end

puts "Les utilisateurs ont été créées"

Category.create!(name: "Ecologie")
Category.create!(name: "Mobilité")
Category.create!(name: "Education")
Category.create!(name: "Santé")
Category.create!(name: "Sport")
Category.create!(name: "Société")

puts "Les catégories ont été créées"

50.times do 
  Proposal.create!(
    title: Faker::Lorem.sentence(word_count: 5), 
    purpose: Faker::Lorem.sentence(word_count: 20),
    description: Faker::Lorem.sentence(word_count: 100),
    is_online: true,
    city: City.all.sample,
    category: Category.all.sample,
    user: User.all.sample
  )
end

puts "Les propositions ont été créées"

40.times do 
  Comment.create!(
    content: Faker::Lorem.characters(number: 100),
    user: User.all.sample,
    proposal: Proposal.all.sample
  )
end

puts "Les commentaires ont été créés"

100.times do 
  Like.create!(
    user: User.all.sample,
    comment: Comment.all.sample
  )
end

puts "Les likes ont été créés"