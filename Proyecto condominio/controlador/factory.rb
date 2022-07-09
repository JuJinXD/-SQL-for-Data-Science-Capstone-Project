require "../modelo/servicios.rb"
require "../modelo/departamento.rb"
class Factory
	def self.crearDepartamento(numero,dni,nombre,apellido)
		obj = Departamento.new(numero,dni,nombre,apellido)
		return obj
	end

	def self.crearFamilia(numero,dni,nombre,apellido,parentesco)
		obj = Familia.new(numero,dni,nombre,apellido,parentesco)
		return obj
	end

	def self.crearVisita(numero,dni,nombre,apellido,fVisita,autorizacion)
		obj = Visita.new(numero,dni,nombre,apellido,fVisita,autorizacion)
		return obj
	end

	def self.crearServicio(tipo,descripcion,monto,fVencimiento)
		obj = Servicio.new(tipo,descripcion,monto,fVencimiento)
		return obj
	end
end