describe '/stations/dashboard' do
  before :each do

    Station.create!(id: 1, name: "San Jose Diridon Caltrain Station", dock_count: 27, city: City.create(id:1, name: "San Jose"), installation_date: "2013-08-06", lat:0, lng:0)
    Station.create(id:2, name: "San Jose Diridon Station", dock_count: 27, city: City.create(id:1 name: "San Jose"), installation_date: "2013-0806", lat:0, lng:0)
    Station.create!(id: 3, name: "Embarcadero", dock_count: 27, city: City.create(id:1, name: "San Francisco"), installation_date: "2013-08-05", lat:0, lng:0)

    visit '/stations/dashboard'
  end



  it 'user can see total number of stations' do
    expect(page).to have_content(3)
  end

  it 'user can see average bike per station' do
    expect(page).to have_content(27)
  end

  it 'user can see max bikes per station' do
    expect(page).to have_content(0)
  end

  it 'user can see station with most bikes' do
    expect(page).to have_content(0)
  end

  it 'user can see station with least bikes' do
    expect(page).to have_content(0)
  end

  it 'user can see minimum bikes per station' do
    expect(page).to have_content(0)
  end

  it 'user can see oldest station' do
    expect(page).to have_content(0)
  end

  it 'user can see newest station' do
    expect(page).to have_content(0)
  end

end
