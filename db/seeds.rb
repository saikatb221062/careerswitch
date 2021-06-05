# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all

User.create!(
  email: "user1@xyz.com",
  password: "secret",
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    budget: [500, 1000, 1500, 2000, 2500, 3000].sample,
    timeframe: [6, 12, 18, 24].sample,
    current_role: "Health-care Worker",
    current_industry: "Health Care",
    future_role: "Product Manager",
    future_industry: "Software Engineering",
    available_hrs_per_week: [12, 24, 36, 40, 60].sample,
    status: '');

User.create!(
  email: "user2@xyz.com",
  password: "secret",
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    budget: [500, 1000, 1500, 2000, 2500, 3000].sample,
    timeframe: [6, 12, 18, 24].sample,
    current_role: "Wealth Planner",
    current_industry: "Banking",
    future_role: "Web Developer",
    future_industry: "Software Engineering",
    available_hrs_per_week: [12, 24, 36, 40, 60].sample,
    status: '');

User.create!(
  email: "user3@xyz.com",
  password: "secret",
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    budget: [500, 1000, 1500, 2000, 2500, 3000].sample,
    timeframe: [6, 12, 18, 24].sample,
    current_role: "Insurance Agent",
    current_industry: "Insurance",
    future_role: "Web Developer",
    future_industry: "Software Engineering",
    available_hrs_per_week: [12, 24, 36, 40, 60].sample,
    status: '');
    
User.create!(
  email: "user4@xyz.com",
  password: "secret",
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    budget: [500, 1000, 1500, 2000, 2500, 3000].sample,
    timeframe: [6, 12, 18, 24].sample,
    current_role: "Stock Broker",
    current_industry: "Equity",
    future_role: "Web Developer",
    future_industry: "Software Engineering",
    available_hrs_per_week: [12, 24, 36, 40, 60].sample,
    status: '');