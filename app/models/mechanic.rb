class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def alphabetized_rides
    rides.order(:name)
  end
end
