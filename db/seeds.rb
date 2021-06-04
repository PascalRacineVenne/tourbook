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
    description: 'happy to be around, playing music and sending good vibes -- stay humble',
    phone: '5145556214', email: 'steph@tunez.com',
    avatar: 'https://avatars.githubusercontent.com/u/37821714?v=4' },
  { skills: ['Manager', 'Sound Tech'], full_name: 'Cathy G', nickname: 'Cathy', description: "pumped to be here - let's go!",
    phone: '5145559846', email: 'cathy@mgmt.com',
    avatar: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617638724/rozdl8g3ybb6siqechzz.jpg' },
  { skills: ['Vocals', 'Drums', 'Bass', 'Electric Guitar', 'Acoustic Guitar'],
    full_name: 'Freddy M', nickname: 'Freddy', description: 'live love drum',
    phone: '5145551278', email: 'freddy@tunez.com',
    avatar: "https://avatars.githubusercontent.com/u/77168127?v=4" },
  { skills: ['Piano', 'Bass', 'Vocals'], full_name: 'Patrick Watson', nickname: 'Patty', description: 'i <3 music',
    phone: '5145551278', email: 'patrick@wagon.com',
    avatar: "https://townsquare.media/site/838/files/2019/09/patrick-watson.jpg?w=980&q=75" },
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

# pp random_users

puts "created #{User.all.count} users!"

puts 'creating tours, events & tour members'

tours = [
  { name: 'Quand la nuit tombe', artist_name: 'Louis Jean Cormier', logo: 'https://lecanalauditif.ca/wp-content/uploads/2020/02/louis-jean-cormier-quand-la-nuit-tombe.jpg'},
  { name: 'Melody Noir', artist_name: 'Patrick Watson', logo: 'https://www.dominomusic.com/res/0edZ/600_/Patrick-Watson_Ilenia-Tesoro_Aug2019_04_color_medres.jpg'},
  { name: 'After Hours', artist_name: 'The Weeknd', logo: 'https://i.guim.co.uk/img/media/8b1b3eaeca71621192646fdd9e94536dc7293aa4/0_579_8688_5213/master/8688.jpg?width=1200&quality=85&auto=format&fit=max&s=4e2a76e91cd2bbb0411923f347752c4b'},
  { name: 'Miss Colombia', artist_name: 'Lido Pimienta', logo: 'https://media.pitchfork.com/photos/5e988b3b2eea7f00096658df/2:1/w_1000/Miss%20Colombia_Lido%20Pimienta.jpg'},
  { name: 'Rumours & Doubts', artist_name: 'Flara K', logo: 'https://d1z39p6l75vw79.cloudfront.net/u/312659/85227f11b6a4985e2102ed3d405bcd923be35709/original/img-1724.jpg/!!/b%3AW1sicmVzaXplIiwxODAwXSxbIm1heCJdLFsid2UiXV0%3D/meta%3AeyJzcmNCdWNrZXQiOiJjb250ZW50LnNpdGV6b29nbGUuY29tIn0%3D.jpg'},
  { name: 'Time Well Wasted', artist_name: 'Lisa Leblanc', logo: 'https://f4.bcbits.com/img/a2485628065_16.jpg'},
  { name: 'Congratulations', artist_name: 'Maya Malkin', logo: 'https://www.wearegoingsolo.com/wp-content/uploads/2021/04/Maya-Malkin-Congratulations_Cover_by_Mrs_Makaveli_1290_961_90.jpeg'},
  { name: 'Jour 2', artist_name: 'Hildegard', logo: 'https://images.squarespace-cdn.com/content/5622cff4e4b0a49a91cfb980/1614780185355-ZYPP3PJCOW3BDZSGFZZ3/H_web1_JulesMoskovtchenko.jpg?content-type=image%2Fjpeg'}
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

  if tour[:name] == 'Melody Noir'
    main_event = Event.create!(
      schedule: "1:00PM - Load-In<br>
        3:00PM - Soundcheck<br>
        6:00PM - Dinner<br>
        9:00PM - Showcall<br>
        10:00PM - Showtime",      show_start_at: DateTime.new(2021, 7, 27, 22, 00, 0),
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
      user: User.find_by(email: 'patrick@wagon.com'),
      event: main_event,
      job_title: 'Vocals',
    )
    TourMember.create!(
      user: User.find_by(email: 'baptiste@wagon.com'),
      event: main_event,
      job_title: 'Drums',
    )
    TourMember.create!(
      user: User.find_by(email: 'daniel@wagon.com'),
      event: main_event,
      job_title: 'Bass',
    )
    TourMember.create!(
      user: User.find_by(email: 'a-m@muzak.com'),
      event: main_event,
      job_title: 'Sound Tech',
    )
    TourMember.create!(
      user: User.find_by(email: 'luis@wagon.com'),
      event: main_event,
      job_title: 'Electric Guitar',
    )
  end

    puts "Tour #{Tour.all.count} created!"
  10.times do
    venue = venues.sample

    event = Event.create!(
      schedule: "1:00PM - Load-In<br>
        3:00PM - Soundcheck<br>
        6:00PM - Dinner<br>
        9:00PM - Showcall<br>
        10:00PM - Showtime",
      show_start_at: rand(30..60).days.from_now.beginning_of_day + rand(18..22).hours,
      venue: venue[:venue],
      city: venue[:city],
      tour: t
    )
    if tour[:name] == 'Melody Noir'
      # puts 'creating Melody Noir'
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
    elsif tour[:name] == 'Time Well Wasted'
      # puts 'creating Moto Sounds'
      TourMember.create!(
        user: User.find_by(email: 'freddy@tunez.com'),
        event: event,
        job_title: 'Drums',
      )
    elsif tour[:name] == 'Jour 2'
      # puts 'creating Moto Sounds'
      TourMember.create!(
        user: User.find_by(email: 'freddy@tunez.com'),
        event: event,
        job_title: 'Drums',
      )
    elsif tour[:name] == 'After Hours'
      # puts 'creating Hairless Heroes'
      TourMember.create!(
        user: User.find_by(email: 'freddy@tunez.com'),
        event: event,
        job_title: 'Drums',
      )
      TourMember.create!(
        user: User.find_by(email: 'cathy@mgmt.com'),
        event: event,
        job_title: 'Manager',
        administrator: true
      )
    elsif tour[:name] == 'Quand la nuit tombe'
      TourMember.create!(
        user: User.find_by(email: 'cathy@mgmt.com'),
        event: event,
        job_title: 'Manager',
        administrator: true
      )
    elsif tour[:name] == 'Miss Colombia'
      TourMember.create!(
        user: User.find_by(email: 'cathy@mgmt.com'),
        event: event,
        job_title: 'Manager',
        administrator: true
      )
    elsif tour[:name] == 'Rumours & Doubts'
      TourMember.create!(
        user: User.find_by(email: 'cathy@mgmt.com'),
        event: event,
        job_title: 'Manager',
        administrator: true
      )
    elsif tour[:name] == 'Congratulations'
      TourMember.create!(
        user: User.find_by(email: 'cathy@mgmt.com'),
        event: event,
        job_title: 'Manager',
        administrator: true
      )
    else
      # puts 'creating another tour'
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
    puts "Tour #{Tour.all.count} events created!"
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
#   {user: User.find_by(email: 'freddy@tunez.com'), event: Tour.find_by(name: 'Melody Noir').events.first, job_title: 'Drums', administrator: false},
#   {user: User.find_by(email: 'freddy@tunez.com'), event: Tour.find_by(name: 'Hairless Heroes').events.first, job_title: 'Drums', administrator: false},
#   {user: User.find_by(email: 'steph@ilovemycat.com'), event: Tour.find_by(name: 'Hairless Heroes').events.first, job_title: 'Singer', administrator: false},
#   {user: User.find_by(email: 'a-m@muzak.com'), event: Tour.find_by(name: 'Hairless Heroes').events.first, job_title: 'Sound Tech', administrator: true},
#   {user: User.find_by(email: 'cathy@mgmt.com'), event: Tour.find_by(name: 'Melody Noir').events.first, job_title: 'Manager', administrator: true},
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







