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
users_data = [
  {:username => "bvsatyaram", :password => "i<3Angel"},
  {:username => "towel", :password => "whynOt"},
  {:username => "pratul", :password => "Askme"},
  {:username => "iqvol", :password => "rockstAr"}
]
users_data.each do |data|
  User.find_or_create_by_username(
    :username => data[:username],
    :password => data[:password],
    :password_confirmation => data[:password]
  )
  dot
end

# Done
newline
print "Done"
newline