namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
require 'faker'

    (1..250).each do |i| 

    post = Restaurant.create!({ 
    :cuisine_list => ["American", "Asian", "Fusion", "Italian", "German"].sample,
    :offer_list => ["241", "50"].sample,
    :name => Faker::Company.name,
    :content => Faker::Lorem.paragraph,
    :sub_content => Faker::Lorem.paragraph,
    :longitude => Faker::Address.longitude,
    :latitude => Faker::Address.latitude,
     
     }) 




    end 
  end
end