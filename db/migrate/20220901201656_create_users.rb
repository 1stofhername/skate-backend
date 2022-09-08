class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.integer :category_id
      t.integer :skatepark_id
      t.boolean :checkedIn
    end
  end
end
