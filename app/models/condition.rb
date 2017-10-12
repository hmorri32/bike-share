class Condition < ActiveRecord::Base
  self.primary_key = "date"

  validates :date,
            :max_temperature,
            :mean_temperature,
            :min_temperature,
            :mean_humidity,
            :mean_visibility,
            :mean_wind_speed,
            :precipitation,
             presence: true

  has_many :trips, :foreign_key => :start_date

  def self.days_within_high_temperature(range)
    where(max_temperature: [range..range + 9])
  end

  def self.days_within_precipitation(range)
    where(precipitation: [range..range + 0.49])
  end

  def self.days_within_wind(range)
    where(mean_wind_speed: [range..range + 3])
  end

  def self.days_within_visibility(range)
    where(mean_visibility: [range..range + 3])
  end

  def self.rides_by_day(range)
    range.joins(:trips).group(:date).count
  end

  def self.lowest_number_of_rides_by_temp(range)
    all_rides_within_temp(range).values.min
  end

  def self.average_number_of_rides_by_temp(range)
    average(all_rides_within_temp(range).values)
  end

  def self.highest_number_of_rides_by_temp(range)
    all_rides_within_temp(range).values.max
  end

  def self.lowest_number_of_rides_by_precipitation(range)
    all_rides_within_precipitation(range).values.min
  end

  def self.average_number_of_rides_by_precipitation(range)
    average(all_rides_within_precipitation(range).values)
  end

  def self.highest_number_of_rides_by_precipitation(range)
    all_rides_within_precipitation(range).values.max
  end

  def self.lowest_number_of_rides_by_wind(range)
    all_rides_within_wind_speed(range).values.min
  end

  def self.average_number_of_rides_by_wind(range)
    average(all_rides_within_wind_speed(range).values)
  end

  def self.highest_number_of_rides_by_wind(range)
    all_rides_within_wind_speed(range).values.max
  end

  def self.lowest_number_of_rides_by_visibility(range)
    all_rides_within_visibility(range).values.min
  end

  def self.average_number_of_rides_by_visibility(range)
    average(all_rides_within_visibility(range).values)
  end

  def self.highest_number_of_rides_by_visibility(range)
    all_rides_within_visibility(range).values.max
  end

  def self.all_rides_within_precipitation(range)
    rides_by_day(days_within_precipitation(range))
  end

  def self.all_rides_within_wind_speed(range)
    rides_by_day(days_within_wind(range))
  end

  def self.all_rides_within_visibility(range)
    rides_by_day(days_within_visibility(range))
  end

  def self.all_rides_within_temp(range)
    rides_by_day(days_within_high_temperature(range))
  end

  def self.average(collection)
    (collection.sum / collection.length.to_f).round(2)
  end

  def self.weather_on_day_with_highest_rides
    date_array = rides_by_day(all_dates_range).max_by { |day_array| day_array[1] }
    where(date: date_array[0])
  end

  def self.weather_on_day_with_lowest_rides
    date_array = rides_by_day(all_dates_range).min_by { |day_array| day_array[1] }
    where(date: date_array[0])
  end

  def self.all_dates_range
    where(date: minimum(:date)..maximum(:date))
  end
end


# Create a weather dashboard available at /weather-dashboard that includes the following information:

# Breakout of average number of rides # highest number of rides

# lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees)

# Breakout of average number of rides, highest number of rides, and lowest number of rides on days with precipitation in half-inch increments.

# Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean wind speeds in four mile increments.

# Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean visibility in miles in four mile increments.


# Add the following information to your trip dashboard:

# Weather on the day with the highest rides.

# Weather on the day with the lowest rides.
