class Pelicula < ApplicationRecord
	validates :name, presence: true 
	validates :name, presence: { message: "introducir campo"}
	validates :name, length: { minimum: 2, message:'nombre invalido minimo 2 caracteres' } 	
	validates :rating, presence: true 
	validates :rating, numericality: { only_integer: true, 
									less_than_or_equal_to: 10, 
									message: "Este campo es numerico"
									}
	validates :rating, presence: { message: "insertar un numero entero entre 0-10"}  
	validates :main_actor, presence: true  
	validates :main_actor, length: { in: 2..30 }
	validates :launching, presence: true 
	validates :launching, format: {
									with: /(19|20)\d{2}/i, 
									message: "insertar 4 digitos, ej: 2000 "
									}
	validates :launching, numericality: {
									only_integer: true,
									message: "entero mayor o igual 1980 "
									} 
	validates :Synopsis, presence: { message: "introducir campo"}
	validates :Synopsis, presence: { in: 2..300 }

	
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/ 
	
	


end
