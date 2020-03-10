class Channel < ApplicationRecord
  # Associations
  has_many :tv_shows
  
  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
