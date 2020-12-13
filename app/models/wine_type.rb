class WineType < ActiveRecord::Base
    
    has_many :wines
    has_many :users, through: :wine 
end 