class CreateSkateparks < ActiveRecord::Migration[6.1]
  def change
    create_table :skateparks do |t|
      t.string :name
      t.string :avatar
      t.string :location
      t.integer :user_id
    end
  end
end
