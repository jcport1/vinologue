class CreateUsers < ActiveRecord::Migration

  def change
    create_table :users do |t|
    t.string :first_name
    t.string :user_name
    t.string :email
    t.string :password_digest
    t.string :favorite_wine 
    end 
  end
end
