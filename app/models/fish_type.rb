class FishType < ApplicationRecord
  has_many :fish_catches, dependent: :destroy
  
  validates_presence_of :record_length, :record_weight
  
  def top_fish(limit, field = :weight)
    fish_catches.order(field => :desc).limit(limit)
  end
end
