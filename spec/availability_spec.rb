require 'availability'
require 'time'

describe Availability do

  let(:availability) {described_class.new}

  # context '#check_availability' do

    it "flags error if requested time is outside specified hours" do
      try_again = "Please select time within the hours of 8am and 3pm"
      expect{availability.check_availability("16:00")}.to raise_error(try_again)
    end
  # end

end
