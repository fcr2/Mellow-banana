class Setting < ApplicationRecord
  belongs_to :user

  validates :country, presence: { message:"Obligatory field"}  
  validates :language, presence: { message:"Obligatory field"}

  CLASS_LIST = ["Catalinia", "Spain", "France", "Germany", "England", "Denmark", "other"]

  CLASS_LIST1 = ["Catalan", "Spanish", "French", "German", "English", "Danish", "other"]
end
