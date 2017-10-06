describe "/stations/show" do
  before :each do
    Station.create(id: 1, name: "MollyWop", dock_count: 24, city: "The YAY Area", installation_date: "04-03-2013")
    visit '/stations/show/1'
  end

  it "user sees name of station" do
    expect(page).to have_content("MollyWop")
  end

  it "user sees dockcount" do
    expect(page).to have_content(24)
  end

  it "user sees city" do
    expect(page).to have_content("The YAY Area")
  end

  it "user sees installation date" do
    expect(page).to have_content("04-03-2013")
  end
end
