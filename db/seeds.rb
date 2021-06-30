require 'faker'

def printStats
  print `clear`
  puts '*********************************'
  puts ' End of Seed Run - Statistics:   '
  puts '*********************************'
  puts ''
  puts "Users       : #{User.all.count}"
  puts "Connections : #{Connection.all.count}"
  # puts "Messages    : #{Message.all.count}"
  puts "Topics      : #{Topic.all.count}"
  puts "Courses     : #{Course.all.count}"
  puts "Roadmaps    : #{Roadmap.all.count}"
  puts "Courses-Roadmaps Join Table : #{CourseRoadmap.all.count}"
end

def seedUsers14
  Message.destroy_all
  Connection.destroy_all
  User.destroy_all
  @first_names_14 = [
    'Prima', 
    'Grace', 
    'Ann', 
    'Minyoung', 
    'Nicole', 
    'Chris', 
    'Shawn', 
    'Chia Wei', 
    'Shin', 
    'Anushka', 
    'Arica', 
    'Caroline', 
    'Chris', 
    'John'
  ]
  @last_names_14 = [
    'Aulia Gusta', 
    'Teng', 
    'Koh', 
    'Chang', 
    'Leow', 
    'De Lima', 
    'Low', 
    'Ng', 
    'Yeonsu', 
    'Singh', 
    'Ng', 
    'Tan', 
    'Goodwin', 
    'Kang' 
  ]
  @user_emails_14 = [ 
    'prima@xyz.com', 
    'grace@xyz.com', 
    'ann@xyz.com', 
    'minyoungchang65@gmail.com', 
    'leowminzi@gmail.com', 
    'chris@bootcamp.sg', 
    'shawn@xyz.com', 
    'chiawei@xyz.com', 
    'yeonsu@xyz.com', 
    'anushka@xyz.com', 
    'arica@xyz.com', 
    'caroline@xyz.com', 
    'chris2@xyz.com', 
    'johnkang@xyz.com' 
  ]
  @img_urls_14 = [ 
    'https://ca.slack-edge.com/T02NE0241-UDX9DJL9J-a03bb27b9b0a-512', 
    'https://ca.slack-edge.com/T02NE0241-U0180T70ULC-03d5f2010e9e-512', 
    'https://ca.slack-edge.com/T02NE0241-UTH63RQNB-da38e86aa637-512', 
    'https://ca.slack-edge.com/T02NE0241-U01JQJAF7S6-46eb625dbda2-512', 
    'https://ca.slack-edge.com/T02NE0241-U01K3EYTT6Y-bc20a7c16358-512', 
    'https://ca.slack-edge.com/T02NE0241-U01J21DET2T-5c4a15d1564a-512', 
    'https://ca.slack-edge.com/T02NE0241-U01JNSWH3FW-bdb2fef1f775-512', 
    'https://ca.slack-edge.com/T02NE0241-U01J9SK9ZFG-7d213f06589b-512', 
    'https://ca.slack-edge.com/T02NE0241-U01JH2SLCKV-fdde5042e826-512', 
    'https://ca.slack-edge.com/T02NE0241-U01SK0PNJ3W-0212440dc400-512', 
    'https://ca.slack-edge.com/T02NE0241-U01RYCE2AJ3-cdd43dea75b3-512', 
    'https://ca.slack-edge.com/T02NE0241-U01J463UDB5-e7484e75458f-512', 
    'https://ca.slack-edge.com/T02NE0241-UL2RBUW9Z-a8521e5815ce-512', 
    'https://ca.slack-edge.com/T02NE0241-U01313CRC22-992b223c80aa-512' 
  ]
  @current_roles_14 = [
    'Product Manager',
    'Project Manager',
    'Business Analyst',
    'Risk Manager',
    'Recruiter',
    'Self-employed',
    'Freelancer',
    'Product Manager',
    'Project Manager',
    'Business Analyst',
    'Risk Manager',
    'Recruiter',
    'Accountant',
    'Business Dev Manager',
    'Customer Support Specialist',
    'Operation Manager',
    'Supply Chain Manager',
    'Researcher',
    'Instructor',
    'Consultant',
  ]
  @current_industries_14 = [
    'Consulting', 
    'Consulting', 
    'Consulting', 
    'Hospitality', 
    'IT/Tech', 
    'IT/Tech', 
    'IT/Tech', 
    'IT/Tech', 
    'IT/Tech', 
    'IT/Tech', 
    'Retail', 
    'Pharmaceuticals', 
    'Public Services/Govt', 
    'Retail', 
  ]
  @future_roles_14 = [
    'Web Developer', 
    'Product Manager', 
    'Fullstack Engineer', 
    'Frontend Developer', 
    'Backend Developer', 
    'Web Developer', 
    'Product Manager', 
    'Fullstack Engineer', 
    'Frontend Developer', 
    'Backend Developer', 
    'Web Developer', 
    'Product Manager', 
    'Fullstack Engineer', 
    'Frontend Developer'
  ]
  @current_roles_all = [
    'Marketeer', 
    'Designer', 
    'Product Manager', 
    'Copywriter', 
    'Account Manager', 
    'Project Manager', 
    'Business Analyst', 
    'Risk Manager', 
    'Recruiter', 
    'Accountant', 
    'Business Dev Manager', 
    'Customer Support Specialist', 
    'Operation Manager', 
    'Supply Chain Manager', 
    'Researcher', 
    'Instructor', 
    'Consultant', 
    'Self-employed', 
    'Freelancer' 
  ] 
  @current_industries_all =  [
    'Consulting',
    'Art/Design',
    'IT/Tech',
    'Agriculture',
    'Hospitality',
    'Law',
    'Leisure/Tourism',
    'Marketing/Advertising',
    'Media/Entertainment',
    'Public Services/Govt',
    'Retail',
    'Pharmaceuticals',
    'Self-employed',
    'Freelance'
  ]
  @future_roles_all = [
    'Web Developer',
    'Product Manager',
    'Fullstack Engineer',
    'Frontend Developer',
    'Backend Developer'
  ]
  @satisfactions = [ 
    "Great", 
    "Fabulous", 
    "Super", 
    "Wonderful", 
    "Excellent"]

  @src1 = 'https://images.pexels.com/photos/'
  @src2 = ''
  @src3 = '/pexels-photo-'
  @src5 = '.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=750&h=1260'
  @men_faces = [ 
    749091, 
    977374, 
    1267335, 
    1546912, 
    2269872, 
    2341350, 
    2531553, 
    3211476, 
    3370021, 
    3406022, 
    3754833, 
    4052800, 
    4061512, 
    6102841, 
    7431273 ]

  @women_faces = [ 
    1520760, 
    1644924, 
    1691294, 
    1845993, 
    3021554, 
    3021563, 
    3394658, 
    3936894, 
    4258184, 
    5025111, 
    5649997, 
    6682475, 
    7073078, 
    7717254, 
    8219320 ]

  @locations = [ 
    'Singapore',
    'Hong Kong',
    'Beijing',
    'Jakarta',
    'Melbourne',
    'New York',
    'Paris',
    'London',
    'Dubai',
    'New Delhi',
    'Seoul'
  ]
  @motivations = [ 
    'I often felt like I went into work every day to perform a role that was written for someone else. I always wanted to be both creative and building solutions, but somehow I had ended up following a different path.',
    'On paper I was successful and I should have been happy. Instead I felt hollow. I started to question what I was doing. All I had done for so long was work. My personal life was a mess; my dog was literally the only thing that brought me joy. I wanted to make a difference. But all I was doing was supporting consumerism and making rich companies richer.',
    'I was sitting in traffic and thought to myself "What am I doing? Why am I sitting in traffic? Why am I wasting my time? Is money the only reason I am doing this?" In answering those questions, I knew it was time to make a change.',
    'In my 9-5, I was unrecognisable compared to the person I am today. I felt exhausted and extremely unappreciated. Due to the stress of my job, I was losing sleep, waking up with anxiety, and skipping lunch most days. It was a very unhealthy environment for me. Anxiety was not something I had ever encountered before!', 
    'I could not picture myself spending the next 30 to 40 years in an office job. There is nothing wrong with it, and I know so many people do it, but I just felt it was not the best fit for me.' 
  ]
  @journeys = [ 
    "I think that sometimes in the beginning, I played it a bit too safe. I should probably have scaled up quicker than I did (I lost out on commissions, etc. because I couldn't deliver my work quickly enough). Another challenge for me has been to balance making a living with keeping my pursuit affordable. It is also sometimes a challenge to both have a day-job, and have time to still be chasing your dreams!",
    "The most difficult thing about changing? Changing my mindset and letting go of the way I'd always done things. I'm the kind of person who's always looking six steps ahead. So I didn't like it when I couldn't see where the process was heading.  When I finally managed to stop worrying about finding the answer and just religiously went through all of the steps I started to get breakthroughs. I realised it wasn't about being on one path. I can be on three! Having a tech career driven by my passions wasn't something that I'd really considered or even knew existed before.",
    "I told my boss that I needed to follow my passion. They understood entirely. I wrapped up the projects I was working on and then left. I knew that I needed to commit 100% effort to making my new career work, or else it never would. I began looking for how to build my skills and started trying every which way to practise and showcase what I learnt.",
    "As a rookie, it was difficult learning how to get comfortable with totally new concepts and tools, understanding them and applying them. I'm not naturally a analytical person. So dealing with logic in systematic steps was intimidating at the start. But, it's definitely gotten easier with practice. You just have to push through the discomfort until it becomes normal.",
    "I looked for courses that didn't require a lot of money, and also leaned into my network of friends in Tech. I was still working at my job when I started my journey and didn't quit until I had saved enough to support me financially (at least somewhat). This took about a year. Gave up on holidays, normal social life, and a lot of niceties !"
  ]
  @advices = [ 
    "I've learned that it's okay to feel fear. I was scared when I quit my job. The trick has been not to let it paralyse me. I've had to stop caring so much about what the world thinks or whether I might fail. So what if I fail? If you haven't failed or taken some chances, you haven't lived your life. You've just kept standing on those escalators, letting life happen to you.", 
    "Take the first step. You don't have to run. You don't need to know where you're going. Take it one step at a time.", 
    "Listen to your gut!", 
    "I would advise others to not compromise their happiness in exchange for a salary. There are so many opportunities out there waiting for you! Start planning your exit (check your finances, learn new skills, build your website, feed your brain with knowledge). But make sure it's something worthwhile. Also, don't wait to be perfect. You'll never know it all. The best way to learn is by simply saying 'yes' and getting stuck in.", 
    "Take baby steps. Don't leave your regular job too quickly, and be willing to work very hard to build up your skills, whether that's in your lunch break, evenings, or even weekends. Don't sweat the small things, and figure it out along the way. What you think is the problem now, often turns out not to be the actual problem a few months down the line."
  ]
  
  # Creating Users for Le Wagon Singapore team
  print `clear`
  puts "🏆🏆 Now Creating Users and Connections for the Le Wagon Delta Force team !🏆🏆"
  i = 0 
  14.times do
    puts "Creating User #{i + 1} #{@first_names_14[i]} #{@last_names_14[i]} "
    User.create!(
      first_name: @first_names_14[i],
      email: @user_emails_14[i],
      password: "123456",
      last_name: @last_names_14[i],
      budget: [500, 1000, 1500, 2000, 2500, 3000].sample,
      timeframe: [6, 6, 12, 24].sample,
      current_role: @current_roles_14[i],
      current_industry: @current_industries_14[i],
      future_industry: 'IT/Tech',
      future_role: @future_roles_14[i],
      available_hrs_per_week: [12, 24, 36, 40, 60].sample,
      status: ['Online', 'Offline'].sample,
      img_url: @img_urls_14[i],
      advice: @advices.sample,
      location: 'Singapore',
      motivation: @motivations.sample,
      journey_experience: @journeys.sample,
      satisfaction: @satisfactions.sample
    )
    i += 1
  end
end

def seedUsers67
  @current_roles_all = [
    'Marketeer', 
    'Designer', 
    'Product Manager', 
    'Copywriter', 
    'Account Manager', 
    'Project Manager', 
    'Business Analyst', 
    'Risk Manager', 
    'Recruiter', 
    'Accountant', 
    'Business Dev Manager', 
    'Customer Support Specialist', 
    'Operation Manager', 
    'Supply Chain Manager', 
    'Researcher', 
    'Instructor', 
    'Consultant', 
    'Self-employed', 
    'Freelancer' 
  ] 
  @current_industries_all =  [
    'Consulting',
    'Art/Design',
    'IT/Tech',
    'Agriculture',
    'Hospitality',
    'Law',
    'Leisure/Tourism',
    'Marketing/Advertising',
    'Media/Entertainment',
    'Public Services/Govt',
    'Retail',
    'Pharmaceuticals',
    'Self-employed',
    'Freelance'
  ]
  @future_roles_all = [
    'Web Developer',
    'Product Manager',
    'Fullstack Engineer',
    'Frontend Developer',
    'Backend Developer',
  ]
  @satisfactions = [ 
    "Great", 
    "Fabulous", 
    "Super", 
    "Wonderful", 
    "Excellent"]

  @src1 = 'https://images.pexels.com/photos/'
  @src2 = ''
  @src3 = '/pexels-photo-'
  @src5 = '.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=750&h=1260'
  @men_faces = [ 
    749091, 
    977374, 
    1267335, 
    1546912, 
    2269872, 
    2341350, 
    2531553, 
    3211476, 
    3370021, 
    3406022, 
    3754833, 
    4052800, 
    4061512, 
    6102841, 
    7431273,
    749091, 
    977374, 
    1267335, 
    1546912, 
    2269872, 
    2341350, 
    2531553, 
    3211476, 
    3370021, 
    3406022, 
    3754833, 
    4052800, 
    4061512, 
    6102841, 
    7431273,
    749091, 
    977374, 
    1267335, 
    1546912, 
    2269872, 
    2341350, 
    2531553, 
    3211476, 
    3370021, 
    3406022, 
    3754833, 
    4052800, 
    4061512, 
    6102841, 
    7431273 
   ]

  @women_faces = [ 
    1520760, 
    1644924, 
    1691294, 
    1845993, 
    3021554, 
    3021563, 
    3394658, 
    3936894, 
    4258184, 
    5025111, 
    5649997, 
    6682475, 
    7073078, 
    7717254, 
    8219320,
    1520760, 
    1644924, 
    1691294, 
    1845993, 
    3021554, 
    3021563, 
    3394658, 
    3936894, 
    4258184, 
    5025111, 
    5649997, 
    6682475, 
    7073078, 
    7717254, 
    8219320,
    1520760, 
    1644924, 
    1691294, 
    1845993, 
    3021554, 
    3021563, 
    3394658, 
    3936894, 
    4258184, 
    5025111, 
    5649997, 
    6682475, 
    7073078, 
    7717254, 
    8219320 
  ]

  @locations = [ 
    'Singapore',
    'Hong Kong',
    'Beijing',
    'Jakarta',
    'Melbourne',
    'New York',
    'Paris',
    'London',
    'Dubai',
    'New Delhi',
    'Seoul'
  ]
  @motivations = [ 
    'I often felt like I went into work every day to perform a role that was written for someone else. I always wanted to be both creative and building solutions, but somehow I had ended up following a different path.',
    'On paper I was successful and I should have been happy. Instead I felt hollow. I started to question what I was doing. All I had done for so long was work. My personal life was a mess; my dog was literally the only thing that brought me joy. I wanted to make a difference. But all I was doing was supporting consumerism and making rich companies richer.',
    'I was sitting in traffic and thought to myself "What am I doing? Why am I sitting in traffic? Why am I wasting my time? Is money the only reason I am doing this?" In answering those questions, I knew it was time to make a change.',
    'In my 9-5, I was unrecognisable compared to the person I am today. I felt exhausted and extremely unappreciated. Due to the stress of my job, I was losing sleep, waking up with anxiety, and skipping lunch most days. It was a very unhealthy environment for me. Anxiety was not something I had ever encountered before!', 
    'I could not picture myself spending the next 30 to 40 years in an office job. There is nothing wrong with it, and I know so many people do it, but I just felt it was not the best fit for me.' 
  ]
  @journeys = [ 
    "I think that sometimes in the beginning, I played it a bit too safe. I should probably have scaled up quicker than I did (I lost out on commissions, etc. because I couldn't deliver my work quickly enough). Another challenge for me has been to balance making a living with keeping my pursuit affordable. It is also sometimes a challenge to both have a day-job, and have time to still be chasing your dreams!",
    "The most difficult thing about changing? Changing my mindset and letting go of the way I'd always done things. I'm the kind of person who's always looking six steps ahead. So I didn't like it when I couldn't see where the process was heading.  When I finally managed to stop worrying about finding the answer and just religiously went through all of the steps I started to get breakthroughs. I realised it wasn't about being on one path. I can be on three! Having a tech career driven by my passions wasn't something that I'd really considered or even knew existed before.",
    "I told my boss that I needed to follow my passion. They understood entirely. I wrapped up the projects I was working on and then left. I knew that I needed to commit 100% effort to making my new career work, or else it never would. I began looking for how to build my skills and started trying every which way to practise and showcase what I learnt.",
    "As a rookie, it was difficult learning how to get comfortable with totally new concepts and tools, understanding them and applying them. I'm not naturally a analytical person. So dealing with logic in systematic steps was intimidating at the start. But, it's definitely gotten easier with practice. You just have to push through the discomfort until it becomes normal.",
    "I looked for courses that didn't require a lot of money, and also leaned into my network of friends in Tech. I was still working at my job when I started my journey and didn't quit until I had saved enough to support me financially (at least somewhat). This took about a year. Gave up on holidays, normal social life, and a lot of niceties !"
  ]
  @advices = [ 
     "I've learned that it's okay to feel fear. I was scared when I quit my job. The trick has been not to let it paralyse me. I've had to stop caring so much about what the world thinks or whether I might fail. So what if I fail? If you haven't failed or taken some chances, you haven't lived your life. You've just kept standing on those escalators, letting life happen to you.", 
    "Take the first step. You don't have to run. You don't need to know where you're going. Take it one step at a time.", 
    "Listen to your gut!", 
    "I would advise others to not compromise their happiness in exchange for a salary. There are so many opportunities out there waiting for you! Start planning your exit (check your finances, learn new skills, build your website, feed your brain with knowledge). But make sure it's something worthwhile. Also, don't wait to be perfect. You'll never know it all. The best way to learn is by simply saying 'yes' and getting stuck in.", 
    "Take baby steps. Don't leave your regular job too quickly, and be willing to work very hard to build up your skills, whether that's in your lunch break, evenings, or even weekends. Don't sweat the small things, and figure it out along the way. What you think is the problem now, often turns out not to be the actual problem a few months down the line."
  ]
  print `clear`
  puts "🤝🤝 Now Creating Next 67 General Users 🤝🤝"
  i = 1
  j = 0
  k = 0

  67.times do
    if i.odd?
      @name1 = Faker::Name.female_first_name
      @img_url = "#{@src1}#{@women_faces[k]}#{@src3}#{@women_faces[k]}#{@src5}"
      k += 1
    else
      @name1 = Faker::Name.male_first_name
      @img_url = "#{@src1}#{@men_faces[j]}#{@src3}#{@men_faces[j]}#{@src5}"
      j += 1
    end

    user_email = "user#{i}@xyz.com"

    puts "Creating User #{i} of 67 - #{user_email}"

    User.create!(
      first_name: @name1,
      email: user_email,
      password: "secret",
      last_name: Faker::Name.last_name,
      budget: [500, 1000, 1500, 2000, 2500, 3000].sample,
      timeframe: [6, 12, 18, 24].sample,
      current_role: @current_roles_all.sample,
      current_industry: @current_industries_all.sample,
      future_industry: 'IT/Tech',
      future_role: @future_roles_all.sample,
      available_hrs_per_week: [12, 24, 36, 40, 60].sample,
      status: ['Online', 'Offline'].sample,
      img_url: @img_url,
      advice: @advices.sample,
      location: @locations.sample,
      motivation: @motivations.sample,
      journey_experience: @journeys.sample,
      satisfaction: @satisfactions.sample
      )
    i += 1
  end  
end

def seedConnections
  print `clear`
  puts "🏆🏆 Creating Connections between Minyoung, Nicole and Chris!🏆🏆"

  @minyoung = User.where(email: 'minyoungchang65@gmail.com').first.id
  @nicole = User.where(email: 'leowminzi@gmail.com').first.id
  @chris = User.where(email: 'chris@bootcamp.sg').first.id

  puts "Connecting Minyoung to Nicole"
  Connection.create!(
    connecting_id: @nicole,
    connecter_id: @minyoung
  )

  puts "Connecting Nicole to Minyoung"
  Connection.create!(
    connecting_id: @minyoung,
    connecter_id: @nicole
  )

  puts "Connecting Chris to Nicole"
  Connection.create!(
    connecting_id: @nicole,
    connecter_id: @chris
  )

  puts "Connecting Nicole to Chris"
  Connection.create!(
    connecting_id: @chris,
    connecter_id: @nicole
  )

  puts "Connecting Minyoung to Chris"
  Connection.create!(
    connecting_id: @chris,
    connecter_id: @minyoung
  )

  puts "Connecting Chris to Minyoung"
  Connection.create!(
    connecting_id: @minyoung,
    connecter_id: @chris
  )
end

def seedMessages
  print `clear`
  puts "🏆🏆 Creating 100 Messages 🏆🏆"

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
    if rand == 0
      @content = Faker::Quote.yoda
    elsif rand == 1
      @content = Faker::Quote.famous_last_words
    elsif rand == 2
      @content = Faker::Quote.jack_handey
    elsif rand == 3
      @content = Faker::Quote.matz
    elsif rand == 4
      @content = Faker::Quote.most_interesting_man_in_the_world
    elsif rand == 5
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

def seedTopics
  print `clear`
  puts "🏆🏆 Creating 10 Topics 🏆🏆"
  @topics_list = [ 
    'Master Plan', 
    'Bootcamp', 
    'HTML', 
    'JavaScript', 
    'CSS', 
    'Git/Github', 
    'Databases', 
    'Other', 
    'HTML-CSS-JS', 
    'Frameworks'
  ]

  Topic.destroy_all
  idx = 0
  
  10.times do
    puts "Creating Topic #{idx + 1} - #{@topics_list[idx]}"
    Topic.create!(name: @topics_list[idx])
    idx += 1
  end  
end

def seedCourses
  print `clear`
  puts "🏆🏆 Creating 64 Courses 🏆🏆"

  @providers = [ 
    'AppAcademy', 
    'Le Wagon', 
    'Le Wagon', 
    'Le Wagon', 
    'Udacity', 
    'CodeChef', 
    'MIT OpenCourse', 
    'Reading Material', 
    'The Odin Project', 
    'The Odin Project', 
    'YouTube', 
    'General Assembly', 
    'Reading Material', 
    'The Odin Project', 
    'The Tech Academy', 
    'YouTube', 
    'Codecademy', 
    'Coursera', 
    'Hack Reactor', 
    'The Tech Academy', 
    'Udemy', 
    'AppAcademy', 
    'AppAcademy', 
    'Codecademy', 
    'CodeChef', 
    'Coursera', 
    'General Assembly', 
    'General Assembly', 
    'Hack Reactor', 
    'Le Wagon', 
    'Le Wagon', 
    'MIT OpenCourse', 
    'Reading Material', 
    'The Odin Project', 
    'The Odin Project', 
    'The Tech Academy', 
    'Udacity', 
    'Udacity', 
    'Udemy', 
    'YouTube', 
    'AppAcademy', 
    'CodeChef', 
    'CodeChef', 
    'CodeChef', 
    'CodeChef', 
    'CodeChef', 
    'Coursera', 
    'Coursera', 
    'General Assembly', 
    'Hack Reactor', 
    'Hack Reactor', 
    'Le Wagon', 
    'MIT OpenCourse', 
    'MIT OpenCourse', 
    'MIT OpenCourse', 
    'Reading Material', 
    'The Tech Academy', 
    'Udacity', 
    'Udemy', 
    'Udemy', 
    'YouTube', 
    'YouTube', 
    'Codecademy', 
    'Codecademy' 
  ]

  @titles = [
    'Live Online Coding Bootcamp', 
    'Software Development BootCamp', 
    'Web Development Full Time', 
    'Web Development Part Time', 
    'Full Stack Web Dev Bootcamp', 
    'MongoDB Atlas', 
    'PostgreSQL', 
    'mySQL with innoDB and NDB', 
    'SQLite3', 
    'Basic MongoDB', 
    'Intro to databases', 
    'Advanced React, Django Program', 
    'Create your first chatbot with Python and Rasa', 
    'Ruby for everybody', 
    'Advanced Ruby on Rails', 
    'Django for everybody', 
    'Git Set Go !', 
    'Git/Github in no time !', 
    'Git/Github Fundamentals', 
    'Git/Github Basics', 
    'Git/Github Immersive', 
    'HTML & CSS Fundamentals', 
    'Advanced Mobile App Development', 
    'Javascript Online', 
    'Master Javascript', 
    'HTML & CSS Basics', 
    'HTML & CSS Basics', 
    'HTML & CSS Online Course', 
    'HTML & CSS', 
    'Create Websites In a Jiffy', 
    'Advanced API', 
    'Javascript Fundamentals', 
    'Angular JS', 
    'Javascript Basics', 
    'Node with React: Fullstack Web Development', 
    'Website Design Introduction', 
    'HTML & CSS Basics', 
    'Advanced Frontend: HTML, CSS, Javascript', 
    'HTML & CSS Fundamentals', 
    'HTML & CSS Online!', 
    'Game design', 
    'Best open source projects for beginners', 
    'Preparing for technical interview for FAANG', 
    'Tensorflow: Data deployment', 
    'Complete guide to become a software engineer', 
    'Upenn Fundamentals of Software Dev', 
    'Android App Development', 
    'Learn blockchains building by one', 
    'How to think like a programmer', 
    'An intro to programming', 
    'iOS App Development', 
    'Everything you need to know about junior developers', 
    'Basic Tensorflow ', 
    'Preparing for technical interview 101', 
    'Software Immersive Program', 
    'Preparing for technical resume 101', 
    'How to work in a startup as a software engineer', 
    'Fundamental of Software Development', 
    'Automation with Python', 
    'Learn Python with Raspberry Pi', 
    'Data Science 101', 
    'Preparing for the advanced technical interview', 
    'AWS Cloud Essentials', 
    'Learn Software Development 101' 
  ]

  @course_fees = [
    300, 
    3000, 
    3000, 
    3000, 
    400, 
    200, 
    300, 
    0, 
    600, 
    600, 
    0, 
    0, 
    0, 
    600, 
    250, 
    0, 
    250, 
    100, 
    0, 
    250, 
    150, 
    300, 
    300, 
    250, 
    200, 
    100, 
    0, 
    0, 
    0, 
    3000, 
    3000, 
    300, 
    0, 
    600, 
    600, 
    250, 
    400, 
    400, 
    150, 
    0, 
    300, 
    200, 
    200, 
    200, 
    200, 
    200, 
    100, 
    100, 
    0, 
    0, 
    0, 
    3000, 
    300, 
    300, 
    300, 
    0, 
    250, 
    400, 
    150, 
    150, 
    0, 
    0, 
    250, 
    250 
  ]

  @provider_urls = [
    'https://www.appacademy.io/', 
    'https://www.lewagon.com/', 
    'https://www.lewagon.com/', 
    'https://www.lewagon.com/', 
    'https://www.udacity.com/', 
    'https://www.codechef.com/', 
    'https://ocw.mit.edu/index.htm ', 
    'https://hackernoon.com/tagged/programming', 
    'https://www.theodinproject.com/', 
    'https://www.theodinproject.com/', 
    'https://www.youtube.com', 
    'https://generalassemb.ly/', 
    'https://hackernoon.com/tagged/programming', 
    'https://www.theodinproject.com/', 
    'https://thetechacademy.net/', 
    'https://www.youtube.com', 
    'https://www.codecademy.com/', 
    'https://www.coursera.com ', 
    'https://www.hackreactor.com/', 
    'https://thetechacademy.net/', 
    'https://www.udemy.com', 
    'https://www.appacademy.io/', 
    'https://www.appacademy.io/', 
    'https://www.codecademy.com/', 
    'https://www.codechef.com/', 
    'https://www.coursera.com ', 
    'https://generalassemb.ly/', 
    'https://generalassemb.ly/', 
    'https://www.hackreactor.com/', 
    'https://www.lewagon.com/', 
    'https://www.lewagon.com/', 
    'https://ocw.mit.edu/index.htm ', 
    'https://hackernoon.com/tagged/programming', 
    'https://www.theodinproject.com/', 
    'https://www.theodinproject.com/', 
    'https://thetechacademy.net/', 
    'https://www.udacity.com/', 
    'https://www.udacity.com/', 
    'https://www.udemy.com', 
    'https://www.youtube.com', 
    'https://www.appacademy.io/', 
    'https://www.codechef.com/', 
    'https://www.codechef.com/', 
    'https://www.codechef.com/', 
    'https://www.codechef.com/', 
    'https://www.codechef.com/', 
    'https://www.coursera.com ', 
    'https://www.coursera.com ', 
    'https://generalassemb.ly/', 
    'https://www.hackreactor.com/', 
    'https://www.hackreactor.com/', 
    'https://www.lewagon.com/', 
    'https://ocw.mit.edu/index.htm ', 
    'https://ocw.mit.edu/index.htm ', 
    'https://ocw.mit.edu/index.htm ', 
    'https://hackernoon.com/tagged/programming', 
    'https://thetechacademy.net/', 
    'https://www.udacity.com/', 
    'https://www.udemy.com', 
    'https://www.udemy.com', 
    'https://www.youtube.com', 
    'https://www.youtube.com', 
    'https://www.codecademy.com/', 
    'https://www.codecademy.com/' 
  ]

  @durations = [
    6, 
    2, 
    4, 
    5, 
    3, 
    3, 
    4, 
    3, 
    3, 
    1, 
    1, 
    5, 
    2, 
    1, 
    2, 
    5, 
    1, 
    4, 
    4, 
    3, 
    1, 
    2, 
    3, 
    2, 
    5, 
    4, 
    1, 
    1, 
    3, 
    2, 
    1, 
    1, 
    2, 
    2, 
    1, 
    2, 
    1, 
    4, 
    3, 
    1, 
    4, 
    2, 
    3, 
    3, 
    3, 
    2, 
    2, 
    5, 
    3, 
    4, 
    5, 
    2, 
    4, 
    2, 
    1, 
    2, 
    3, 
    2, 
    2, 
    5, 
    4, 
    4, 
    2, 
    1 
  ]

  @hours_per_week_values = [
    12, 
    40, 
    24, 
    8, 
    24, 
    8, 
    24, 
    32, 
    40, 
    40, 
    32, 
    16, 
    40, 
    16, 
    40, 
    8, 
    32, 
    24, 
    32, 
    24, 
    16, 
    16, 
    40, 
    32, 
    24, 
    40, 
    8, 
    8, 
    16, 
    8, 
    16, 
    32, 
    16, 
    8, 
    16, 
    32, 
    16, 
    8, 
    32, 
    16, 
    24, 
    40, 
    8, 
    32, 
    32, 
    24, 
    16, 
    32, 
    16, 
    40, 
    16, 
    32, 
    8, 
    40, 
    40, 
    40, 
    32, 
    40, 
    16, 
    24, 
    8, 
    8, 
    40, 
    16, 
  ]
  
  @bootcampID = Topic.where(name: "Bootcamp").first.id
  @databasesID = Topic.where(name: "Databases").first.id
  @frameworksID = Topic.where(name: "Frameworks").first.id
  @gitGithubID = Topic.where(name: "Git/Github").first.id
  @htmlcssjsID = Topic.where(name: "HTML-CSS-JS").first.id
  @otherID = Topic.where(name: "Other").first.id

  idx = 0
  
  Course.destroy_all

  64.times do
    provider = @providers[idx]
    title = @titles[idx]

    if idx < 5
      course_topic_id = @bootcampID
    elsif idx < 11
      course_topic_id = @databasesID
    elsif idx < 16
      course_topic_id = @frameworksID
    elsif idx < 21
      course_topic_id = @gitGithubID
    elsif idx < 40
      course_topic_id = @htmlcssjsID
    else
      course_topic_id = @otherID
    end

    topic_name = Topic.find(course_topic_id).name

    puts "Creating Course #{idx + 1} #{@titles[idx]}-#{@providers[idx]} Topic: #{topic_name}"

    Course.create!(
      provider: @providers[idx],
      title: @titles[idx],
      cost: @course_fees[idx],
      duration: @durations[idx],
      provider_url: @provider_urls[idx],
      hourse_per_week: @hours_per_week_values[idx],
      topic_id: course_topic_id
    )
    idx += 1
  end
end

def seedRoadmaps
  print `clear`
  puts "🏆🏆 Creating Roadmaps for all 81 seeded users 🏆🏆"
  
  Roadmap.destroy_all

  @start_dates = [ 
    '1-Feb-21', 
    '1-May-21', 
    '1-Jan-21', 
    '1-Apr-21', 
    '1-May-21', 
    '1-Apr-21', 
    '1-May-21', 
    '1-Mar-21', 
    '1-Apr-21', 
    '1-Mar-21', 
    '1-Feb-21', 
    '1-Mar-21', 
    '1-Apr-21', 
    '1-Jan-21', 
    '1-Mar-20', 
    '1-Mar-20', 
    '1-Mar-20', 
    '1-Feb-20', 
    '1-Feb-20', 
    '1-Jan-20', 
    '1-May-20', 
    '1-Feb-20', 
    '1-Feb-20', 
    '1-Mar-21', 
    '1-Feb-21', 
    '1-Jan-21', 
    '1-May-21', 
    '1-Feb-21', 
    '1-Feb-21', 
    '1-Mar-21', 
    '1-Apr-21', 
    '1-May-21', 
    '1-Mar-21', 
    '1-Mar-21', 
    '1-Feb-20', 
    '1-Feb-20', 
    '1-Apr-21', 
    '1-Jan-21', 
    '1-May-21', 
    '1-Jan-20', 
    '1-Feb-20', 
    '1-Jan-20', 
    '1-Feb-20', 
    '1-Mar-20', 
    '1-Feb-21', 
    '1-Apr-21', 
    '1-May-21', 
    '1-Feb-21', 
    '1-Feb-21', 
    '1-Apr-21', 
    '1-Mar-21', 
    '1-Feb-21', 
    '1-Feb-20', 
    '1-Feb-20', 
    '1-Mar-20', 
    '1-Apr-21', 
    '1-Jan-21', 
    '1-May-21', 
    '1-Apr-20', 
    '1-Mar-20', 
    '1-Feb-20', 
    '1-Mar-20', 
    '1-Feb-20', 
    '1-Feb-20', 
    '1-Mar-20', 
    '1-Apr-20', 
    '1-Jan-20', 
    '1-Apr-20', 
    '1-Feb-21', 
    '1-Mar-21', 
    '1-Mar-21', 
    '1-Mar-21', 
    '1-Feb-21', 
    '1-Mar-20', 
    '1-Jan-20', 
    '1-Jan-20', 
    '1-Jan-21', 
    '1-Mar-21', 
    '1-Apr-21', 
    '1-Feb-20', 
    '1-Mar-20' 
  ]

  @end_dates = [
    '30-Jul-21', 
    '30-Nov-21', 
    '30-Oct-21', 
    '30-Nov-21', 
    '30-Nov-21', 
    '30-Oct-21', 
    '30-Nov-21', 
    '30-Oct-21', 
    '30-Oct-21', 
    '30-Oct-21', 
    '30-Jul-21', 
    '30-Aug-21', 
    '30-Oct-21', 
    '30-Oct-21', 
    '30-Aug-20', 
    '30-Aug-20', 
    '30-Nov-20', 
    '30-Oct-20', 
    '30-Nov-20', 
    '30-Oct-20', 
    '30-Nov-20', 
    '30-Oct-20', 
    '30-Jul-20', 
    '30-Nov-21', 
    '30-Nov-21', 
    '30-Oct-21', 
    '30-Nov-21', 
    '30-Jul-21', 
    '30-Nov-21', 
    '30-Aug-21', 
    '30-Nov-21', 
    '30-Nov-21', 
    '30-Aug-21', 
    '30-Nov-21', 
    '30-Jul-20', 
    '30-Nov-20', 
    '30-Nov-21', 
    '30-Oct-21', 
    '30-Nov-21', 
    '30-Oct-20', 
    '30-Nov-20', 
    '30-Oct-20', 
    '30-Nov-20', 
    '30-Oct-20', 
    '30-Nov-21', 
    '30-Nov-21', 
    '30-Nov-21', 
    '30-Nov-21', 
    '30-Nov-21', 
    '30-Oct-21', 
    '30-Nov-21', 
    '30-Jul-21', 
    '30-Oct-20', 
    '30-Oct-20', 
    '30-Aug-20', 
    '30-Oct-21', 
    '30-Oct-21', 
    '30-Nov-21', 
    '30-Oct-20', 
    '30-Oct-20', 
    '30-Nov-20', 
    '30-Aug-20', 
    '30-Oct-20', 
    '30-Oct-20', 
    '30-Nov-20', 
    '30-Nov-20', 
    '30-Oct-20', 
    '30-Oct-20', 
    '30-Nov-21', 
    '30-Aug-21', 
    '30-Aug-21', 
    '30-Oct-21', 
    '30-Nov-21', 
    '30-Nov-20', 
    '30-Oct-20', 
    '30-Oct-20', 
    '30-Oct-21', 
    '30-Nov-21', 
    '30-Nov-21', 
    '30-Oct-20', 
    '30-Nov-20' 
  ]

  @durations = [
    6, 
    7, 
    10, 
    8, 
    7, 
    7, 
    7, 
    8, 
    7, 
    8, 
    6, 
    6, 
    7, 
    10, 
    6, 
    6, 
    9, 
    9, 
    10, 
    10, 
    7, 
    9, 
    6, 
    9, 
    10, 
    10, 
    7, 
    6, 
    10, 
    6, 
    8, 
    7, 
    6, 
    9, 
    6, 
    10, 
    8, 
    10, 
    7, 
    10, 
    10, 
    10, 
    10, 
    8, 
    10, 
    8, 
    7, 
    10, 
    10, 
    7, 
    9, 
    6, 
    9, 
    9, 
    6, 
    7, 
    10, 
    7, 
    7, 
    8, 
    10, 
    6, 
    9, 
    9, 
    9, 
    8, 
    10, 
    7, 
    10, 
    6, 
    6, 
    8, 
    10, 
    9, 
    10, 
    10, 
    10, 
    9, 
    8, 
    9, 
    9 
  ]

  idx = 0

  81.times do
    puts "Creating Roadmap #{idx + 1} - for user #{User.all[idx].first_name} #{User.all[idx].last_name}"
    d1 = Date.parse @start_dates[idx]
    d2 = Date.parse @end_dates[idx]
    Roadmap.create!(
      privacy_option: false,
      start_date: d1,
      end_date: d2,
      duration: @durations[idx],
      user_id: User.all[idx].id
    )
    idx += 1
  end  
end

def seedCoursesRoadmapsJoinTable
  print `clear`
  puts "🏆🏆 Creating Course Roadmaps Join Table for 81 Roadmaps🏆🏆"

  CourseRoadmap.destroy_all

  @coursesMap = [
    [ 3, 27, 31, 36, 14, 6 ], 
    [ 1, 24, 31, 35, 13, 8, 10 ], 
    [ 1, 26, 32, 37, 15, 6, 9, 21, 46, 54 ], 
    [ 3, 25, 29, 37, 13, 8, 11, 18 ], 
    [ 4, 25, 31, 34, 14, 6, 10 ], 
    [ 1, 22, 32, 35, 12, 8, 11 ], 
    [ 5, 22, 29, 37, 13, 8, 10 ], 
    [ 4, 24, 31, 39, 15, 7, 10, 18 ], 
    [ 5, 22, 29, 39, 13, 8, 10 ], 
    [ 3, 23, 32, 38, 13, 6, 10, 18 ], 
    [ 2, 25, 29, 40, 15, 6 ], 
    [ 1, 23, 29, 37, 16, 7 ], 
    [ 4, 27, 31, 37, 14, 6, 10 ], 
    [ 2, 23, 31, 39, 16, 8, 11, 17, 50, 57 ], 
    [ 3, 24, 29, 34, 15, 6 ], 
    [ 5, 25, 31, 35, 14, 7 ], 
    [ 4, 22, 28, 35, 15, 8, 10, 21, 47 ], 
    [ 5, 25, 29, 39, 12, 6, 10, 18, 48 ], 
    [ 2, 25, 29, 35, 16, 6, 9, 19, 50, 63 ], 
    [ 2, 22, 33, 38, 16, 8, 9, 17, 53, 62 ], 
    [ 1, 22, 29, 34, 12, 8, 10 ], 
    [ 3, 22, 28, 40, 14, 8, 9, 18, 51 ], 
    [ 3, 22, 29, 40, 16, 6 ], 
    [ 3, 22, 30, 38, 13, 8, 9, 20, 52 ], 
    [ 2, 26, 33, 40, 14, 8, 10, 19, 47, 55 ], 
    [ 1, 23, 31, 35, 12, 6, 11, 17, 44, 63 ], 
    [ 2, 26, 30, 35, 16, 7, 11 ], 
    [ 1, 22, 28, 36, 13, 8 ], 
    [ 1, 24, 30, 35, 12, 6, 9, 20, 50, 62 ], 
    [ 4, 25, 28, 38, 16, 8 ], 
    [ 4, 24, 32, 38, 13, 8, 11, 19 ], 
    [ 5, 27, 29, 39, 12, 7, 10 ], 
    [ 4, 27, 28, 39, 15, 8 ], 
    [ 1, 26, 32, 34, 15, 7, 11, 19, 52 ], 
    [ 2, 25, 31, 37, 16, 7 ], 
    [ 5, 25, 31, 35, 12, 7, 9, 17, 42, 57 ], 
    [ 1, 26, 29, 36, 14, 6, 11, 18 ], 
    [ 3, 22, 30, 35, 12, 8, 9, 17, 44, 56 ], 
    [ 4, 26, 31, 36, 14, 7, 9 ], 
    [ 5, 27, 29, 37, 15, 8, 11, 18, 49, 59 ], 
    [ 1, 25, 28, 38, 13, 6, 11, 21, 53, 62 ], 
    [ 3, 22, 28, 36, 13, 7, 10, 19, 49, 58 ], 
    [ 1, 26, 30, 35, 13, 7, 11, 18, 51, 58 ], 
    [ 3, 25, 28, 39, 13, 6, 10, 21 ], 
    [ 5, 27, 30, 40, 14, 7, 11, 18, 44, 59 ], 
    [ 4, 22, 32, 34, 15, 8, 11, 18 ], 
    [ 1, 24, 30, 36, 15, 7, 9 ], 
    [ 3, 26, 29, 39, 15, 7, 11, 21, 46, 57 ], 
    [ 5, 22, 29, 40, 12, 7, 9, 21, 43, 54 ], 
    [ 4, 22, 33, 36, 13, 7, 11 ], 
    [ 1, 23, 29, 35, 15, 8, 10, 18, 43 ], 
    [ 3, 24, 29, 39, 12, 6 ], 
    [ 3, 23, 28, 36, 13, 7, 9, 21, 44 ], 
    [ 2, 24, 28, 36, 13, 7, 11, 20, 45 ], 
    [ 1, 27, 29, 36, 16, 8 ], 
    [ 3, 22, 29, 34, 13, 7, 10 ], 
    [ 2, 26, 28, 34, 13, 6, 11, 19, 42, 60 ], 
    [ 3, 25, 31, 35, 13, 6, 11 ], 
    [ 4, 25, 32, 38, 16, 6, 10 ], 
    [ 2, 22, 30, 38, 16, 7, 9, 21 ], 
    [ 4, 27, 33, 38, 12, 7, 11, 19, 49, 55 ], 
    [ 1, 24, 28, 40, 12, 7 ], 
    [ 2, 23, 31, 34, 14, 8, 11, 17, 45 ], 
    [ 1, 27, 31, 39, 14, 6, 11, 20, 49 ], 
    [ 1, 26, 32, 37, 14, 7, 11, 21, 48 ], 
    [ 1, 26, 31, 36, 16, 6, 11, 21 ], 
    [ 3, 25, 33, 40, 12, 7, 11, 20, 48, 63 ], 
    [ 3, 23, 28, 40, 15, 8, 9 ], 
    [ 2, 27, 33, 37, 14, 6, 9, 17, 50, 62 ], 
    [ 5, 22, 29, 37, 14, 6 ], 
    [ 5, 26, 33, 34, 14, 6 ], 
    [ 1, 25, 30, 38, 12, 6, 11, 17 ], 
    [ 4, 24, 29, 38, 15, 6, 10, 18, 41, 59 ], 
    [ 4, 27, 32, 38, 13, 8, 11, 19, 41 ], 
    [ 3, 23, 33, 39, 14, 7, 10, 20, 43, 57 ], 
    [ 2, 25, 32, 38, 16, 7, 11, 18, 46, 60 ], 
    [ 1, 25, 33, 38, 16, 6, 9, 20, 49, 61 ], 
    [ 3, 23, 29, 36, 14, 8, 10, 19, 53 ], 
    [ 3, 27, 29, 35, 12, 7, 11, 20 ], 
    [ 1, 27, 30, 37, 16, 8, 9, 19, 53 ], 
    [ 1, 23, 31, 36, 16, 6, 10, 18, 52 ], 
  ]
  
  idx = 0
  81.times do
    @roadmapID = Roadmap.all[idx].id
    @courses = Course.all
    @roadmapEndDate = Roadmap.all[idx].end_date

    # puts "#{idx + 1} Roadmap ID #{@roadmapID} End Date #{@roadmapEndDate}"
    @roadmapEndDate < Date.today ? @status = "Completed" : @status = "In progress"
    
    @rdmapcoursesArray = @coursesMap[idx]
    j = @rdmapcoursesArray.length
    k = 0
    j.times do
      @courseNo = @rdmapcoursesArray[k]
      puts "#{idx+1}-#{k+1} Roadmap: #{@roadmapID} Course #{@courses[@courseNo].id} #{@courses[@courseNo].title}"
      
      CourseRoadmap.create!(
        status: @status,
        course_id: @courses[@courseNo].id,
        roadmap_id: @roadmapID,
        order: j
      )
      k += 1
    end
    idx += 1
  end
end

print `clear`
puts '*********************************'
puts '  Welcome to ConnectDots Seeding '
puts '*********************************'
puts ''
seedUsers14
seedUsers67
seedConnections
# seedMessages
seedTopics
seedCourses
seedRoadmaps
seedCoursesRoadmapsJoinTable

printStats
