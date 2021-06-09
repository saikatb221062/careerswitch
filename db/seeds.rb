require 'faker'

def printStats
  print `clear`
  puts "End of Seed Run - count of table rows:"
  puts ''
  puts "Users       : #{User.all.count}"
  puts "Connections : #{Connection.all.count}"
  puts "Messages    : #{Message.all.count}"
end

def seedUsers
  print `clear`
  puts "Proceeding to seed 30 users ...."

  Message.destroy_all
  Connection.destroy_all
  User.destroy_all

  current_role = [
    'Supervisor', 
    'Admin Manager', 
    'Contractor', 
    'Consultant', 
    'Advisor', 
    'Salesperson'] 

  current_ind =  [
      'Accounting', 
      'Finance', 
      'Health Care', 
      'Banking', 
      'Education']

  future_ind = [
    'Fullstack Engineering', 
    'Frontend Developer', 
    'Backend Developer', 
    'Data Analyst']

  @satisfaction = [ 
    "Great", 
    "Fabulous", 
    "Super", 
    "Could be better", 
    "Nice !"]

  @src1 = 'https://images.pexels.com/photos/'
  @src2 = ''
  @src3 = '/pexels-photo-'
  @src5 = '.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=750&h=1260'

  men_faces = [ 749091, 977374, 1267335, 1546912, 2269872, 2341350, 2531553, 211476,   3370021, 3406022, 3754833, 4052800, 4061512, 6102841, 7431273 ]

  women_faces = [ 1520760, 1644924, 1691294, 1845993, 3021554, 3021563, 3394658,  936894, 4258184, 5025111, 5649997, 6682475, 7073078, 7717254, 8219320 ]

  i = 1
  j = 0
  k = 0

  30.times do
    puts "Creating User #{i} of 30"
    if i.odd?
      @name1 = Faker::Name.female_first_name
      @img_url = "#{@src1}#{women_faces[k]}#{@src3}#{women_faces[k]}#{@src5}"
      k += 1
    else
      @name1 = Faker::Name.male_first_name
      @img_url = "#{@src1}#{men_faces[j]}#{@src3}#{men_faces[j]}#{@src5}"
      j += 1
    end

    @future_ind = future_ind.sample

    User.create!(
      first_name: @name1,
      email: "#{@name1}@#{Faker::Internet.domain_name}",
      password: "secret",
      last_name: Faker::Name.last_name,
      budget: [500, 1000, 1500, 2000, 2500, 3000].sample,
      timeframe: [6, 12, 18, 24].sample,
      current_role: current_role.sample,
      current_industry: current_ind.sample,
      future_industry: @future_ind,
      future_role: @future_ind,
      available_hrs_per_week: [12, 24, 36, 40, 60].sample,
      status: '',
      img_url: @img_url,
      advice: Faker::Quote.yoda,
      location: Faker::Address.city,
      motivation: Faker::Quote.matz,
      journey_experience: Faker::Lorem.paragraph_by_chars(number: 512, supplemental:  false),
      satisfaction: @satisfaction.sample
      )

    i += 1
  end
end

def seedConnections
  print `clear`
  puts "Proceeding to seed 100 connections ...."

  Message.destroy_all
  Connection.destroy_all

  # Get All the Users
  users = User.all
  
  i = 0
  j = 19

  # We will create connections data for the first 5 users that have been created
  # We will connect each of those users to last  20 to 29 
  
  until i > 4 do
    puts "Seeding Connections for #{i+1} of 5 Users"
    j = 19
    until j > 29 do
      puts "User ##{i+1} with UsedId=#{users[i].id} <--- connected to ---> User ##{j+1} with UserId #{users[j].id}"
      Connection.create!(
        connecting_id: users[i].id,
        connected_id: users[j].id,
        user_id: users[i].id
      )
      j += 1
    end
    i += 1
  end
end

def seedMessages
  print `clear`
  puts "Proceeding to seed 100 messages ...."
  Message.destroy_all
  i = 1

  connections = Connection.all
  
  pick_any = 0
  
  100.times do 
    puts "Seeding Messages #{i} of 100"
    if pick_any > 10
      pick_any = 0
    end

    rand = [0..6].sample
    if rand = 0
      @content = Faker::Quote.yoda
    elsif rand = 1
      @content = Faker::Quote.famous_last_words
    elsif rand = 2
      @content = Faker::Quote.jack_handey
    elsif rand = 3
      @content = Faker::Quote.matz
    elsif rand = 4
      @content = Faker::Quote.most_interesting_man_in_the_world
    elsif rand = 5
      @content = Faker::Quotes::Shakespeare.romeo_and_juliet_quote
    else
      @content = Faker::Quotes::Shakespeare.as_you_like_it_quote
    end

    Message.create!(
      content: @content,
      reaction: Faker::Quotes::Shakespeare.hamlet_quote ,
      connection_id: connections[pick_any].id,
      user_id: connections[pick_any].connecting_id,
    )
    i += 1
    pick_any += 1
  end
end

print `clear`
puts '*********************************'
puts '  Welcome to ConnectDots Seeding '
puts '*********************************'
puts ''
puts ''
puts '1 - Seed Users'
puts ''
puts '2 - Seed Connections'
puts ''
puts '3 - Seed Messages'
puts ''
puts '9 - Seed All tables'
puts ''
puts 'Press any other key to Exit'
puts ''
puts "Note:"
puts "- seeding Users will cleardown Messages and Connections as dependent objects"
puts "- seeding Connections will cleardown Messages as dependent objects"
puts ''
puts "If in doubt, select 9 and seed everything !"
puts ''
print '>'
input = STDIN.gets.chomp().to_i

if input == 1
  seedUsers
elsif input == 2
  seedConnections
elsif input == 3
  seedMessages
elsif input == 9
  seedUsers
  seedConnections
  seedMessages
else
  puts "Nothing to do? GoodBye !"
end

printStats
