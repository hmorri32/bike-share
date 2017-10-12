describe 'conditions/new' do
  before :each do
    visit '/conditions/new'
  end
  it "user sees form with date field" do
    expect(page).to have_field("condition[date]")
  end

  it 'user populates form with date field' do
    fill_in('Date', with: "2014-10-15")
  end

  it "user sees form with max temp field" do
    expect(page).to have_field('condition[max_temperature]')
  end

  it 'user populates form with max temp content' do
    fill_in('Max Temperature', with: 55)
  end

  it "user sees form with mean temperature field" do
    expect(page).to have_field("condition[mean_temperature]")
  end

  it 'user inputs mean temperature content in mean temp form field' do
    fill_in('Mean Temperature', with: 35)
  end

  it "user sees form with min temp  field" do
    expect(page).to have_field("condition[min_temperature]" )
  end

  it 'user populates form with min temp content' do
    fill_in('Min Temperature', with: 21)
  end

  it "user sees form with mean humidity field" do
    expect(page).to have_field("condition[mean_humidity]" )
  end

  it 'user populates form with mean humidity content' do
    fill_in('Mean Humidity', with: 24)
  end


  it "user sees form with mean visibility field" do
    expect(page).to have_field("condition[mean_visibility]" )
  end

  it 'user populates form with mean visibility content' do
    fill_in('Mean Visibility', with: 3)
  end

  it "user sees form with mean wind speed field" do
    expect(page).to have_field("condition[mean_wind_speed]" )
  end

  it 'user populates form with mean wind speed content' do
    fill_in('Mean Wind Speed', with: 21)
  end

  it "user sees form with precipitation field" do
    expect(page).to have_field("condition[precipitation]" )
  end

  it 'user populates form with precipitation content' do
    fill_in('Precipitation', with: 35)
  end

  it "user can click submit button on form" do
    fill_in 'condition[date]', with: '2014-10-05'
    fill_in 'condition[max_temperature]', with: 55
    fill_in 'condition[mean_temperature]', with: 35
    fill_in 'condition[min_temperature]', with: 24
    fill_in 'condition[mean_humidity]', with: 17
    fill_in 'condition[mean_visibility]', with: 3
    fill_in 'condition[mean_wind_speed]', with: 2
    fill_in 'condition[precipitation]', with: 4
    click_button("submit")

    expect(current_path).to eq('/conditions')
  end



end
