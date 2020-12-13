class CreateWineTypes < ActiveRecord::Migration
  def change
    create_table :wine_types do |t|
      t.string :name 
    end 
  end
end
