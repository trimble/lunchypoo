class Place < ActiveRecord::Base
  validates_presence_of :name, :address
  geocoded_by :address
  after_validation :geocode
end
