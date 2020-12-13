class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.integer :year
      t.string :varietal
      t.integer :rating
      t.string :comment
      t.integer :user_id
      t.integer :wine_type_id
    end 
  end
end
