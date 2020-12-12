class Wine < ActiveRecord::Base

   has_many :reviews
   has_many :users, through: :reviews 

   # validates :name, :year, :varietal, :wine_style, presence: true 

end 