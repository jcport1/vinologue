class CreateReviews < ActiveRecord::Migration
  def change
    
    create_table :reviews do |t|
      t.string :wine_name 
      t.integer :rating
      t.string :comment
      t.integer :user_id
      t.integer :wine_id
    end 
  end
end
