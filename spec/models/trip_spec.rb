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

    describe '.station_most_starting_rides' do
      it 'returns the station name with the most starting rides' do
        expect(Trip.station_most_starting_rides).to eql("chillest")
      end
    end

    describe '.station_most_ending_rides' do
      it 'returns the station name with the most ending rides' do
        expect(Trip.station_most_ending_rides).to eql("surf shack")
      end
    end

    describe '.monthly_rides' do
      it 'returns the a hash with month and ride count' do
        expect(Trip.monthly_rides.class).to eql(Hash)
        expect(Trip.monthly_rides).to have_value(3)
      end
    end

    describe '.yearly_rides' do
      it 'returns a hash with year and ride count' do
        expect(Trip.yearly_rides.class).to eql(Hash)
        expect(Trip.yearly_rides).to have_value(3)
      end
    end

    describe '.ridden_bikes' do
      it 'returns all bikes as a hash with bike id and ride count' do
        expect(Trip.ridden_bikes.class).to eql(Hash)
        expect(Trip.ridden_bikes).to eql({520=>2, 22=>1, 12=>1, 2=>1})
      end
    end

    describe '.most_ridden_bike' do
      it 'returns the most ridden bike with id and ride count' do
        expect(Trip.most_ridden_bike.class).to eql(Array)
        expect(Trip.most_ridden_bike).to eql([520, 2])
      end
    end

    describe '.least_ridden_bike' do
      it 'returns the least ridden bike with id and ride count' do
        expect(Trip.least_ridden_bike.class).to eql(Array)
        expect(Trip.least_ridden_bike).to eql([12, 1])
      end
    end

    describe '.subscription_breakdown' do
      it 'returns hash with breakdown of subscription type' do
        expect(Trip.subscription_breakdown.class).to eql(Hash)
        expect(Trip.subscription_breakdown).to eql({"Customer"=>2, "Subscriber"=>3})
      end
    end

    describe '.subscriber_count' do
      it 'returns total subscriber number' do
        expect(Trip.subscriber_count.class).to eql(Integer)
        expect(Trip.subscriber_count).to eql(3)
      end
    end

    describe '.customer_count' do
      it 'returns total customer number' do
        expect(Trip.customer_count.class).to eql(Integer)
        expect(Trip.customer_count).to eql(2)
      end
    end

    describe '.subscriber_percentage' do
      it 'returns percentage of total that are subscribers' do
        expect(Trip.subscriber_percentage.class).to eql(Float)
        expect(Trip.subscriber_percentage).to eql(60.0)
      end
    end

    describe '.customer_percentage' do
      it 'returns percentage of total that are customers' do
        expect(Trip.customer_percentage.class).to eql(Float)
        expect(Trip.customer_percentage).to eql(40.0)
      end
    end

    describe '.date_with_highest_trips' do
      it 'returns date and ride count on highest day' do
        expect(Trip.date_with_highest_trips.class).to eql(Array)
        expect(Trip.date_with_highest_trips.first.class).to eq(Date)
        expect(Trip.date_with_highest_trips.last).to eq(3)
      end
    end

    describe '.date_with_lowest_trips' do
      it 'returns date and ride count on lowest day' do
        expect(Trip.date_with_lowest_trips.class).to eql(Array)
        expect(Trip.date_with_lowest_trips.first.class).to eq(Date)
        expect(Trip.date_with_lowest_trips.last).to eq(2)
      end
    end

    describe '.start_station' do
      it 'returns start stations by trip id' do
        expect(Trip.start_station(1).length).to eql(3)
      end
    end

    describe '.rides_ended' do
      it 'returns ride count by trip id' do
        expect(Trip.rides_ended(1)).to eql(1)
      end
    end

    describe '.frequent_destination' do
      it 'returns frequent destination by id' do
        expect(Trip.frequent_destination(1)).to eql("surf shack")
      end
    end

    describe '.origin_destination' do
      it 'returns origin destination by id' do
        expect(Trip.origin_destination(1)).to eql("chillest")
      end
    end

    describe '.busiest_date' do
      it 'returns busiest date by trip ID' do
        expect(Trip.busiest_date(1).class).to eql(Date)
      end
    end

    describe '.frequent_zipcode' do
      it 'returns busiest zipcode by trip ID' do
        expect(Trip.frequent_zipcode(1)).to eql(94127)
      end
    end

    describe '.frequent_bike' do
      it 'returns busiest bike ID by trip ID' do
        expect(Trip.frequent_bike(1)).to eql(520)
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
