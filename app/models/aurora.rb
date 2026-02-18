class Aurora < ApplicationRecord
  validates :latitude, :longitude, presence: true
  validates :session_token, presence: true

  has_one_attached :photo

  scope :recent, -> { order(submitted_at: :desc) }
  scope :nearby, ->(lat, lng, km = 500) {
    where("(latitude - ?) BETWEEN -? AND ? AND (longitude - ?) BETWEEN -? AND ?",
      lat, km/111.0, km/111.0, lng, km/111.0, km/111.0)
  }
end
