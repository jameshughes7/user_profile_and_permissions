require 'json'                                    #need this to be able to deal with json files

class User

  attr_accessor :email, :name, :permissions

  def initialize(email, name)
    @email = email
    @name = name
    @permissions = User.permissions_from_template       #@permissions will be assigned by calling class method
  end

  def self.permissions_from_template                    #class method
    file = File.read('user_permissions_template.json')  #read this in from file(which needs to be created still)
    JSON.load(file, symbolize_names: true)              #creates a JSON object from what is being read in
  end

  def save
    self_json = {email: @email, name: @name, permissions: @permissions}.to_json     #converts to a json object
    open('users.json', 'a') do |file|
    file.puts self_json
    end
  end
end
