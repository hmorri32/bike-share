# rake db:test:prepare

RSpec.describe Station do
  context 'Class Methods' do

    before do
      City.create(name: 'San Francisco')
      City.first.stations.create(name: 'chillest',   dock_count: 20, installation_date: "2017-08-06")
      City.first.stations.create(name: 'surf shack', dock_count: 10, installation_date: "2011-10-06")
      City.first.stations.create(name: 'burritos',   dock_count: 7,  installation_date: "2012-09-07")
      City.first.stations.create(name: 'whatever',   dock_count: 32, installation_date: "2015-08-06")
      City.first.stations.create(name: 'duplicate',  dock_count: 32, installation_date: "2015-08-06")
    end

    describe ".total_station_count" do
      it 'returns total station count' do
        expect(Station.station_count).to eql(5)
      end
    end

    describe ".average_bikes" do
      it "returns average bikes per station" do
        expect(Station.average_bikes).to eql(20)
      end
    end

   describe ".max_bikes_per_station" do
      it "returns maximum bikes per station" do
        expect(Station.max_bikes_per_station).to eql(32)
      end
    end

   describe ".min_bikes_per_station" do
      it "returns minimum bikes per station" do
        expect(Station.min_bikes_per_station).to eql(7)
      end
    end

   describe ".stations_with_most_bikes" do
      it "returns stations with most bikes" do
        expect(Station.stations_with_most_bikes).to eql('whatever, duplicate')
      end
    end

   describe ".stations_with_least_bikes" do
      it "returns stations with least bikes" do
        expect(Station.stations_with_least_bikes).to eql('burritos')
      end
    end

   describe ".newest_station" do
      it "returns most recently built station" do
        expect(Station.newest_station).to eql('chillest')
      end
    end

   describe ".oldest_station" do
      it "returns oldest station" do
        expect(Station.oldest_station).to eql('surf shack')
      end
    end
  end

  context "Validates" do
    before { City.create(name: 'cool town') }

    it "creates a city given valid params" do
      station = City.first.stations.create(name: 'whatever', dock_count: 27, installation_date: "2014-08-06")
      expect(station).to be_valid
    end

    it "existence of name" do
      station = City.first.stations.create(dock_count: 27, installation_date: "2014-08-06")

      expect(station).to_not be_valid
    end

    it "existence of dock_count" do
      station = City.first.stations.create(name: "cool stuff", installation_date: "2014-08-06")

      expect(station).to_not be_valid
    end

    it "existence of installation date" do
      station = City.first.stations.create(name: "cool stuff", dock_count: 27)

      expect(station).to_not be_valid
    end

    it "existence of latitude" do
      station = City.first.stations.create(name: "cowabunga", installation_date: "2015-09-05")

      expect(station).to_not be_valid
    end

    it "existence of longitude" do
      station = City.first.stations.create(dock_count: 30, installation_date: "2015-09-04")

      expect(station).to_not be_valid
    end
  end
end
