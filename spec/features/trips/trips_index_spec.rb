describe 'trips index' do
  before do
    Trip.create(id: 1,
                duration: 20,
                start_date: "2014-11-03",
                start_time: "14:44",
                start_station_id: 1,
                end_date: "2015-10-02",
                end_time: "14:56",
                end_station_id: 2,
                bike_id: 12,
                subscription_type: "Subscriber",
                zip_code: 80210)

    visit '/trips'
  end

it "has a status code of 200" do
  expect(page.status_code).to eql(200)
end

it "has content underneath duration" do
  expect(page).to have_content(20)
end

it "has content underneath start date" do
  expect(page).to have_content("2014-11-03")
end

it 'has start time content' do
  expect(page).to have_content("14:44")
end

it "has start station id" do
  expect(page).to have_content(1)
end

it 'has end date content' do
  expect(page).to have_content("2015-10-02")
end

it 'has end time content' do
  expect(page).to have_content("14:56")
end

it "has end station id content" do
  expect(page).to have_content(2)
end

it "has bike id content" do
  expect(page).to have_content(12)
end

it "has subscription type content displayed" do
  expect(page).to have_content("Subscriber")
end

it "has zip code associated with trip" do
  expect(page).to have_content(80210)
end

it "user can click Trip #1 and go to Trip Id 1 show page" do
  click_link("Trip #1")
  expect(current_path).to eq("/trips/1")
end

it 'user clicks edit for trip #1, page loads to edit page for specific station' do
  click_button("EDIT")
  expect(current_path).to eq("/trips/1/edit")
end

it 'user clicks delete for trip #1, page loads back to trips page without deleted trip' do
  click_button("DELETE")
  expect(current_path).to eq("/trips")
end

end
