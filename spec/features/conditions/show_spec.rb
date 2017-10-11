describe '/conditions/show' do
  before :each do
    Condition.create(id:1, max_temperature: 43, mean_temperature: 35, min_temperature: 28, mean_humidity: 72, mean_visibility: 3, mean_wind_speed: 35, precipation: 3)

    visit '/stations/1'
  end

it "has status code of 200" do
  expect(page.status_code).to eq(200)
end
