describe '/trips/1/edit' do
  before :each do
    trip = Trip.create(id: 1,
                      duration: 20,
                      start_date: "11-3-2014",
                      start_time: "14:44",
                      start_station_id: 1,
                      end_date: "10-2-2015",
                      end_time: "14:56",
                      end_station_id: 2,
                      bike_id: 12,
                      subscription_type: "Subscriber",
                      zip_code: 80210)

    visit '/trips/1/edit'
  end

it "user sees edit functionality with trip duration" do
  expect(page).to have_field("trip[duration]")
end

it 'user can populate edit form field with trip duration' do
  fill_in('trip[duration]', with: 45)
end

it "user sees edit functionality with trip start date" do
  expect(page).to have_field("trip[start_date]")
end

it 'user can populate edit form field with trip start date' do
  fill_in('trip[start_date]', with: "2017-10-08")
end

it "user sees edit functionality with start station id" do
  expect(page).to have_field("trip[start_station_id]")
end

it 'user can populate edit form field with start station id' do
  fill_in('trip[start_station_id]', with: 21)
end

it 'user sees edit form field for end date' do
  expect(page).to have_field("trip[end_date]")
end

it 'user can populate edit form field with end date' do
  fill_in('trip[end_date]', with: "2017-10-08")
end

it 'user sees edit form field for end station id' do
  expect(page).to have_field("trip[end_station_id]")
end

it 'user can populate edit form field with end station id' do
  fill_in('trip[end_station_id]', with: 20)
end

it 'user sees edit form field for bike id' do
  expect(page).to have_field("trip[bike_id]")
end

it 'user can populate edit form field for bike id' do
  fill_in('trip[bike_id]', with: 45)
end

it 'user can sees edit form field for subscription type' do
  expect(page).to have_field("trip[subscription_type]")
end

it "user can populate edit form field for subscription type" do
  fill_in('trip[subscription_type]', with: "Subscriber")
end

it 'user sees edit form field for zip code for a trip' do
  expect(page).to have_field("trip[zip_code]")
end

it "user can populate edit form field for zip code for a trip" do
  fill_in('trip[zip_code]', with: 95355)
end
end
