class Course < ActiveRecord::Base
  attr_accesible :kid_id
  extend SimpleCalendar
  has_calendar
  has_many :kids, through: :courses_kids
end
