class Core < ApplicationRecord
  self.primary_key = :core_id

  has_many :courses

  validates :core_name, presence: true, length: { maximum: 255 }
end