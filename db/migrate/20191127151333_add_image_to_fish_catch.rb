class AddImageToFishCatch < ActiveRecord::Migration[5.0]
  def change
    add_attachment :fish_catches, :image
  end
end
