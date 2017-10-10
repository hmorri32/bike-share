describe "/stations/show" do
  before :each do
    Station.create!(id: 1, name: "San Jose Diridon Caltrain Station", dock_count: 27, city: City.create(id:1, name: "San Jose"), installation_date: "2013-08-06", lat:0, lng:0)
    Trip.create!(id: 1, duration: 63, start_date: "2013-08-29", start_time: "2000-01-01 14:13:00", start_station_id: 1, end_date: "2013-08-29", end_time: "2000-01-01 14:14:00", end_station_id: 1, bike_id: 520, subscription_type: "Subscriber", zip_code: 94127)

    visit '/stations/1'
  end

  it "has status code 200" do
    expect(page.status_code).to eq(200)
  end

  it "user sees name of station" do
    expect(page).to have_content("San Jose Diridon Caltrain Station")
  end

  it "user sees dockcount" do
    expect(page).to have_content(27)
  end

  it "user sees city" do
    expect(page).to have_content("San Jose")
  end

  it "user sees installation date" do
    expect(page).to have_content("2013-08-06")
  end


end
