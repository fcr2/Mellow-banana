class Comment < ApplicationRecord
  belongs_to :pelicula
  belongs_to :user
end
