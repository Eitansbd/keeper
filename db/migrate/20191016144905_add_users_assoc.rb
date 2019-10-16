class AddUsersAssoc < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :log_entries, :users
  end
end
