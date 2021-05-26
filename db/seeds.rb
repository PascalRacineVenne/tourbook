puts 'cleaning db'
Event.destroy_all
TourMember.destroy_all
User.destroy_all
Tour.destroy_all


puts 'creating users!'

users = [
  'holly@tbook.com',
  'thomas@tbook.com',
  'pascal@tbook.com'
]

count = 0

3.times do
  User.create!(
    email: users[count],
    password: 123456
  )
  count += 1
end

puts "created #{User.all.count} users!"

puts 'creating tours'

tours = [
  { name: 'Hairless Heroes', artist_name: 'Steph Pas', logo_url: 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/53195d3d-df08-48aa-98e8-f34bc81a9980/d4xmo4x-10fe2193-2098-4ce1-8c98-5feec94c05f6.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzUzMTk1ZDNkLWRmMDgtNDhhYS05OGU4LWYzNGJjODFhOTk4MFwvZDR4bW80eC0xMGZlMjE5My0yMDk4LTRjZTEtOGM5OC01ZmVlYzk0YzA1ZjYuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.P8fsS9P9Hn-jVMbK5lu7BQPi39vpxhsLeaxlMScz5go'},
  { name: 'Silence Amplified', artist_name: 'Thomas & Alex', logo_url: 'https://p2.piqsels.com/preview/669/771/726/woman-finger-whisper-lip.jpg'},
  { name: 'Prince Curly', artist_name: 'Chrissy B', logo_url: 'https://www.byrdie.com/thmb/FRZ_vGcwUhfl-631cd0zWU1ovpk=/500x350/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-924890330-a46e282977ff4373bac4732736df7782.jpg'},
  { name: 'Bros & Brews', artist_name: 'Cloton Laundry', logo_url: 'https://images.saymedia-content.com/.image/t_share/MTc0MzU0ODM0NjQ2OTAyMTIw/ten-wonderful-uses-for-beer-besides-drinking-it.jpg'},
  { name: 'Moto Sounds', artist_name: 'Daniel Bronzeman', logo_url: 'https://wp.bikebandit.com/wp-content/uploads/2019/08/Depositphotos_54770905_l-2015-1024x684.jpg'},
  { name: 'French Connexion', artist_name: 'BT & jean-jean', logo_url: 'https://www.fluentu.com/blog/french/wp-content/uploads/sites/3/2014/01/casual-everyday-french-phrases1.jpg'},
  { name: 'Man in Love', artist_name: 'Smooth L', logo_url: 'https://nafme.org/wp-content/uploads/2016/03/themacx-iStock-Thinkstock.jpg'},
  { name: 'Feminist Wave', artist_name: 'A-M Knows', logo_url: 'https://assets.vogue.com/photos/5891224258aa89a00d5417c9/master/pass/07-feminist-posters-see-red-womens-workshop.jpg'},
  { name: 'Wagon Girls', artist_name: 'Camille & Filles', logo_url: 'https://i.ytimg.com/vi/6oQv1tui-k8/maxresdefault.jpg'}
]

tours.each do |tour|
  Tour.create!(
    name: tour[:name],
    artist_name: tour[:artist_name],
    # logo_url: tour[:logo_url]
  )
end

puts "created #{Tour.all.count} tours!"

puts 'creating events'

Tour.all.each do |tour|
  10.times do
    event = Event.new(
      schedule: 'schedule#placeholder',
      show_start_at: rand(30..60).days.from_now.beginning_of_day + rand(18..22).hours
    )
    event.tour = tour
    event.save!
  end
end

puts 'creating tour members'

10.times do
  tour_member = TourMember.new
  tour_member.user = User.all.sample
  tour_member.tour = Tour.all.sample
  tour_member.save!
end

puts "created #{TourMember.all.count} tour members !"

puts "created #{Event.all.count} events!"

puts 'creating skills'

Skill.create(name: 'French', detail: 'Montreal')
Skill.create(name: 'English', detail: 'Toronto')
Skill.create(name: 'Mandarin', detail: 'Shanghai')

puts "created #{Skill.all.count} skills!"
