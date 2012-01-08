class AddConformableFieldsToUsers < ActiveRecord::Migration
  def change
    # adds the specified columns to the users table (db:migrate)
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
  end
end
