class Place < ActiveRecord::Base
  validates_presence_of :name, :address

  def random
    @place = Place.first(:order=> "RANDOM()")
  end
end
