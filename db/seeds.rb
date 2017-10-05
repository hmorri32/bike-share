require_relative "./../app/models/city"
require_relative "./../app/models/station"
require 'csv'


CSV.foreach('./db/csv/station.csv', headers: true, header_converters: :symbol) do |station|
  if !station[:installation_date] == ''
    new_city = City.create(name: station[:city])
    station[:installation_date] = Date.strptime(station["installation_date"], "%m/%d/%Y"),
    new_station = Station.new({name: station[:name],
                              dock_count: station[:dock_count],
                              installation_date: station[:installation_date]})
    new_station.city = new_city if !new_city.id.nil?
    new_station.city = City.find_by(name: new_city.name) if new_city.id.nil?
    new_station.save
  end
end
