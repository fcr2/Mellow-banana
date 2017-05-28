class Pelicula < ApplicationRecord
	validates :name, presence: true 
	validates :name, presence: { message: "introducir campo"}
	validates :name, length: { minimum: 2, message:'nombre invalido minimo 2 caracteres' } 	
	validates :stars, presence: true 
	validates :stars, numericality: { only_integer: true, 
									less_than_or_equal_to: 10, 
									message: "Este campo es numerico"
									}
	validates :stars, presence: { message: "insertar un numero entero entre 0-10"}  
	validates :main_actor, presence: true  
	validates :main_actor, length: { in: 2..30 }	
	validates :main_actor, format: { with: /\A[a-zA-Z]+\z/,
									message:"escribir nombre y apellido sin espacio "
									} 
	validates :year, presence: true 
	validates :year,
		format: {
			with: /(19|20)\d{2}/i, 
			message: "insertar 4 digitos, ej: 2000 "
		}
	validates :year,
		numericality: {
			only_integer: true,
			greater_than_or_equal_to: 1980,
			less_than_or_equal_to: Date.today.year,
			message: "entero mayor o igual 1980 hasta año actual"
		} 

end
