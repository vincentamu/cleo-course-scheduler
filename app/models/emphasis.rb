class Emphasis < ApplicationRecord
  self.primary_key = :emphasis_id

  has_many :courses

  validates :emphasis_name, presence: true, length: { maximum: 255 }
end