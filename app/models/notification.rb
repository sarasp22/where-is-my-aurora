class Notification < ApplicationRecord
  validates :message, presence: true
end
