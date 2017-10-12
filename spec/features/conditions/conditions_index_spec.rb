describe 'conditions index' do
  before :each do
    Condition.create(date: "2017-10-09",
                    max_temperature: 75,
                    mean_temperature: 65,
                    min_temperature: 35,
                    mean_humidity: 21,
                    mean_visibility: 15,
                    mean_wind_speed: 2,
                    precipitation: 1)

    visit '/conditions'
  end

it "has a status code of 200" do
  expect(page.status_code).to eql(200)
end

it "has content underneath date" do
  expect(page).to have_content("2017-10-09")
end

it "has content underneath max temp " do
  expect(page).to have_content(75)
end

it 'has mean temp content' do
  expect(page).to have_content(65)
end

it "has min temp content" do
  expect(page).to have_content(35)
end

it 'has mean humidity content' do
  expect(page).to have_content(21)
end

it 'has mean visibility content' do
  expect(page).to have_content(15)
end

it "has mean wind speed content" do
  expect(page).to have_content(2)
end

it "has precipitation content" do
  expect(page).to have_content(1)
end


it "user can click Condition #1 and go to first condition show page" do
  click_link("Condition")
  expect(current_path).to eq("/conditions/2017-10-09")
end

it 'user clicks edit for condition #1, page loads to edit page for specific condition' do
  click_button("EDIT")
  expect(current_path).to eq("/conditions/2017-10-09/edit")
end

end
