require 'open-uri'

puts 'cleaning db'
Skill.destroy_all
Event.destroy_all
TourMember.destroy_all
Broadcast.destroy_all
Notification.destroy_all
User.destroy_all
Tour.destroy_all

puts 'creating skills'

Skill.create(name: 'Piano', detail: 'keys')
Skill.create(name: 'Acoustic Guitar', detail: 'guitar')
Skill.create(name: 'Sound Tech', detail: 'all needs sound')
Skill.create(name: 'Light Tech', detail: 'all needs lights')
Skill.create(name: 'Bass', detail: 'bass guitar')
Skill.create(name: 'Drums', detail: 'drums')
Skill.create(name: 'Electric Guitar', detail: 'electric')
Skill.create(name: 'Manager', detail: 'manager')
Skill.create(name: 'Vocals', detail: 'vocals')

puts "created #{Skill.all.count} skills!"

puts 'creating users with skills!'

users = [
  { skills: ['Drums', 'Light Tech'], full_name: 'Alex P', nickname: 'Alex', description: '',
    phone: '5145556316', email: 'alex@drums.com', avatar: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1620009393/elpxfvm9mhxsxqcjm1l2.jpg' },
  { skills: ['Electric Guitar', 'Acoustic Guitar'], full_name: 'Anne-Marie N', nickname: 'A-M', description: '',
    phone: '5145556298', email: 'a-m@muzak.com', avatar: 'https://avatars.githubusercontent.com/u/77209045?v=4' },
  { skills: ['Piano', 'Sound Tech', 'Light Tech'], full_name: 'Steph Laf', nickname: 'Steph',
    description: 'happy to be around, playing music so i can feed my cat -- stay humble',
    phone: '5145556214', email: 'steph@ilovemycat.com',
    avatar: 'https://avatars.githubusercontent.com/u/37821714?v=4' },
  { skills: ['Manager', 'Sound Tech'], full_name: 'Cathy G', nickname: 'Cathy', description: "pumped to be here - let's go!",
    phone: '5145559846', email: 'cathy@mgmt.com',
    avatar: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617638724/rozdl8g3ybb6siqechzz.jpg' },
  { skills: ['Vocals', 'Drums', 'Bass', 'Electric Guitar', 'Acoustic Guitar'],
    full_name: 'Freddy M', nickname: 'Freddy', description: 'live love drum',
    phone: '5145551278', email: 'freddy@tunez.com',
    avatar: "https://avatars.githubusercontent.com/u/77168127?v=4" },
  # { skills: ['Piano', 'Bass', 'Vocals'], full_name: 'Holly Hilts', nickname: 'Holly', description: 'live love drum',
  #   phone: '5145551278', email: 'holly@wagon.com',
  #   avatar: "https://www.biography.com/.image/ar_4:3%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTc5OTQ5ODk3MTMzMzM1ODk2/gettyimages-1176816280.jpg" },
  { skills: ['Electric Guitar', 'Acoustic Guitar'], full_name: 'Chris B', nickname: 'Chris', description: 'live love drum',
    phone: '5145551278', email: 'chris@wagon.com',
    avatar: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617627276/hoact5mfjbglgnnwq4o9.jpg" },
  { skills: ['Sound Tech', 'Light Tech'], full_name: 'Clayton L', nickname: 'Clayton', description: 'live love drum',
    phone: '5145551278', email: 'clayton@wagon.com',
    avatar: "https://avatars.githubusercontent.com/u/80467300?v=4" },
  { skills: ['Vocals', 'Bass'], full_name: 'Luis B', nickname: 'Luis', description: 'live love drum',
    phone: '5145551278', email: 'luis@wagon.com',
    avatar: "https://avatars.githubusercontent.com/u/34893593?v=4" },
  { skills: ['Vocals', 'Drums'], full_name: 'Baptiste A', nickname: 'Baptiste', description: 'live love drum',
    phone: '5145551278', email: 'baptiste@wagon.com',
    avatar: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617709843/puydxesogpdoftbzekyp.jpg" },
  { skills: ['Acoustic Guitar', 'Bass'], full_name: 'Jean C', nickname: 'Jean-Jean', description: 'live love drum',
    phone: '5145551278', email: 'jean@wagon.com',
    avatar: "https://avatars.githubusercontent.com/u/43459137?v=4" },
  { skills: ['Drums', 'Vocals'], full_name: 'Daniel S', nickname: 'Daniel', description: 'live love drum',
    phone: '5145551278', email: 'daniel@wagon.com',
    avatar: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617128231/a2jv0r1qgeekuaptcyfw.jpg" },
  { skills: ['Bass', 'Electric Guitar'], full_name: 'Thomas S', nickname: 'Thomas', description: 'live love drum',
    phone: '5145551278', email: 'thomas@wagon.com',
    avatar: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617625823/uxiisxmqoxwg6ltetmwt.jpg" }
]


count = 0

users.each do |user|
  u = User.new(
    email: user[:email],
    full_name: user[:full_name],
    nickname: user[:nickname],
    description: user[:description],
    phone: user[:phone],
    password: 123456
  )
  user[:skills].each do |skill|
    JobSkill.create!(
      user: u,
      skill: Skill.find_by(name: skill)
    )
  end
  file = URI.open(user[:avatar])
  u.avatar.attach(io: file, filename: "avatar.jpg", content_type: 'image/png')
  u.save!
  count += 1
end

random_users = []

User.all.each do |user|
  random_users << user unless user[:nickname] == 'Cathy' || user [:nickname] == 'Freddy'
end

pp random_users

puts "created #{User.all.count} users!"

puts 'creating tours, events & tour members'

tours = [
  { name: 'Silence Amplified', artist_name: 'Thommy T & Alex', logo: 'https://media.istockphoto.com/photos/whisper-picture-id139524150?k=6&m=139524150&s=612x612&w=0&h=ccXVWhxVpkxd6THkZ_z4OakWJLQjtMpIixUQkNcAJWU='},
  { name: 'Man in Love', artist_name: 'Smooth L', logo: 'https://nafme.org/wp-content/uploads/2016/03/themacx-iStock-Thinkstock.jpg'},
  { name: 'Hairless Heroes', artist_name: 'Steph Pas', logo: 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/53195d3d-df08-48aa-98e8-f34bc81a9980/d4xmo4x-10fe2193-2098-4ce1-8c98-5feec94c05f6.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzUzMTk1ZDNkLWRmMDgtNDhhYS05OGU4LWYzNGJjODFhOTk4MFwvZDR4bW80eC0xMGZlMjE5My0yMDk4LTRjZTEtOGM5OC01ZmVlYzk0YzA1ZjYuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.P8fsS9P9Hn-jVMbK5lu7BQPi39vpxhsLeaxlMScz5go'},
  { name: 'French Connexion', artist_name: 'BT & jean-jean', logo: 'https://www.fluentu.com/blog/french/wp-content/uploads/sites/3/2014/01/casual-everyday-french-phrases1.jpg'},
  { name: 'Bros & Brews', artist_name: 'Cloton & Chrissy B', logo: 'https://images.saymedia-content.com/.image/t_share/MTc0MzU0ODM0NjQ2OTAyMTIw/ten-wonderful-uses-for-beer-besides-drinking-it.jpg'},
  { name: 'Moto Sounds', artist_name: 'Daniel Bronzeman', logo: 'https://i.pinimg.com/originals/5c/56/18/5c561846c00cc8b76229e290daca79f1.jpg'},
  # { name: 'Feminist Wave', artist_name: 'A-M Knows', logo: 'https://assets.vogue.com/photos/5891224258aa89a00d5417c9/master/pass/07-feminist-posters-see-red-womens-workshop.jpg'},
  # { name: 'Wagon Girls', artist_name: 'Camille & Filles', logo: 'https://i.ytimg.com/vi/6oQv1tui-k8/maxresdefault.jpg'}
]

venues = [
  {venue: 'Sala Rossa', city: 'Montreal, QC'},
  {venue: 'Danforth Music Hall', city: 'Toronto, ON'},
  {venue: 'LIVE! On Elgin', city: 'Ottawa, ON'},
  {venue: 'Commodore Ballroom', city: 'Vancouver, BC'},
  {venue: 'The Baron', city: 'Calgary, MB'},
  {venue: 'The Cutting Room', city: 'New York, NY'},
  {venue: 'House of Blues', city: 'Boston, MA'},
  {venue: "Nectar's", city: 'Burlington, VT'},
  {venue: "L'ANTI Bar & Spectacles", city: 'Quebec, QC'}
]

tours.each do |tour|
  t = Tour.new(
    name: tour[:name],
    artist_name: tour[:artist_name],
  )
  file = URI.open(tour[:logo])
  t.logo.attach(io: file, filename: "logo.jpg", content_type: 'image/png')
  t.save!

  if tour[:name] == 'Man in Love'
    main_event = Event.create!(
      schedule: "",
      show_start_at: DateTime.new(2021, 7, 27, 20, 00, 0),
      venue: 'Danforth Music Hall',
      city: 'Toronto, ON',
      tour: t
    )
    TourMember.create!(
      user: User.find_by(email: 'cathy@mgmt.com'),
      event: main_event,
      job_title: 'Manager',
      administrator: true
    )
    TourMember.create!(
      user: User.find_by(email: 'alex@drums.com'),
      event: main_event,
      job_title: 'Drums',
    )


  10.times do
    venue = venues.sample

    event = Event.create!(
      schedule: '',
      show_start_at: rand(30..60).days.from_now.beginning_of_day + rand(18..22).hours,
      venue: venue[:venue],
      city: venue[:city],
      tour: t
    )
    if tour[:name] == 'Man in Love'
      puts 'creating Man in Love'
      TourMember.create!(
        user: User.find_by(email: 'cathy@mgmt.com'),
        event: event,
        job_title: 'Manager',
        administrator: true
      )
      TourMember.create!(
        user: User.find_by(email: 'freddy@tunez.com'),
        event: event,
        job_title: 'Drums',
      )
    elsif tour[:name] == 'Moto Sounds'
      puts 'creating Moto Sounds'
      TourMember.create!(
        user: User.find_by(email: 'freddy@tunez.com'),
        event: event,
        job_title: 'Drums',
      )
    elsif tour[:name] == 'Hairless Heroes'
      puts 'creating Hairless Heroes'
      TourMember.create!(
        user: User.find_by(email: 'freddy@tunez.com'),
        event: event,
        job_title: 'Drums',
      )
    elsif tour[:name] == 'Silence Amplified'
      TourMember.create!(
        user: User.find_by(email: 'cathy@mgmt.com'),
        event: event,
        job_title: 'Sound Tech',
      )
    else
      puts 'creating another tour'
      TourMember.create!(
        user: User.find_by(email: 'thomas@wagon.com'),
        event: event,
        job_title: 'Manager',
        administrator: true
      )
    end
      users_array = random_users.to_a.clone
      tms = []
    5.times do
      user = users_array.sample
      job_title = user.skills.sample.name
      if tms.include?(job_title)
        job_title = user.skills.sample.name
      end
      tm = TourMember.new(
        event: event,
        user: user,
        job_title: job_title
      )
      tms << job_title
      tm.save!
      users_array.delete(user)
    end
    # event.tour = t
  end
end

puts "created #{Tour.all.count} tours, #{Event.all.count} events & #{TourMember.all.count} tour members!"

# puts 'creating events'

# Tour.all.each do |tour|
#   10.times do
#     venue = venues.sample
#     event = Event.new(
#       schedule: '',
#       show_start_at: rand(30..60).days.from_now.beginning_of_day + rand(18..22).hours,
#       venue: venue[:venue],
#       city: venue[:city]
#     )
#     event.tour = tour
#     TourMember.new(event: event, )
#     event.save!
#   end
# end
# puts "created #{Event.all.count} events!"

# puts 'creating tour members'

# tour_members = [
#   {user: User.find_by(email: 'freddy@tunez.com'), event: Tour.find_by(name: 'Moto Sounds').events.first, job_title: 'Drums', administrator: false},
#   {user: User.find_by(email: 'freddy@tunez.com'), event: Tour.find_by(name: 'Man in Love').events.first, job_title: 'Drums', administrator: false},
#   {user: User.find_by(email: 'freddy@tunez.com'), event: Tour.find_by(name: 'Hairless Heroes').events.first, job_title: 'Drums', administrator: false},
#   {user: User.find_by(email: 'steph@ilovemycat.com'), event: Tour.find_by(name: 'Hairless Heroes').events.first, job_title: 'Singer', administrator: false},
#   {user: User.find_by(email: 'a-m@muzak.com'), event: Tour.find_by(name: 'Hairless Heroes').events.first, job_title: 'Sound Tech', administrator: true},
#   {user: User.find_by(email: 'cathy@mgmt.com'), event: Tour.find_by(name: 'Man in Love').events.first, job_title: 'Manager', administrator: true},
#   {user: User.find_by(email: 'cathy@mgmt.com'), event: Tour.find_by(name: 'Silence Amplified').events.first, job_title: 'Sound Tech', administrator: false},
#   # {user: User.find_by(email:), tour: Tour.find_by(name:), job_title: , administrator: }
# ]

# tour_members.each do |tm|
#   TourMember.create!(
#     user: tm[:user],
#     event: tm[:event],
#     job_title: tm[:job_title],
#     administrator: tm[:administrator]
#   )
# end

# Event.all.each do |event|
# end

# puts "created #{TourMember.all.count} tour members !"


puts 'creating broadcasts'

puts "created #{Broadcast.all.count} broadcasts !"

puts 'creating notifications'

puts "created #{Notification.all.count} notifications !"







