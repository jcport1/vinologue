class User < ActiveRecord::Base

    has_secure_password #validates password built-in
    has_many :wines
    has_many :wine_types, through: :wines 

    validates :user_name, :email, presence: true 
    validates :email, uniqueness: true 
   
end 