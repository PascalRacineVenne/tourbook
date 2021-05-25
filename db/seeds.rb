

puts 'cleaning db'
Tour.destroy_all

puts 'creating tours'

5.times do
  Tour.new(
    name:
    artist_name:
    logo_url:
  )
end

puts "created #{Tour.all.count} tours!"

puts 'creating events'

Tour.all.each do |tour|
  10.times do
    event = Event.new(
      schedule: 'schedule#placeholder',
      date: rand()
      time:
    )
    event.tour = tour
  end
end

puts "created #{Event.all.count} events!"
