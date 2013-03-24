# encoding: utf-8
namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
require 'faker'
    Restaurant.delete_all
    (1..250).each do |i| 
    post = Restaurant.create!({ 
    #:cuisine_list => ["American", "Asian", "Fusion", "Italian", "German"].sample,
    :availability_list => ["Freitag", "Samstag", "Dezember"].sample,
    :offer_list => ["241", "50"].sample,
    :phone_number => Faker::PhoneNumber.phone_number,
    :max_party_list => ["2", "4","6","8","10","12"].sample,
    :city => ["Hamburg"],
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