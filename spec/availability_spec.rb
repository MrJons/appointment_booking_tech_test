require 'availability'
require 'time'
require 'json'

#comment out Class/method calls at bottom of availability.rb file to avoid errors

describe Availability do

  let(:availability) {described_class.new('json_test_file.json')}

  after(:each) do
    IO.copy_stream('json_test_file_2.json', 'json_test_file.json')
  end

  it "flags error if requested time is outside specified hours" do
    try_again = "Please select time within the hours of 08:00 and 15:00"
    request = Time.parse("16:00")
    expect{availability.book_slot(request)}.to raise_error(try_again)
  end

  it "books requested slot when available" do
    request = Time.parse("08:00")
    expect(availability.book_slot(request)).to eq("08:00")
  end

  it "books next available slot when requested isn't available" do
    request = Time.parse("08:10")
    expect(availability.book_slot(request)).to eq("08:30")
  end

  it "returns error if no appointments are available" do
    no_apts = "Sorry, there are no appointments on or after your chosen time"
    request = Time.parse("09:00")
    expect{availability.book_slot(request)}.to raise_error(no_apts)
  end

  it "cannot book same appointment twice" do
    request_one = Time.parse("08:00")
    request_two = Time.parse("08:00")
    availability.book_slot(request_one)
    expect(availability.book_slot(request_two)).to eq("08:30")
  end
end
