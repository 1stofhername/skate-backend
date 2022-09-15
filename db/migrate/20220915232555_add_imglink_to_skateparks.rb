class AddImglinkToSkateparks < ActiveRecord::Migration[6.1]
  def change
    add_column :skateparks, :imglink, :string
  end
end
