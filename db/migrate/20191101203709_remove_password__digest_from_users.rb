class RemovePasswordDigestFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :password__digest, :string
    remove_column :users, :text, :string
  end
end
