def say_seeding(msg)
  newline
  print "*** Seeding #{msg}"
end

def newline
  print_and_flush("\n")
end

def dot
  print_and_flush(".")
end

def print_and_flush(msg)
  print msg
  $stdout.flush
end

# +Quiz+
say_seeding(Quiz.name)
titles = ["First Set", "Second Set", "Third Set", "Fourth Set"]
titles.each do |title|
  Quiz.find_or_create_by_title(title)
  dot
end

# +User+
say_seeding(User.name)
#users_data = [
#  {:username => "bvsatyaram", :password => "monkey"},
#  {:username => "iqcoord", :password => "whynOt"},
#  {:username => "iqvol", :password => "rockstAr"}
#]
#users_data.each do |data|
#  User.find_or_create_by_username(
#    :username => data[:username],
#    :password => data[:password],
#    :password_confirmation => data[:password]
#  )
#  dot
#end

registered_users = File.new(RAILS_ROOT + "/db/passwords.txt", "r")
while (line = registered_users.gets)
  user_data = line.split(",")
  user_count = User.count
  User.find_or_create_by_username(
    :username => user_data[0],
    :password => user_data[1],
    :password_confirmation => user_data[1]
  )
  if user_count == User.count && !User.find_by_username(user_data[0])
    puts "\nInvalid user: #{user_data[0]}\n"
    user = User.new(
      :username => user_data[0],
      :password => user_data[1],
      :password_confirmation => user_data[1]
    )
    user.save(false)
    puts "Created user: #{user_data[0]} without validations\n"
  else
    dot
  end
end
registered_users.close

# Done
newline
print "Done"
newline