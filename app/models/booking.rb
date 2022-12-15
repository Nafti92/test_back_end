class Booking < ApplicationRecord
  belongs_to :listing

  after_create_commit :create_first_checkin

  private
  def create_first_checkin
    self.listing
    listing.missions.create!(
      listing_id: listing.id,
      mission_type: :first_checkin,
      date: start_date.to_s,
      price: 10 * listing.num_rooms
    )
  end

  def create_last_checkin
    self.listing
    listing.missions.create!(
      listing_id: listing.id,
      mission_type: :last_checkin,
      date: end_date.to_s,
      price: 10 * listing.num_rooms
    )
  end
end
