RSpec.context Condition do
  describe 'Class Methods' do
    before do
      ['SF', 'Santa Cruz', 'Ocean Beach'].each { |city| City.create(name: city) }
      sf, santa_cruz, ocean_beach = City.find(1), City.find(2), City.find(3)

      sf.stations.create(         name: 'chillest',
                                  dock_count: 20,
                                  installation_date: "2017-08-06",
                                  lat: 100,
                                  lng: 200)

      sf.stations.create(         name: 'surf shack',
                                  dock_count: 10,
                                  installation_date: "2011-10-06",
                                  lat: 100,
                                  lng: 200)

      santa_cruz.stations.create( name: 'burritos',
                                  dock_count: 7,
                                  installation_date: "2012-09-07",
                                  lat: 100,
                                  lng: 200)

      santa_cruz.stations.create( name: 'whatever',
                                  dock_count: 32,
                                  installation_date: "2015-08-06",
                                  lat: 100,
                                  lng: 200)

      ocean_beach.stations.create(name: 'Noriega',
                                  dock_count: 20,
                                  installation_date: "2017-02-02",
                                  lat: 100,
                                  lng: 250)

      ocean_beach.stations.create(name: 'Moraga',
                                  dock_count: 25,
                                  installation_date: "2015-03-02",
                                  lat: 150,
                                  lng: 250)

      Trip.create(duration: 2000,
                  start_date: "2014-11-3",
                  start_time: "14:44",
                  start_station_id: 1,
                  end_date: "10-2-2015",
                  end_time: "14:56",
                  end_station_id: 2,
                  bike_id: 12,
                  subscription_type: "Subscriber",
                  zip_code: 80210)

      Trip.create(duration: 3005,
                  start_date: "2014-11-4",
                  start_time: "10:10",
                  start_station_id: 2,
                  end_date: "11-3-2014",
                  end_time: "14:55",
                  end_station_id: 4,
                  bike_id: 2,
                  subscription_type: "Customer",
                  zip_code: 33156)

      Trip.create(duration: 1000,
                  start_date: "2013-08-29",
                  start_time: "13:22",
                  start_station_id: 1,
                  end_date: "2013-08-29",
                  end_time: "13:55",
                  end_station_id: 2,
                  bike_id: 520,
                  subscription_type: 'Customer',
                  zip_code: 94127)

      Trip.create(duration: 5200,
                  start_date: "2013-08-30",
                  start_time: "13:22",
                  start_station_id: 1,
                  end_date: "2013-08-29",
                  end_time: "13:55",
                  end_station_id: 2,
                  bike_id: 520,
                  subscription_type: 'Subscriber',
                  zip_code: 94127)

      Trip.create(duration: 7522,
                  start_date: "2013-09-29",
                  start_time: "14:22",
                  start_station_id: 3,
                  end_date: "2013-08-29",
                  end_time: "13:55",
                  end_station_id: 1,
                  bike_id: 22,
                  subscription_type: 'Subscriber',
                  zip_code: 94127)

      Condition.create(date: '2014-11-3',
                       max_temperature: 85,
                       mean_temperature: 80,
                       min_temperature: 75,
                       mean_humidity: 75,
                       mean_visibility: 3,
                       mean_wind_speed: 2,
                       precipitation: 2,)

      Condition.create(date: '2014-11-4',
                       max_temperature: 85,
                       mean_temperature: 80,
                       min_temperature: 75,
                       mean_humidity: 75,
                       mean_visibility: 3,
                       mean_wind_speed: 6,
                       precipitation: 1.3,)

      Condition.create(date: '2013-08-29',
                       max_temperature: 85,
                       mean_temperature: 80,
                       min_temperature: 75,
                       mean_humidity: 75,
                       mean_visibility: 3,
                       mean_wind_speed: 7,
                       precipitation: 15,)

      Condition.create(date: '2013-08-30',
                       max_temperature: 85,
                       mean_temperature: 80,
                       min_temperature: 75,
                       mean_humidity: 75,
                       mean_visibility: 3,
                       mean_wind_speed: 12,
                       precipitation: 2.5,)

      Condition.create(date: "2013-09-29",
                       max_temperature: 85,
                       mean_temperature: 80,
                       min_temperature: 75,
                       mean_humidity: 75,
                       mean_visibility: 3,
                       mean_wind_speed: 10,
                       precipitation: 1,)
    end

    describe ".days_within_high_temperature" do
      it 'returns days within a temperature range' do
        expect(Condition.days_within_high_temperature(80).length).to eql(5)
        expect(Condition.days_within_high_temperature(80).first.max_temperature).to eql(85)
      end
    end

    describe ".days_within_precipitation" do
      it 'returns days within a precipitation range' do
        expect(Condition.days_within_precipitation(1).length).to eql(2)
        expect(Condition.days_within_precipitation(2).first.precipitation).to eql(2.0)
      end
    end

    describe ".days_within_wind" do
      it 'returns days within a wind range' do
        expect(Condition.days_within_wind(5).length).to eql(2)
      end
    end

    describe ".days_within_visibility" do
      it 'returns days within a visibility range' do
        expect(Condition.days_within_visibility(5).length).to eql(0)
        expect(Condition.days_within_visibility(2).length).to eql(5)
      end
    end

    describe ".rides_by_day" do
      it 'groups all rides by weather type' do
        expect(Condition.rides_by_day(Condition.days_within_precipitation(2)).length).to eql(1)
        expect(Condition.rides_by_day(Condition.days_within_wind(5)).length).to eql(2)
        expect(Condition.rides_by_day(Condition.days_within_precipitation(1)).length).to eql(2)
        expect(Condition.rides_by_day(Condition.days_within_high_temperature(80)).length).to eql(5)
      end
    end

    describe ".lowest_number_of_rides_by_temp" do
      it 'returns lowest number of rides in a temperature range' do
        expect(Condition.lowest_number_of_rides_by_temp(80)).to eql(1)
      end
    end

    describe ".average_number_of_rides_by_temp" do
      it 'returns average number of rides in a temperature range' do
        expect(Condition.average_number_of_rides_by_temp(80)).to eql(1.0)
      end
    end

    describe ".highest_number_of_rides_by_temp" do
      it 'returns highest number of rides in a temperature range' do
        expect(Condition.highest_number_of_rides_by_temp(85)).to eql(1)
      end
    end

    describe ".lowest_number_of_rides_by_precipitation" do
      it 'returns lowest number of rides in a precipitation range' do
        expect(Condition.lowest_number_of_rides_by_precipitation(1)).to eql(1)
      end
    end

    describe ".average_number_of_rides_by_precipitation" do
      it 'returns lowest number of rides in a precipitation range' do
        expect(Condition.average_number_of_rides_by_precipitation(1)).to eql(1.0)
      end
    end

    describe ".highest_number_of_rides_by_precipitation" do
      it 'returns lowest number of rides in a precipitation range' do
        expect(Condition.highest_number_of_rides_by_precipitation(1)).to eql(1)
      end
    end

    describe ".lowest_number_of_rides_by_wind" do
      it 'returns lowest number of rides in a wind range' do
        expect(Condition.lowest_number_of_rides_by_wind(7)).to eql(1)
      end
    end

    describe ".average_number_of_rides_by_wind" do
      it 'returns average number of rides in a wind range' do
        expect(Condition.average_number_of_rides_by_wind(7)).to eql(1.0)
      end
    end

    describe ".highest_number_of_rides_by_wind" do
      it 'returns highest number of rides in a wind range' do
        expect(Condition.highest_number_of_rides_by_wind(7)).to eql(1)
      end
    end

    describe ".lowest_number_of_rides_by_visbility" do
      it 'returns lowest number of rides in a visibility range' do
        expect(Condition.lowest_number_of_rides_by_visibility(3)).to eql(1)
      end
    end

    describe ".average_number_of_rides_by_visbility" do
      it 'returns average number of rides in a visibility range' do
        expect(Condition.average_number_of_rides_by_visibility(3)).to eql(1.0)
      end
    end

    describe ".highest_number_of_rides_by_visbility" do
      it 'returns highest number of rides in a visibility range' do
        expect(Condition.highest_number_of_rides_by_visibility(3)).to eql(1)
      end
    end

    describe ".all_rides_within_precipitation" do
      it 'returns hash with date and ride numbers' do
        expect(Condition.all_rides_within_precipitation(1).class).to eql(Hash)
        expect(Condition.all_rides_within_precipitation(1).first.class).to eql(Array)
        expect(Condition.all_rides_within_precipitation(1).first.first.class).to eql(Date)
      end
    end

    describe ".all_rides_within_wind_speed" do
      it 'returns hash with date and ride numbers' do
        expect(Condition.all_rides_within_wind_speed(10).class).to eql(Hash)
        expect(Condition.all_rides_within_wind_speed(10).first.class).to eql(Array)
        expect(Condition.all_rides_within_wind_speed(10).first.first.class).to eql(Date)
      end
    end

    describe ".all_rides_within_visibility" do
      it 'returns hash with date and ride numbers' do
        expect(Condition.all_rides_within_visibility(3).class).to eql(Hash)
        expect(Condition.all_rides_within_visibility(3).first.class).to eql(Array)
        expect(Condition.all_rides_within_visibility(3).first.first.class).to eql(Date)
      end
    end

    describe ".all_rides_within_temp" do
      it 'returns hash with date and ride numbers' do
        expect(Condition.all_rides_within_temp(85).class).to eql(Hash)
        expect(Condition.all_rides_within_temp(85).first.class).to eql(Array)
        expect(Condition.all_rides_within_temp(85).first.first.class).to eql(Date)
      end
    end

    describe ".weather_on_day_with_highest_rides" do
      it 'returns conditions on day with highest rides' do
        expect(Condition.weather_on_day_with_highest_rides.first.max_temperature).to eql(85)
        expect(Condition.weather_on_day_with_highest_rides.first.min_temperature).to eql(75)
        expect(Condition.weather_on_day_with_highest_rides.first.mean_temperature).to eql(80)
        expect(Condition.weather_on_day_with_highest_rides.first.mean_visibility).to eql(3)
      end
    end

  end
  describe 'Validates' do
    it 'creates a condition given all necessary parameters' do
      cool = Condition.create( date: '2013-08-30',
                               max_temperature: 85,
                               mean_temperature: 80,
                               min_temperature: 75,
                               mean_humidity: 75,
                               mean_visibility: 3,
                               mean_wind_speed: 15,
                               precipitation: 0.5,)

      expect(cool).to be_valid
    end

    it 'presence of date' do
      cool = Condition.create( max_temperature: 85,
                               mean_temperature: 80,
                               min_temperature: 75,
                               mean_humidity: 75,
                               mean_visibility: 3,
                               mean_wind_speed: 15,
                               precipitation: 0.5,)

      expect(cool).to_not be_valid
    end

    it 'uniqueness of date' do
      cool = Condition.create( date: '2013-08-30',
                               max_temperature: 85,
                               mean_temperature: 80,
                               min_temperature: 75,
                               mean_humidity: 75,
                               mean_visibility: 3,
                               mean_wind_speed: 15,
                               precipitation: 0.5,)
      not_cool = Condition.create( date: '2013-08-30',
                                   max_temperature: 85,
                                   mean_temperature: 80,
                                   min_temperature: 75,
                                   mean_humidity: 75,
                                   mean_visibility: 3,
                                   mean_wind_speed: 15,
                                   precipitation: 0.5,)

      expect(not_cool).to_not be_valid
    end

    it 'presence of max_temperature' do
      cool = Condition.create( date: '2013-08-30',
                               mean_temperature: 80,
                               min_temperature: 75,
                               mean_humidity: 75,
                               mean_visibility: 3,
                               mean_wind_speed: 15,
                               precipitation: 0.5,)

      expect(cool).to_not be_valid
    end

    it 'presence of mean_temperature' do
      cool = Condition.create( date: '2013-08-30',
                               max_temperature: 85,
                               min_temperature: 75,
                               mean_humidity: 75,
                               mean_visibility: 3,
                               mean_wind_speed: 15,
                               precipitation: 0.5,)

      expect(cool).to_not be_valid
    end

    it 'presence of min_temperature' do
      cool = Condition.create( date: '2013-08-30',
                               max_temperature: 85,
                               mean_temperature: 80,
                               mean_humidity: 75,
                               mean_visibility: 3,
                               mean_wind_speed: 15,
                               precipitation: 0.5,)

      expect(cool).to_not be_valid
    end

    it 'presence of mean_humidity' do
      cool = Condition.create( date: '2013-08-30',
                               max_temperature: 85,
                               mean_temperature: 80,
                               min_temperature: 75,
                               mean_visibility: 3,
                               mean_wind_speed: 15,
                               precipitation: 0.5,)

      expect(cool).to_not be_valid
    end

    it 'presence of mean_visibility' do
      cool = Condition.create( date: '2013-08-30',
                               max_temperature: 85,
                               mean_temperature: 80,
                               min_temperature: 75,
                               mean_humidity: 75,
                               mean_visibility: 3,
                               precipitation: 0.5,)

      expect(cool).to_not be_valid
    end

    it 'presence of precipitation' do
      cool = Condition.create( date: '2013-08-30',
                               max_temperature: 85,
                               mean_temperature: 80,
                               min_temperature: 75,
                               mean_humidity: 75,
                               mean_visibility: 3,)

      expect(cool).to_not be_valid
    end
  end
end
