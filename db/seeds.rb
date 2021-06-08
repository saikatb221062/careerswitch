require 'faker'

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

men_faces = [ 749091, 977374, 1267335, 1546912, 2269872, 2341350, 2531553, 3211476, 3370021, 3406022, 3754833, 4052800, 4061512, 6102841, 7431273 ]

women_faces = [ 1520760, 1644924, 1691294, 1845993, 3021554, 3021563, 3394658, 3936894, 4258184, 5025111, 5649997, 6682475, 7073078, 7717254, 8219320 ]

i = 1
j = 0
k = 0

30.times do
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
    journey_experience: Faker::Lorem.paragraph_by_chars(number: 512, supplemental: false),
    satisfaction: @satisfaction.sample
    )
   
  i += 1
end
