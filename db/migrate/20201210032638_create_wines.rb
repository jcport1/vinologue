class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.integer :year
      t.string :varietal
      t.string :wine_style
      t.string :note
    end 
  end
end
