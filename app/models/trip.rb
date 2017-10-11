class Trip < ActiveRecord::Base
  validates :duration,
            :start_date,
            :start_station_id,
            :end_date,
            :end_station_id,
            :bike_id,
            :subscription_type,
            :zip_code,
             presence: true

  belongs_to :start_station, :class_name => 'Station', :foreign_key => 'start_station_id'
  belongs_to :end_station,   :class_name => 'Station', :foreign_key => 'end_station_id'

  def self.average_duration
    average(:duration).floor / 60
  end

  def self.longest_ride
    maximum(:duration).floor / 60
  end

  def self.shortest_ride
    minimum(:duration).floor / 60
  end

  def self.station_most_starting_rides
    station = group(:start_station_id).order("count_id DESC").count(:id).first[0]
    Station.find(station).name
  end

  def self.station_most_ending_rides
    station = group(:end_station_id).order("count_id DESC").count(:id).first[0]
    Station.find(station).name
  end

  def self.monthly_rides
    group("DATE_TRUNC('month', start_date)").order("DATE_TRUNC('month', start_date) ASC").count(:start_date)
  end

  def self.yearly_rides
    group("DATE_TRUNC('year', start_date)").order("DATE_TRUNC('year', start_date) ASC").count(:start_date)
  end

  def self.parse_monthly_rides
    monthly_rides.map { |date, trips|[Date::MONTHNAMES[date.month], date.year, trips] }
  end

  def self.ridden_bikes
    group(:bike_id).order("count_id DESC").count(:id)
  end

  def self.most_ridden_bike
    ridden_bikes.first
  end

  def self.least_ridden_bike
    ridden_bikes.min_by { |bike, count| count }
  end

  def self.subscription_breakdown
    group(:subscription_type).count("id")
  end

  def self.subscriber_count
    subscription_breakdown.values.last
  end

  def self.customer_count
    subscription_breakdown.values.first
  end

  def self.subscriber_percentage
    ((subscriber_count / count.to_f) * 100).floor(2)
  end

  def self.customer_percentage
    ((customer_count / count.to_f) * 100).floor(2)
  end

  def self.date_with_highest_trips
    group(:start_date).order("count_id DESC").count(:id).first
  end

  def self.date_with_lowest_trips
    group(:start_date).order("count_id ASC").count(:id).first
  end

  def self.start_station(id)
    where(start_station_id: id)
  end

  def self.rides_started(id)
    start_station(id).count
  end

  def self.rides_ended(id)
    where(end_station_id: id).count
  end

  def self.frequent_destination(id)
    destination = start_station(id).group(:end_station_id).order("count_id DESC").count(:id).first[0]
    Station.find(destination).name
  end

  def self.origin_destination(id)
    destination = start_station(id).group(:start_station_id).order("count_id DESC").count(:id).first[0]
    Station.find(destination).name
  end

  def self.busiest_date(id)
    start_station(id).group(:start_date).order("count(start_date) DESC").count(:start_date).first[0]
  end

  def self.frequent_zipcode(id)
    start_station(id).group(:zip_code).order("count(zip_code) DESC").count(:zip_code).first[0]
  end

  def self.frequent_bike(id)
    start_station(id).group(:bike_id).order("count(bike_id) DESC").count(:bike_id).first[0]
  end
end
