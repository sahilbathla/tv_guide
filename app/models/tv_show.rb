class TvShow < ApplicationRecord
  # Constants
  WEEK_RANGE = (0..6)

  # Associations
  belongs_to :channel
  has_many :favorite_tv_shows
  
  # Validations
  validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :channel_id, :start_at, :end_at, presence: true
  validates :repeats_on, presence: true
  
  validate :start_at_and_end_at_valid?
  validate :repeats_on_in_correct_weekday_range?

  scope :favorite, -> (user) { joins(:favorite_tv_shows).where('favorite_tv_shows.user_id = ?', user.id) }

  scope :searchable, -> (query) do
    includes(:channel).joins(:channel).where('channels.name LIKE :query OR tv_shows.name LIKE :query', query: "%#{query}%")
  end
  
  private
  
  def repeats_on_in_correct_weekday_range?
    is_incorrect_weekday = (repeats_on || '').split(',').uniq.any? { |wday| !wday.to_i.in?(WEEK_RANGE) }
    errors.add(:repeats_on, I18n.t('tv_shows.incorrect_repeating_day')) if is_incorrect_weekday
  end
  
  def start_at_and_end_at_valid?
    errors.add(:repeats_on, I18n.t('tv_shows.incorrect_timings')) unless Time.parse(start_at) < Time.parse(end_at)
  end
end
