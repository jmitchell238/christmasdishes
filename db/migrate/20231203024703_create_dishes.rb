class CreateDishes < ActiveRecord::Migration[7.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :dish
      t.text :comments

      t.timestamps
    end
  end
end
