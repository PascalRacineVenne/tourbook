require 'open-uri'

puts 'cleaning db'
Skill.destroy_all
Event.destroy_all
TourMember.destroy_all
User.destroy_all
Tour.destroy_all


puts 'creating users!'

users = [
  {email: 'holly@tbook.com', avatar: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617638724/rozdl8g3ybb6siqechzz.jpg'},
  {email: 'thomas@tbook.com', avatar: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1617625823/uxiisxmqoxwg6ltetmwt.jpg'},
  {email: 'pascal@tbook.com', avatar: 'https://avatars.githubusercontent.com/u/77168127?v=4'},
  {email: 'cathy@mgmt.com', avatar: 'https://www.evidentlycochrane.net/wp-content/uploads/2019/05/mature-woman-on-phone-e1559294112725.jpg'},
  {email: 'freddy@tunez.com', avatar: "https://www.biography.com/.image/ar_4:3%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTc5OTQ5ODk3MTMzMzM1ODk2/gettyimages-1176816280.jpg"}
]

count = 0

users.each do |user|
  u = User.new(
    email: user[:email],
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
  { name: 'Hairless Heroes', artist_name: 'Steph Pas', logo: 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/53195d3d-df08-48aa-98e8-f34bc81a9980/d4xmo4x-10fe2193-2098-4ce1-8c98-5feec94c05f6.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzUzMTk1ZDNkLWRmMDgtNDhhYS05OGU4LWYzNGJjODFhOTk4MFwvZDR4bW80eC0xMGZlMjE5My0yMDk4LTRjZTEtOGM5OC01ZmVlYzk0YzA1ZjYuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.P8fsS9P9Hn-jVMbK5lu7BQPi39vpxhsLeaxlMScz5go'},
  { name: 'Silence Amplified', artist_name: 'Thomas & Alex', logo: 'https://media.istockphoto.com/photos/whisper-picture-id139524150?k=6&m=139524150&s=612x612&w=0&h=ccXVWhxVpkxd6THkZ_z4OakWJLQjtMpIixUQkNcAJWU='},
  { name: 'Prince Curly', artist_name: 'Chrissy B', logo: 'https://www.byrdie.com/thmb/FRZ_vGcwUhfl-631cd0zWU1ovpk=/500x350/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-924890330-a46e282977ff4373bac4732736df7782.jpg'},
  { name: 'Bros & Brews', artist_name: 'Cloton Laundry', logo: 'https://images.saymedia-content.com/.image/t_share/MTc0MzU0ODM0NjQ2OTAyMTIw/ten-wonderful-uses-for-beer-besides-drinking-it.jpg'},
  { name: 'Moto Sounds', artist_name: 'Daniel Bronzeman', logo: 'https://i.pinimg.com/originals/5c/56/18/5c561846c00cc8b76229e290daca79f1.jpg'},
  { name: 'French Connexion', artist_name: 'BT & jean-jean', logo: 'https://www.fluentu.com/blog/french/wp-content/uploads/sites/3/2014/01/casual-everyday-french-phrases1.jpg'},
  { name: 'Man in Love', artist_name: 'Smooth L', logo: 'https://nafme.org/wp-content/uploads/2016/03/themacx-iStock-Thinkstock.jpg'},
  { name: 'Feminist Wave', artist_name: 'A-M Knows', logo: 'https://assets.vogue.com/photos/5891224258aa89a00d5417c9/master/pass/07-feminist-posters-see-red-womens-workshop.jpg'},
  { name: 'Wagon Girls', artist_name: 'Camille & Filles', logo: 'https://i.ytimg.com/vi/6oQv1tui-k8/maxresdefault.jpg'}
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
      schedule: 'schedule#placeholder',
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

puts "created #{Skill.all.count} skills!"

puts 'creating tour members'

User.all.each do |user|
  tours_array = Tour.all.to_a.clone
  rand(3...Tour.all.count).times do
    tm = TourMember.new(
      job_title: Skill.pluck(:name).sample
    )
    tm.user = user
    tour = tours_array.sample
    tm.tour = tour
    tours_array.delete(tour)
    tm.save!
  end
end

puts "created #{TourMember.all.count} tour members !"
