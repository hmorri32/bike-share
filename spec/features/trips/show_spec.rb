describe "/trips/show" do
  before :each do
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
    visit '/trips/1'
  end

  it "has status code 200" do
    expect(page.status_code).to eq(200)
  end

  it "user sees duration of trip" do
    expect(page).to have_content(20)
  end

  it "user sees start date" do
    expect(page).to have_content("2014-11-03")
  end

  it "user sees start station" do
    expect(page).to have_content(1)
  end

  it "user sees end date" do
    expect(page).to have_content("2015-10-02")
  end

  it "user sees end station id" do
    expect(page).to have_content(2)
  end

  it "user sees bike id" do
    expect(page).to have_content(12)
  end

  it "user sees subscription type" do
    expect(page).to have_content("Subscriber")
  end

  it "user sees zip code" do
    expect(page).to have_content(80210)
  end

end
