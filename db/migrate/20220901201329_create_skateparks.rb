class Skateparks < ActiveRecord::Migration[6.1]
  def change
    create_table :skateparks do |t|
      t.string :name
      t.string :avatar
      t.string :location
    end
  end
end
