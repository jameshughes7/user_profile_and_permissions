require 'pp'          #require pretty print
require_relative 'user'

user = User.new("joebloggs@example.com", "Joe Bloggs")

pp user

user.save
