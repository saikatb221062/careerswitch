require 'faker'

def printStats
  print `clear`
  puts "End of Seed Run - count of table rows:"
  puts ''
  puts "Users       : #{User.all.count}"
  puts "Connections : #{Connection.all.count}"
  puts "Messages    : #{Message.all.count}"
  puts "Topics      : #{Topic.all.count}"
  puts "Courses     : #{Course.all.count}"
  puts "Roadmaps    : #{Roadmap.all.count}"
  puts "Courses-Roadmaps Join Table : #{CourseRoadmap.all.count}"
end

def seedTopics
  print `clear`
  puts "Proceeding to seed 7 Topics ...."

  idx = 0
  topics_list = [ 'Master Plan', 'Bootcamps', 'HTML', 'JavaScript', 'CSS', 'Git/Github', 'Databases' ]

  Topic.destroy_all
  
  7.times do
    puts "Creating Topic #{idx} - #{topics_list[idx]}"
    Topic.create!(name: topics_list[idx])
    idx += 1
  end  
end

def seedCourses
  print `clear`
  puts "Proceeding to seed 24 Courses ...."

  providers = [ 'Brent Global', 'Vdemy', 'Fulltack Academy', 'SpillsFuture', 'JellyFish', 'JollyRoger', 'QueSeraSera', 'Jack Sparrow School' ]

  titles = [
    'Web Development Flexible Part Time', 
    'Web Development Immersive Full Time', 
    'Software Development BootCamp', 
    'Full Stack Web Dev Bootcamp 2021', 
    'Live Online Coding Bootcamp', 
    'HTML & CSS Online Course', 
    'Create / Design Website In One Day', 
    'HTML & CSS', 
    'HTML & CSS Basics', 
    'Javascript Online', 
    'Javascript Basics', 
    'Javascript Fundamentals', 
    'Master Javascript in 7 Weeks', 
    'HTML & CSS Online!', 
    'Create / Design Website In One Day',
    'HTML & CSS - Kaboom!', 
    'HTML & CSS Fundamentals', 
    'Git/Github Basics', 
    'Git/Github Fundamentals', 
    'Git/Github in a Week', 
    'Git/Github Immersive',
    'SQLite3', 
    'PostgreSQL',
    'MongoDB Atlas', 'mySQL with innoDB and NDB'
  ]

  course_fees = [ 300, 1500, 1750, 2000, 2500, 5000 ]
  durations = [ 2, 4, 6, 18, 36, 48, 52 ]
  hours_per_week_values = [ 10, 15, 20, 25, 40 ]
  topics_in_table = Topic.all

  topic_row = [ 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6 ]

  idx = 0
  Course.destroy_all

  24.times do
    if idx == 0
      provider = "Le Wagon SEA"
      title = "Web Development Flexible Part Time"
      course_url = "https://www.lewagon.com/singapore"
      course_fee = 10000
      course_duration = 26
      hours_per_week = 12
    elsif idx == 1
      provider = "Le Wagon SEA"
      title = "Web Development Immersive Full Time"
      course_url = "https://www.lewagon.com/singapore"
      course_fee = 10000
      course_duration = 9
      hours_per_week = 40
    else
      provider = providers.sample
      title = titles[idx]
      course_fee = course_fees.sample
      course_duration = durations.sample
      hours_per_week = hours_per_week_values.sample
      course_url = Faker::Internet.url
    end
   
    topic_id_to_get = topic_row[idx]
    topic_id = topics_in_table[topic_id_to_get].id

    Course.create!(
      provider: provider,
      title: title,
      cost: course_fee,
      duration: course_duration,
      provider_url: course_url,
      hourse_per_week: hours_per_week,
      topic_id: topic_id
    )
    idx += 1
  end
end 

def seedRoadmaps
  print `clear`
  puts "Proceeding to seed 8 Roadmaps...."

  Roadmap.destroy_all

  start_dates = [ '15-Feb-19', '11-Mar-20', '5-Apr-20', '21-May-20', '1-Jun-20', '31-Jul-20', '14-Aug-20', '9-Sep-20' ]
  end_dates = [ '16-May-19', '19-Jun-20', '4-Jul-20', '17-Nov-20', '27-May-21', '29-Oct-20', '10-Feb-21', '4-Sep-21' ]

  idx = 0

  users = User.all

  8.times do
    d1 = Date.parse start_dates[idx]
    d2 = Date.parse end_dates[idx]
    Roadmap.create!(
      privacy_option: false,
      start_date: d1,
      end_date: d2,
      user_id: users[idx].id
    )
    idx += 1
  end
end

def seedCoursesRoadmapsJoinTable
  print `clear`
  puts "Proceeding to seed 16 combinations of Roadmaps and Courses ..."

  CourseRoadmap.destroy_all

  which_roadmap = [ 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3 ]
  which_course = [ 1, 6, 10, 13, 18, 22, 23, 2, 7, 12, 13, 18, 3, 19, 20, 23 ]
  
  statuses = [ "Completed", "In progress", "Yet to Start" ]

  courses = Course.all
  roadmaps = Roadmap.all

  idx = 0

  16.times do
    r_id = which_roadmap[idx]
    roadmap_id = roadmaps[r_id].id
    
    c_id = which_course[idx]
    course_id = courses[c_id].id
    
    CourseRoadmap.create!(
      status: statuses.sample,
      course_id: course_id,
      roadmap_id: roadmap_id
    )
    idx += 1
  end
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
puts '1 - Users'
puts '2 - Connections'
puts '3 - Messages'
puts '4 - Topics'
puts '5 - Courses'
puts '6 - Roadmaps'
puts '7 - Courses-Roadmaps Join Table'
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
elsif input == 4
  seedTopics
elsif input == 5
  seedCourses
elsif input == 6
  seedRoadmaps
elsif input == 7
  seedCoursesRoadmapsJoinTable
elsif input == 9
  seedUsers
  seedConnections
  seedMessages
  seedTopics
  seedCourses
  seedRoadmaps
  seedCoursesRoadmapsJoinTable
else
  puts "Nothing to do? GoodBye !"
end

printStats
