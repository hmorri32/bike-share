describe '/conditions/show' do
  before :each do
    Condition.create(date:"2015-08-06", max_temperature: 43, mean_temperature: 35, min_temperature: 28, mean_humidity: 72, mean_visibility: 3, mean_wind_speed: 35, precipitation: 3)

    visit '/conditions/2015-08-06'
  end

it "has status code of 200" do
  expect(page.status_code).to eq(200)
end

it "user sees condtiion date" do
  expect(page).to have_content("2015-08-06")
end

it "user sees max temperature" do
  expect(page).to have_content(43)
end

it "user sees mean temperature" do
  expect(page).to have_content(35)
end

it "user sees min temperature" do
  expect(page).to have_content(28)
end

it 'user sees mean humidity' do
  expect(page).to have_content(72)
end

it 'user sees mean visibility' do
  expect(page).to have_content(3)
end

it "user sees mean wind speed" do
  expect(page).to have_content(35)
end

it "User sees precipitation" do
  expect(page).to have_content(3)
end
end
