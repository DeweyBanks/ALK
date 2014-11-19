class Course < ActiveRecord::Base
  extend SimpleCalendar
  has_calendar
  has_many :kids
end
