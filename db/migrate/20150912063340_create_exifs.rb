class CreateExifs < ActiveRecord::Migration
  def change
    create_table :exifs do |t|
      t.string :camera
      t.string :software
      t.integer :iso
      t.string :shutter
      t.string :aperture
      t.datetime :taken
      t.string :exposure_bias
      t.boolean :flash
      t.string :focal_length
      t.string :lens
      t.references :image, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
