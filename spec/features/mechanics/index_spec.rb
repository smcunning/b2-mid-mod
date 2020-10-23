require 'rails_helper'

describe 'mechanics index page' do
  before :each do
    @mechanic_1 = Mechanic.create(name: "Sam Mills",
                                  experience: 10)
    @mechanic_2 = Mechanic.create(name: "Kara Smith",
                                  experience: 11)
  end

  it 'has header "All Mechanics" and a list of all mechanics names & experience' do
    visit "/mechanics"

    within ".header" do
      expect(page).to have_content("All Mechanics")
    end
  
    within "#mechanic-#{@mechanic_1.id}" do
      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.experience)
    end

    within "#mechanic-#{@mechanic_2.id}" do
      expect(page).to have_content(@mechanic_2.name)
      expect(page).to have_content(@mechanic_2.experience)
    end
  end
end
