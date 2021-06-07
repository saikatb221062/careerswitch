# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all

male_images = [ 
  "https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", 
  "https://images.pexels.com/photos/2474661/pexels-photo-2474661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", 
  "https://images.pexels.com/photos/2087748/pexels-photo-2087748.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", 
  "https://images.pexels.com/photos/4194390/pexels-photo-4194390.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", 
  "https://images.pexels.com/photos/1437267/pexels-photo-1437267.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", 
  "https://images.pexels.com/photos/884600/pexels-photo-884600.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", 
  "https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260" 
]

female_images = [ 
  "https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", 
  "https://images.pexels.com/photos/2474661/pexels-photo-2474661.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", 
  "https://images.pexels.com/photos/2087748/pexels-photo-2087748.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", 
  "https://images.pexels.com/photos/4194390/pexels-photo-4194390.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", 
  "https://images.pexels.com/photos/1437267/pexels-photo-1437267.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", 
  "https://images.pexels.com/photos/884600/pexels-photo-884600.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260", 
  "https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260" 
]




current_role = ['Supervisor', 'Admin Manager', 'Contractor', 'Consultant', 'Advisor', 'Salesperson'] 
current_ind =  ['Accounting', 'Finance', 'Health Care', 'Banking', 'Education']

future_ind = ['Fullstack Engineering', 'Frontend Developer', 'Backend Developer', 'Data Analyst']

i = 1
30.times do
  if i.odd?
    @name1 = Faker::Name.female_first_name
  else 
    @name1 = Faker::Name.male_first_name
  end
  i += 1
  User.create!(
    first_name: @name1,
    email: "#{@name1}@#{Faker::Internet.domain_name}",
    password: "secret",
    last_name: Faker::Name.last_name,
    budget: [500, 1000, 1500, 2000, 2500, 3000].sample,
    timeframe: [6, 12, 18, 24].sample,
    current_role: current_role.sample,
    current_industry: current_ind.sample,
    future_industry: future_ind.sample,
    future_role: "",
    available_hrs_per_week: [12, 24, 36, 40, 60].sample,
    status: '')
end

@users = User.all
@users.each do |user|
  user.future_role = user.future_industry
  user.save
end

# User.create!(
#   email: "user2@xyz.com",
#   password: "secret",
#     first_name: Faker::Name.male_first_name,
#     last_name: Faker::Name.last_name,
#     budget: [500, 1000, 1500, 2000, 2500, 3000].sample,
#     timeframe: [6, 12, 18, 24].sample,
#     current_role: "Wealth Planner",
#     current_industry: "Banking",
#     future_role: "Web Developer",
#     future_industry: "Software Engineering",
#     available_hrs_per_week: [12, 24, 36, 40, 60].sample,
#     status: '');
# 
# User.create!(
#   email: "user3@xyz.com",
#   password: "secret",
#     first_name: Faker::Name.female_first_name,
#     last_name: Faker::Name.last_name,
#     budget: [500, 1000, 1500, 2000, 2500, 3000].sample,
#     timeframe: [6, 12, 18, 24].sample,
#     current_role: "Insurance Agent",
#     current_industry: "Insurance",
#     future_role: "Web Developer",
#     future_industry: "Software Engineering",
#     available_hrs_per_week: [12, 24, 36, 40, 60].sample,
#     status: '');
#     
# User.create!(
#   email: "user4@xyz.com",
#   password: "secret",
#     first_name: Faker::Name.male_first_name,
#     last_name: Faker::Name.last_name,
#     budget: [500, 1000, 1500, 2000, 2500, 3000].sample,
#     timeframe: [6, 12, 18, 24].sample,
#     current_role: "Stock Broker",
#     current_industry: "Equity",
#     future_role: "Web Developer",
#     future_industry: "Software Engineering",
#     available_hrs_per_week: [12, 24, 36, 40, 60].sample,
#     status: '');
# 