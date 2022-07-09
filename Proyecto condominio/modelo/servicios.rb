require "../modelo/departamento.rb"
class Servicio
	attr_accessor :tipo,:descripcion,:monto,:fVencimiento
	def initialize(tipo,descripcion,monto,fVencimiento)
		@tipo,@descripcion,@monto,@fVencimiento = tipo,descripcion,monto,fVencimiento
	end
end