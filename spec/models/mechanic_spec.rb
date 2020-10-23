require 'rails_helper'

describe Mechanic, type: :model do
  describe "relationships" do
    it {should have_many(:mechanic_rides)}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  describe "instance methods" do
    it "can alphabetize rides" do
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
      @ride_3 =          Ride.create(name: "Kiss Raise",
                                     thrill_rating: 7,
                                     amusement_park_id: @park_1.id)
      @mech_ride_1 = MechanicRide.create(mechanic_id: @mechanic.id,
                                         ride_id: @ride_1.id)
      @mech_ride_2 = MechanicRide.create(mechanic_id: @mechanic.id,
                                         ride_id: @ride_2.id)
      @mech_ride_2 = MechanicRide.create(mechanic_id: @mechanic.id,
                                         ride_id: @ride_3.id)

      expect(@mechanic.alphabetized_rides).to eq([@ride_2, @ride_3, @ride_1])
    end
  end
end
