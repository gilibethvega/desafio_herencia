class Appointment
  attr_accessor :location, :purpose, :hour, :min
  def initialize(location, purpose, hour, min)
    raise ArgumentError, 'min is not an Integer' if min.class !=Integer
    raise ArgumentError, 'hour is not an Integer' if hour.class !=Integer
    raise ArgumentError, 'location is not an String' if location.class !=String
    raise ArgumentError, 'purpose is not an String' if purpose.class !=String
    @location = location
    @purpose = purpose
    @hour = hour
    @min = min
  end
end 

class MonthlyAppointment < Appointment
  attr_accessor :day
  def initialize(location, purpose, hour, min, day)
    raise ArgumentError, 'day is not an Integer' if day.class !=Integer
    super(location, purpose, hour, min)
    @day = day
  end
  def occurs_on?(day)
    @day == day
  end
  def to_s
    puts "Reunión mensual en #{self.location} sobre #{self.purpose} el día #{self.day} a la(s) #{self.hour}:#{self.min}"
  end
end

class DailyAppointment < Appointment
  def occurs_on?(hour, min)
    @hour == hour && @min == min
  end
  def to_s
    puts "Reunión diaria en #{self.location} sobre #{self.purpose} a la(s) #{self.hour}:#{self.min}"
  end
end

class OneTimeAppointment < Appointment
  attr_accessor :day, :month, :year
  def initialize(location, purpose, hour, min, day, month, year)
    raise ArgumentError, 'day is not an Integer' if day.class !=Integer
    raise ArgumentError, 'month is not an Integer' if month.class !=Integer
    raise ArgumentError, 'year is not an Integer' if year.class !=Integer
    super(location, purpose, hour, min)
    @day = day
    @month = month
    @year = year
  end
  def occurs_on?(day, month, year)
    @day == day && @month == month && @year == year
  end
  def to_s
    puts "Reunión única en #{self.location} sobre #{self.purpose} el #{self.day}/#{self.month}/#{self.year} a la(s) #{self.hour}:#{self.min}"
  end
end


puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)