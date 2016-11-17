require 'json_parse'
# require_relative 'json_test_file'

describe Json_parse do

  parsed_slots = {"availability_slots"=>[{"time" => "08:00:00",
                                          "slot_size" => 10,
                                          "doctor_id" => 1}]}

  it "parses a JSON file into mutable data type" do
    @slots = Json_parse.new('json_test_file.json')
    expect(@slots.data_hash).to eq(parsed_slots)
  end

end
