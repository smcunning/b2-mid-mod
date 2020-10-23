require 'rails_helper'

describe 'on a amusement parks show page' do
  before :each do
    @park_1 = AmusementPark.create(name: "Hershey Park",
                                   admission: 50.00)
    @ride_1 =          Ride.create(name: "Lightning Racer",
                                   thrill_rating: 9)
    @ride_2 =          Ride.create(name: "Storm Runner",
                                   thrill_rating: 7)
    @ride_3 =          Ride.create(name: "The Great Bear",
                                   thrill_rating: 10)
  end

  it 'has the name and price of admissions for that amusement park' do

    visit "/amusement-parks/#{@park_1.id}"

    within ".park-info" do
      expect(page).to have_content(@park_1.name)
      expect(page).to have_content("$#{@park_1.admission}")
    end
  end

  it 'has the names of all the rides that are at that park' do

    visit "/amusement-parks/#{@park_1.id}"

    within "#ride-#{@ride_1.id}" do
      expect(page).to have_content(@ride_1.name)
    end

    within "#ride-#{@ride_2.id}" do
      expect(page).to have_content(@ride_2.name)
    end

    within "#ride-#{@ride_3.id}" do
      expect(page).to have_content(@ride_3.name)
    end
  end

  it 'has the average thrill rating of rides' do

    visit "/amusement-parks/#{@park_1.id}"

    within ".thrill-rating" do
      expect(page).to have_content(@park_1.average_thrill_rating)
    end
  end
end
