require_relative "./../app/models/city"
require_relative "./../app/models/station"
require_relative "./../app/models/trip"
require_relative "./../app/models/condition"
require 'csv'
require 'smarter_csv'

# if shit gets real => rake db:drop db:create db:migrate db:seed

# destroy_all pre seed

CSV.foreach('./db/csv/station.csv', headers: true, header_converters: :symbol) do |row|
    new_city          = City.find_or_create_by(name: row[:city])
    installation_date = Date.strptime(row[:installation_date], "%m/%d/%Y")

    Station.create(name:              row[:name],
                   lat:               row[:lat],
                   lng:               row[:long],
                   dock_count:        row[:dock_count],
                   city_id:           new_city.id,
                   installation_date: installation_date)
end

SmarterCSV.process('db/csv/trip.csv').each do |row|
  start_station = Station.find_or_create_by(name: row[:start_station_name])
  end_station   = Station.find_or_create_by(name: row[:end_station_name])
  start_time    = row[:start_date].split(' ')[-1]
  start_date    = Date.strptime(row[:start_date], "%m/%d/%Y")
  end_date      = Date.strptime(row[:end_date], "%m/%d/%Y")
  end_time      = row[:end_date].split(' ')[-1]

  Trip.create(duration:          row[:duration],
              start_date:        start_date,
              start_time:        start_time,
              start_station_id:  start_station.id,
              end_date:          end_date,
              end_time:          end_time,
              end_station_id:    end_station.id,
              bike_id:           row[:bike_id],
              subscription_type: row[:subscription_type],
              zip_code:          row[:zip_code])
end

# Condition.destroy_all

CSV.foreach('./db/csv/weather.csv', headers: true, header_converters: :symbol) do |row|

  if row[:zip_code] == '94107'
    Condition.create(date:           row[:date],
                   mean_temperature: row[:mean_temperature_f],
                   max_temperature:  row[:max_temperature_f],
                   min_temperature:  row[:min_temperature_f],
                   mean_humidity:    row[:mean_humidity],
                   mean_visibility:  row[:mean_visibility_miles],
                   mean_wind_speed:  row[:mean_wind_speed_mph],
                   precipitation:    row[:precipitation_inches])
  end
end