class FishingTrip < ApplicationRecord
  belongs_to :user
  has_many :fish_catches
  
  validates_presence_of :title, :content, :weather, :body_of_water, :location,
                        :date, :start_time, :end_time
                        
  validate :end_after_start

  scope :recent, -> { eager_load(:user).order(created_at: :desc).limit(5) }
  
  def end_after_start
    if start_time && end_time && start_time >= end_time
      errors.add(:end_time, "must be after start time")
    end
  end
end
