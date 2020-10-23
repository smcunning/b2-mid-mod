require 'rails_helper'

describe 'mechanics show page' do
  before :each do
    @mechanic =    Mechanic.create(name: "Kara Smith",
                                  experience: 11)
    @park_1 = AmusementPark.create(name: "Hershey Park",
                                   admission: 50.00)
    @ride_1 =          Ride.create(name: "The Frog Hopper",
                                   thrill_rating: 6,
                                   amusement_park_id: @park_1.id)
    @ride_2 =          Ride.create(name: "Fahrenheit",
                                   thrill_rating: 9,
                                   amusement_park_id: @park_1.id)
    @ride_3 =          Ride.create(name: "The Kiss Raise",
                                   thrill_rating: 7,
                                   amusement_park_id: @park_1.id)
    @mech_ride_1 = MechanicRide.create(mechanic_id: @mechanic.id,
                                       ride_id: @ride_1.id)
    @mech_ride_2 = MechanicRide.create(mechanic_id: @mechanic.id,
                                       ride_id: @ride_2.id)
    @mech_ride_2 = MechanicRide.create(mechanic_id: @mechanic.id,
                                       ride_id: @ride_3.id)
  end

  it 'has their name, years of experience and all rides working on' do

    visit "/mechanics/#{@mechanic.id}"

    within '.mechanic-info' do
      expect(page).to have_content(@mechanic.name)
      expect(page).to have_content(@mechanic.experience)
    end

    within '.rides' do
      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_2.name)
      expect(page).to have_content(@ride_3.name)
    end
  end

  it 'has a form to add to their workload' do

    visit "/mechanics/#{@mechanic.id}"

    within '.add-ride-form' do
      expect(page).to have_field(:add_ride)
    end
  end

  it 'can fill form and take me to show page with new ride added' do
    ride_4 =          Ride.create(name: "Judgeroy Screams",
                                  thrill_rating: 8,
                                  amusement_park_id: @park_1.id)

    visit "/mechanics/#{@mechanic.id}"

    fill_in :add_ride, with: ride_4.name

    click_button("Submit")

    expect(current_page).to eq("/mechanics/#{@mechanic.id}")

    within '.rides' do
      expect(page).to have_content(@ride_4.name)
    end
  end
end
