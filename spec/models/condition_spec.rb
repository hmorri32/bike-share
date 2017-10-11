RSpec.context Condition do
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