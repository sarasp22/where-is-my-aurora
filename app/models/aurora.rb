class Aurora < ApplicationRecord
  validates :latitude, :longitude, presence: true
  validates :session_token, presence: true

  has_one_attached :photo

  scope :recent, -> { order(submitted_at: :desc) }
  scope :active, -> { where("submitted_at > ?", 30.minutes.ago) }
end
