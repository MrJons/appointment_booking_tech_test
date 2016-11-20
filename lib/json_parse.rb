#Responsible for parsing passed in JSON file
require 'json'

class Json_parse

  def initialize(json_file)
    @json_file = json_file
    json = File.read(json_file)
    @data_hash = JSON.parse(json)
  end

  attr_reader :data_hash

  def write_json(json_file, altered_hash)
    File.write(json_file, JSON.pretty_generate(altered_hash))
  end

end
