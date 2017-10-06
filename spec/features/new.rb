describe "/stations/new" do
  before :each do
    visit '/stations/new'
  end
    it "user sees form with name field" do
      expect(page).to have_field(:name)
    end

    it "user sees form with dock count field" do
      expect(page).to have_field(:dock_count)
    end

    it "user sees form with city field" do
      expect(page).to have_field(:city)
    end

    it "user sees form with installation date field" do
      expect(page).to have_field(:installation_date)
    end

    it "user can click submit button on form" do
      fill_in 'name', with: 'Cowabunga'
      fill_in 'dock_count', with: '17'
      fill_in 'city', with: 'ShittyCity'
      fill_in 'installation_date', with: '06/23/2014'

      click_button("submit")
      expect(current_path).to eq('/')
    end

end
