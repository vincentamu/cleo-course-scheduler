class Track < ApplicationRecord
  self.primary_key = :tid

  has_many :courses

  validates :track_name, presence: true, length: { maximum: 255 }
end