require 'faker'

Dog.destroy_all
Dogsitter.destroy_all
City.destroy_all
Stroll.destroy_all

15.times do
  City.create(city_name: Faker::Address.city)
end

100.times do
  Dog.create(dog_name: Faker::Creature::Dog.name, city: City.all.sample)
  Dogsitter.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: Faker::Number.within(range: 18..60), city: City.all.sample)
end

50.times do
  dog = Dog.all.sample
  dogsitter = Dogsitter.all.sample
  until dog.city == dogsitter.city 
    dogsitter = Dogsitter.all.sample
  end
  Stroll.create(date: Faker::Date.between(from: 1.year.ago, to: Date.today), dog: dog, dogsitter: dogsitter )
end