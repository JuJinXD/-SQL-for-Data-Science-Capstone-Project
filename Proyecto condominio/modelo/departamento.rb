class Departamento
	attr_accessor :numero,:dni,:nombre,:apellido,:parentesco,:fVisita,:autorizacion
	def initialize(numero,dni,nombre,apellido)
		@numero,@dni,@nombre,@apellido = 
		numero,dni,nombre,apellido
	end
end

class Familia < Departamento
	def initialize(numero,dni,nombre,apellido,parentesco)
		super(numero,dni,nombre,apellido)
		@parentesco=parentesco
	end
end

class Visita < Departamento
	def initialize(numero,dni,nombre,apellido,fVisita,autorizacion)
		super(numero,dni,nombre,apellido)
		@fVisita,@autorizacion=fVisita,autorizacion
	end
end