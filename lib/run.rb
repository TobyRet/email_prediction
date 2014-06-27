require 'lookup.rb'
require 'target.rb'

emails = [Target.new("Peter Wong", "alphasights.com"),
          Target.new("Craig Silverstein", "google.com"),
          Target.new("Steve Wozniak", "apple.com"),
          ]

puts "Email Predictions"
puts "-----------------"

emails.each do |person|
  check = Lookup.new(person)
  puts "#{check.target.name}: #{check.format_email}"
end
