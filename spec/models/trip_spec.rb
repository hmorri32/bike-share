RSpec.context Trip do
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
                  start_date: "11-3-2014",
                  start_time: "14:44",
                  start_station_id: 1,
                  end_date: "10-2-2015",
                  end_time: "14:56",
                  end_station_id: 2,
                  bike_id: 12,
                  subscription_type: "Subscriber",
                  zip_code: 80210)

      Trip.create(duration: 3005,
                  start_date: "11-3-2014",
                  start_time: "10:10",
                  start_station_id: 2,
                  end_date: "11-3-2014",
                  end_time: "14:55",
                  end_station_id: 4,
                  bike_id: 2,
                  subscription_type: "Customer",
                  zip_code: 33156)

      Trip.create(duration: 1000,
                  start_date: "2013-08-29 13:22",
                  start_time: "13:22",
                  start_station_id: 1,
                  end_date: "2013-08-29",
                  end_time: "13:55",
                  end_station_id: 2,
                  bike_id: 520,
                  subscription_type: 'Customer',
                  zip_code: 94127)

      Trip.create(duration: 5200,
                  start_date: "2013-08-29 13:22",
                  start_time: "13:22",
                  start_station_id: 1,
                  end_date: "2013-08-29",
                  end_time: "13:55",
                  end_station_id: 2,
                  bike_id: 520,
                  subscription_type: 'Subscriber',
                  zip_code: 94127)

      Trip.create(duration: 7522,
                  start_date: "2013-08-29 12:22",
                  start_time: "14:22",
                  start_station_id: 3,
                  end_date: "2013-08-29",
                  end_time: "13:55",
                  end_station_id: 1,
                  bike_id: 22,
                  subscription_type: 'Subscriber',
                  zip_code: 94127)

    end

    describe '.average_duration' do
      it 'returns average trip duration' do
        expect(Trip.average_duration).to eql(62)
      end
    end

    describe '.longest_ride' do
      it 'returns the longest ride' do
        expect(Trip.longest_ride).to eql(125)
      end
    end

    describe '.shortest_ride' do
      it 'returns the shortest ride' do
        expect(Trip.shortest_ride).to eql(16)
      end
    end
  end

  describe "Validates" do
    it 'creates a trip given necessary parameters' do
     cool = Trip.create(duration: 211,
                        start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_station_id: 4,
                        end_date: "11-3-2014 14:55",
                        bike_id: 2,
                        subscription_type: "Customer",
                        zip_code: 33156)

      expect(cool).to be_valid
    end

    it 'existence of duration' do
     cool = Trip.create(start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_station_id: 4,
                        end_date: "11-3-2014 14:55",
                        bike_id: 2,
                        subscription_type: "Customer",
                        zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it "presence of start date" do
      cool = Trip.create(duration: 211,
                         start_station_id: 2,
                         end_station_id: 4,
                         end_date: "11-3-2014 14:55",
                         bike_id: 2,
                         subscription_type: "Customer",
                         zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it "presence of start station id" do
      cool = Trip.create(duration: 211,
                         start_date: "11-3-2014 10:10",
                         end_station_id: 4,
                         end_date: "11-3-2014 14:55",
                         bike_id: 2,
                         subscription_type: "Customer",
                         zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it 'existence of end station id' do
     cool = Trip.create(duration: 211,
                        start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_date: "11-3-2014 14:55",
                        bike_id: 2,
                        subscription_type: "Customer",
                        zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it 'existence of end date' do
     cool = Trip.create(duration: 211,
                        start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_station_id: 4,
                        bike_id: 2,
                        subscription_type: "Customer",
                        zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it 'existence of bike id' do
     cool = Trip.create(duration: 211,
                        start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_station_id: 4,
                        end_date: "11-3-2014 14:55",
                        subscription_type: "Customer",
                        zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it 'existence of subscription type' do
     cool = Trip.create(duration: 211,
                        start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_station_id: 4,
                        end_date: "11-3-2014 14:55",
                        bike_id: 2,
                        zip_code: 33156)

      expect(cool).to_not be_valid
    end

    it 'existence of zip code' do
     cool = Trip.create(duration: 211,
                        start_date: "11-3-2014 10:10",
                        start_station_id: 2,
                        end_station_id: 4,
                        end_date: "11-3-2014 14:55",
                        bike_id: 2,
                        subscription_type: "Customer")

      expect(cool).to_not be_valid
    end
  end
end