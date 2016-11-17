#Checks time availability
require_relative 'json_parse'
require 'time'

class Availability

  FIRST_APPOINTMENT = "08:00"
  LAST_APPOINTMENT = "15:00"

  def initialize(requested_time = ARGV[0], slots = 'availability_slots.json')
    @slots = Json_parse.new(slots)
    @requested_time = Time.parse(requested_time)
    check_availability(@requested_time)
  end

  attr_reader :slots, :requested_time

  def check_availability(time)
    check_hours(time)
  end

  private

  def check_hours(time)
    if (time < time_parse(FIRST_APPOINTMENT) || time > time_parse(LAST_APPOINTMENT))
      fail "Please select time within the hours of 8am and 3pm"
    end
  end

  def time_parse(time)
    Time.parse(time)
  end


end

a = Availability.new
puts a.requested_time
