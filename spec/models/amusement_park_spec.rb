require 'rails_helper'

describe AmusementPark, type: :model do
  describe "relationships" do
    it {should have_many(:rides)}
  end

  describe "instance methods" do
    before :each do
      @park_1 = AmusementPark.create(name: "Hershey Park",
                                     admission: 50.00)
      @ride_1 =          Ride.create(name: "Lightning Racer",
                                     thrill_rating: 9,
                                     amusement_park_id: @park_1.id)
      @ride_2 =          Ride.create(name: "Storm Runner",
                                     thrill_rating: 7,
                                     amusement_park_id: @park_1.id)
      @ride_3 =          Ride.create(name: "The Great Bear",
                                     thrill_rating: 10,
                                     amusement_park_id: @park_1.id)
    end

    it "can find average thrill rating" do
        expect(@park_1.average_thrill_rating.to_f.round(1)).to eq(8.7)
    end
  end
end
