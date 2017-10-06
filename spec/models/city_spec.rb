RSpec.describe 'City' do
  context 'validates' do
    it 'existence of name' do

      city = City.create

      expect(city).to be_invalid
    end

    it 'uniqueness of name' do
      cool_city = City.create(name: "Cool Town")
      duplicate = City.create(name: "Cool Town")

      expect(duplicate).to be_invalid
    end
  end
end
