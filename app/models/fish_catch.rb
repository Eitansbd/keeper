class FishCatch < ApplicationRecord
  belongs_to :user
  belongs_to :fishing_trip, optional: true
  belongs_to :fish_type
  
  has_attached_file :image, styles: {
    square_sm: '100x100#',
    square_md: '200x200#',
    large: 'x480'
  }, default_url: "/images/:style/smile-emoji.png"
  
  validates_attachment_content_type :image, content_type: /\Aimage/
  validates_attachment_presence :image
  
  validates :weight, numericality: { greater_than: 0 }
  validates :length, numericality: { greater_than: 0 }
  validate :below_world_record, if: [:weight, :length]
  
  def below_world_record
    if weight > fish_type.record_weight || length > fish_type.record_length
      errors.add(:base, "Cmon, it wasn't that big. That's world record class!")
    end
  end
  
  def self.find_top_fish(sort, limit, type = nil, user_id = nil)
    where_options = {}
    where_options[:fish_type_id] = type if type
    where_options[:user_id] = user_id if user_id
    FishCatch.where(where_options).order(sort => :desc).limit(limit)
  end

end