require 'json_parse'
# require_relative 'json_test_file'

describe Json_parse do

  let(:json_parse) {described_class.new('json_test_file.json')}

  after(:each) do
    IO.copy_stream('json_test_file_2.json', 'json_test_file.json')
  end

  parsed_slots = {"availability_slots"=>[{"time" => "08:00:00", "slot_size" => 10,
                  "doctor_id" => 1}, {"time"=>"08:30:00", "slot_size"=>10,
                  "doctor_id"=>1}]}

  amended_slots = {"availability_slots"=>[{"time" => "08:00:00", "slot_size" => 10,
                  "doctor_id" => 1}]}

  it "parses a JSON file into mutable data type" do
    expect(json_parse.data_hash).to eq(parsed_slots)
  end

  it "alters json file to accomodate changes to availability after bookings" do
    json_parse.write_json('json_test_file.json', amended_slots)
    expect(File.read('json_test_file.json')).to eq("{\n  \"availability_slots\": [\n    {\n      \"time\": \"08:00:00\",\n      \"slot_size\": 10,\n      \"doctor_id\": 1\n    }\n  ]\n}")
  end

end
