jwo = User.create username: "jwo"
astrid = User.create username: "astrid"

jwo.follow(astrid)

puts "JWO followees: #{jwo.followees.inspect}"

User.all.each do |user|
  5.times do
    user.tweets.create text: Faker::Hacker.say_something_smart
  end
end
