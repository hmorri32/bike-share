class Station < ActiveRecord::Base
  validates  :name,
             :dock_count,
             :city_id,
             :installation_date,
             :lat,
             :lng,
              presence: true

  belongs_to :city
  belongs_to :trip

  # format date method as before save action

  def self.station_count
    count
  end

  def self.average_bikes
    average(:dock_count).to_i
  end

  def self.max_bikes_per_station
    maximum :dock_count
  end

  def self.min_bikes_per_station
    minimum :dock_count
  end

  def self.stations_with_most_bikes
    where(dock_count: max_bikes_per_station).pluck(:name).join(', ')
  end

  def self.stations_with_least_bikes
    where(dock_count: min_bikes_per_station).pluck(:name).join(', ')
  end

  def self.newest_station
    max     = Station.maximum :installation_date
    station = Station.find_by  installation_date: max
    # FIX THIS
    "#{station.name}"
  end

  def self.oldest_station
    min     = Station.minimum :installation_date
    station = Station.find_by  installation_date: min
    # also this.
    "#{station.name}"
  end
end
