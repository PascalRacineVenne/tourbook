require 'open-uri'

puts 'cleaning db'
Skill.destroy_all
Event.destroy_all
TourMember.destroy_all
User.destroy_all
Tour.destroy_all
Broadcast.destroy_all
Notification.destroy_all


puts 'creating users!'

users = [
  {full_name: 'Alex P', nickname: 'Alex', description: '', phone: '5145556316', email: 'alex@silentboys.com', avatar: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1620009393/elpxfvm9mhxsxqcjm1l2.jpg'},
  {full_name: 'Anne-Marie Nault', nickname: 'A-M', description: '', phone: '5145556298', email: 'a-m@muzak.com', avatar: 'https://avatars.githubusercontent.com/u/77209045?v=4'},
  {full_name: 'Steph Laf', nickname: 'Steph', description: 'happy to be around, playing music so i can feed my cat -- stay humble', phone: '5145556214', email: 'steph@ilovemycat.com', avatar: 'https://avatars.githubusercontent.com/u/37821714?v=4'},
  {full_name: 'Cathy G', nickname: 'Cathy', description: "pumped to be here - let's go!", phone: '5145559846', email: 'cathy@mgmt.com', avatar: 'https://www.evidentlycochrane.net/wp-content/uploads/2019/05/mature-woman-on-phone-e1559294112725.jpg'},
  {full_name: 'Freddy M', nickname: 'Freddy', description: 'live love drum', phone: '5145551278', email: 'freddy@tunez.com', avatar: "https://www.biography.com/.image/ar_4:3%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTc5OTQ5ODk3MTMzMzM1ODk2/gettyimages-1176816280.jpg"}
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
  file = URI.open(user[:avatar])
  u.avatar.attach(io: file, filename: "avatar.jpg", content_type: 'image/png')
  u.save!
  count += 1
end

puts "created #{User.all.count} users!"

puts 'creating tours'

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

tours.each do |tour|
  t = Tour.new(
    name: tour[:name],
    artist_name: tour[:artist_name],
  )
  file = URI.open(tour[:logo])
  t.logo.attach(io: file, filename: "logo.jpg", content_type: 'image/png')
  t.save!
end

puts "created #{Tour.all.count} tours!"

puts 'creating events'

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

Tour.all.each do |tour|
  10.times do
    venue = venues.sample
    event = Event.new(
      schedule: '',
      show_start_at: rand(30..60).days.from_now.beginning_of_day + rand(18..22).hours,
      venue: venue[:venue],
      city: venue[:city]
    )
    event.tour = tour
    event.save!
  end
end
puts "created #{Event.all.count} events!"

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

puts 'creating tour members'

tour_members = [
  {user: User.find_by(email: 'freddy@tunez.com'), event: Tour.find_by(name: 'Moto Sounds').events.first, job_title: 'Drummer', administrator: false},
  {user: User.find_by(email: 'freddy@tunez.com'), event: Tour.find_by(name: 'Man in Love').events.first, job_title: 'Drummer', administrator: false},
  {user: User.find_by(email: 'freddy@tunez.com'), event: Tour.find_by(name: 'Hairless Heroes').events.first, job_title: 'Drummer', administrator: false},
  {user: User.find_by(email: 'steph@ilovemycat.com'), event: Tour.find_by(name: 'Hairless Heroes').events.first, job_title: 'Singer', administrator: false},
  {user: User.find_by(email: 'a-m@muzak.com'), event: Tour.find_by(name: 'Hairless Heroes').events.first, job_title: 'Sound Tech', administrator: true},
  {user: User.find_by(email: 'cathy@mgmt.com'), event: Tour.find_by(name: 'Man in Love').events.first, job_title: 'Manager', administrator: true},
  {user: User.find_by(email: 'cathy@mgmt.com'), event: Tour.find_by(name: 'Silence Amplified').events.first, job_title: 'Sound Tech', administrator: false},
  # {user: User.find_by(email:), tour: Tour.find_by(name:), job_title: , administrator: }
]

tour_members.each do |tm|
  TourMember.create!(
    user: tm[:user],
    event: tm[:event],
    job_title: tm[:job_title],
    administrator: tm[:administrator]
  )
end

# Event.all.each do |event|
# end

puts "created #{TourMember.all.count} tour members !"

puts 'creating broadcasts'

puts "created #{Broadcast.all.count} broadcasts !"

puts 'creating notifications'

puts "created #{Notification.all.count} notifications !"







