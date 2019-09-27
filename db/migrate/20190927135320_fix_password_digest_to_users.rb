class FixPasswordDigestToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :password__digests
    add_column :users, :password_digest, :string
  end
end
