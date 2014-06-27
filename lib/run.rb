require 'lookup.rb'
require 'target.rb'

emails = [Target.new("Peter Wong", "alphasights.com"),
          Target.new("Craig Silverstein", "google.com"),
          Target.new("Steve Wozniak", "apple.com"),
          Target.new("Barack Obama", "whitehouse.gov")
          ]

puts "\n"
puts "Email Predictions"
puts "-----------------"
puts "\n"

emails.each do |person|
  check = Lookup.new(person)
  puts "#{check.target.name}: #{check.check_records}"
end

puts "\n"
