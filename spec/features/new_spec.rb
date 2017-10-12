describe "/stations/new" do
  before :each do
    visit '/stations/new'
  end

it "user sees form with name field" do
  expect(page).to have_field("station[name]")
end

it 'user populates form with name field' do
  fill_in('name', with: "San Jose Diridon Caltrain Station")
end

it "user sees form with dock count field" do
  expect(page).to have_field('station[dock_count]')
end

it 'user populates form with dock count field' do
  fill_in('dock count', with: 24)
end

it "user sees form with city field" do
  expect(page).to have_field("station[city_id]")
end





it "user sees form with installation date field" do
  expect(page).to have_field("station[installation_date]" )
end

it 'user populates form with installation date field' do
  fill_in('installation date', with: "2014-10-15")
end

it "user can click submit button on form" do
  fill_in 'station[name]', with: 'Cowabunga'
  fill_in 'station[dock_count]', with: '17'
  fill_in 'station[installation_date]', with: '2014-10-15'

  click_button("submit")

  expect(current_path).to eq('/stations')
end



end
