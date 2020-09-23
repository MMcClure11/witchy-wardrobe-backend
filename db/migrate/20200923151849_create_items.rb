class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :color
      t.string :image
      t.float :cost
      t.integer :times_used
      t.references :category, null: false, foreign_key: true
      t.date :date_purchased
      t.string :manufacture_location
      t.string :store

      t.timestamps
    end
  end
end
