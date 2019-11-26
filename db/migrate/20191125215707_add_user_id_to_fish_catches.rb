class AddUserIdToFishCatches < ActiveRecord::Migration[5.0]
  def change
    add_reference :fish_catches, :user, foreign_key: true
  end
end
