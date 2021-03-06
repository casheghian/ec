# encoding: utf-8
namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
require 'faker'
    Restaurant.delete_all
    (1..250).each do |i| 
    post = Restaurant.create!({ 
    :cuisine_ids => ["1","2","3","4","5","6","7"].sample,
    :availability => ["Freitag", "Samstag", "Dezember"].sample,
    :offer => [241,50].sample,
    :phone_number => Faker::PhoneNumber.phone_number,
    :max_party => [2,4,6,8,10,12,99].sample,
    :city => "Hamburg",
    :keywords =>["Pizza", "Pasta", "Italian", "Sushi"].sample,
    :district => ["Altona", "Barmbek", "Eimsbüttel"].sample,
    :name => Faker::Company.name,
    :content => Faker::Lorem.paragraph,
    :sub_content => Faker::Lorem.paragraph,
    :longitude => Faker::Address.longitude,
    :latitude => Faker::Address.latitude
     
     }) 


    end 
  end
end