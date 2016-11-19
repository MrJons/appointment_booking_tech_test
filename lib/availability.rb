#Checks time availability
require_relative 'json_parse'
require 'time'

class Availability

  FIRST_APPOINTMENT = "08:00"
  LAST_APPOINTMENT = "15:00"

  def initialize(slots = 'availability_slots.json')
    @slots = Json_parse.new(slots)
    @confirmed_time = nil
  end

  def book_slot(time)
    check_hours(time)
    find_slot(time)
    feedback
  end

  private

  def check_hours(time)
    if (time < time_parse(FIRST_APPOINTMENT) || time > time_parse(LAST_APPOINTMENT))
      fail "Please select time within the hours of 8am and 3pm"
    end
  end

  def find_slot(time)
    @slots.data_hash['availability_slots'].each do |appointment|
      if time <= time_parse(appointment['time'])
        @confirmed_time = time_parse(appointment['time'])
        break
      end
    end
  end

  def feedback
    @confirmed_time != nil ? strigify_time(@confirmed_time) : no_availability
  end

  def no_availability
    fail "Sorry, there are no appointments on or after your chosen time"
  end

  def time_parse(time)
    Time.parse(time)
  end

  def strigify_time(time)
    time.to_s[11..15]
  end

end

a = Availability.new()
puts a.book_slot(Time.parse(ARGV[0].to_s))
