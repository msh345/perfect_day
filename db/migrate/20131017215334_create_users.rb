class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :user_type
      t.integer :home_id
      t.timestamps
    end
  end
end
