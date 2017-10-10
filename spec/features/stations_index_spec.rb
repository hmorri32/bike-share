describe "station index" do
  before do
    Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: City.create(id:1, name: "San Jose"), installation_date: '2013-08-06', lat:0, lng:0)

    visit '/stations'
  end

  it "has status code" do
    expect(page.status_code).to eq(200)
  end

  it "user sees names of first station" do
    expect(page).to have_content("San Jose Diridon Caltrain Station")
  end

  it "user sees dock count of first station" do
    expect(page).to have_content(27)
  end

  it "user sees installation date of first station" do
    expect(page).to have_content('2013-08-06')
  end

  it "user clicks delete and goes back to stations index" do
    click_button("DELETE")
    expect(current_path).to eq("/stations")
  end

  it 'user clicks show and goes to show page for specific station' do
    click_link("New")
    expect(current_path).to eq("/stations/new")
  end

  it 'user clicks edit, page loads to edit page for specific station' do
    click_button("EDIT")
    expect(current_path).to eq("/stations/1/edit")
  end

end
