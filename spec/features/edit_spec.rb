describe "/stations/1/edit" do
  before :each do
    Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: City.create(id:1, name: "San Jose"), installation_date: '2013-08-06', lat:0, lng:0)

  visit '/stations/1/edit'
  end

  it "has status code 200" do
    expect(page.status_code).to eq(200)
  end

  it "user sees name form field and can populate it with new content" do
    fill_in('station[name]', with: "Embacadero")
  end

  it "user sees dock count form field and can populate it with new content" do
    fill_in('station[dock_count]', with: 27)
  end

  it "user sees city drop down menu and can select new city from available options" do

  end

  it "user sees installation date form field and can populate it with new content" do
    fill_in('station[installation_date]', with: "2014-10-05")
  end
  #
  # it "user can click submit button on form" do
  #   fill_in 'station[name]', with: 'Cowabunga'
  #   fill_in 'station[dock_count]', with: 17
  #   fill_in 'station[installation_date]', with: '2014-10-15'
  #
  #   click_button("SUBMIT")
  #
  #   expect(current_path).to eq('/stations/1')
  # end
end
