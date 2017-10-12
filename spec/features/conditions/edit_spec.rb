describe '/conditions/2013-09-01/' do
  before :each do
    Condition.create(date: "2013-09-01", max_temperature: 27, mean_temperature: 33, min_temperature: 1, mean_humidity: 2, mean_visibility: '2013-08-06', mean_humidity: 21, mean_wind_speed: 5, precipitation: 2)
    visit '/conditions/2013-09-01/edit'
  end

  it "has status code 200" do
    expect(page.status_code).to eq(200)
  end

  it "user sees date form field and can populate with new content" do
    fill_in('condition[date]', with: "2015-10-08")
  end

  it "user sees max temp form field and can populate with new content" do
    fill_in('condition[max_temperature]', with: 75)
  end


  it "user sees mean temp form field and can populate with new content" do
    fill_in('condition[mean_temperature]', with: 55)
  end

  it "user sees min temp form field and can populate with new content" do
    fill_in('condition[min_temperature]', with: 21)
  end

  it "user sees mean humidity form field and can populate with new content" do
    fill_in('condition[mean_humidity]', with: 42)
  end

  it "user sees mean visibility form field and can populate with new content" do
    fill_in('condition[mean_visibility]', with: 4)
  end

  it "user sees mean wind speed form field and can populate with new content" do
    fill_in('condition[mean_wind_speed]', with: 21)
  end

  it "user sees precipitation form field and can populate with new content" do
    fill_in('condition[precipitation]', with: 0)
  end

end
