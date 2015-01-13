# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'csv'

puts "Importing cities..."
CSV.foreach(Rails.root.join("city.csv"), headers: true) do |row|
  City.create! do |city|
    city.name = row[0]
    city.state_id = row[1]
  end
end

puts "Importing countries..."
CSV.foreach(Rails.root.join("countries.csv"), headers: true) do |row|
  Country.create! do |country|
    country.name = row[0]
  end
end
puts "Importing states..."
CSV.foreach(Rails.root.join("states.csv"), headers: true) do |row|
  State.create! do |state|
    state.name = row[0]
    state.country_id = row[1]
  end
end


