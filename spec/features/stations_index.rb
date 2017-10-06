describe "station index" do
  before do
    Station.create(name: "San Jose Diridon Station", dock_count: 27, city: "San Jose", installation_date: 2013-08-06))
    Station.create(name: "San Jose Civic Center", dock_count: 15, city: "San Jose", installation_date: 2013-08-05)
    visit '/'
  end
  it "user sees names of all stations" do
    expect(page).to have_content("San Jose Diridon Station")
  end

  it "user sees dock count of all stations" do
    expect(page).to have_content(15)
  end

  it "user sees installation dates of all stations" do
    expect(page).to have_content(2013-08-05)
  end

  it "user clicks delete and goes back to stations indedx" do
    click_button("delete")
    expect(current_path).to eq("/stations")
  end
end
