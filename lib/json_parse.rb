#Responsible for parsing passed in JSON file
require 'json'

class Json_parse

  def initialize(json_file)
    json = File.read(json_file)
    @data_hash = JSON.parse(json)
  end

  attr_reader :data_hash

end
