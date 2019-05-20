require_relative 'super_useful'

puts "'five' == #{convert_to_int('five')}"

feed_me_a_fruit

begin  
  sam = BestFriend.new('frida', 5, 'swimming')
rescue YearsKnownError => exception
  puts "Haven't known eachother to be bestfriends"

rescue NameError => e
  puts "Not long enough name. Give us a name"
rescue PastTimeError => e
  puts "Give a past time"
end
  
  sam.talk_about_friendship
  sam.do_friendstuff
  sam.give_friendship_bracelet
