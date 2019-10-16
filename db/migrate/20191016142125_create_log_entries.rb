class CreateLogEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :log_entries do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
    add_index :log_entries, [:user_id, :created_at]
  end
end
