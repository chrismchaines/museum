class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string :title
      t.string :year
      t.string :style
      t.string :image
      t.references :artist
      t.references :gallery

      t.timestamps null: false
    end
  end
end
