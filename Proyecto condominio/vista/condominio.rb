require 'date'
require "../controlador/factory.rb"

$arregloDepartamento = Array.new
$arregloFamilia = Array.new
$arregloVisita = Array.new
$arregloServicio = Array.new
$arregloCondominio = Array.new

def MenuPrincipal()
	begin
		system("cls")
		puts"//////////////////////////////////////////////////////"
		puts"********** CONDOMINIO PRADOS DE LA TOSCANA **********"
		puts"//////////////////////////////////////////////////////"
		puts"1. Registrar departamento"
		puts"2. Registrar servicio"
		puts"3. Registrar familiares"
		puts"4. Registrar visitas"
		puts"5. Registrar pagos de servicios"
		puts"6. Consultar visitas"
		puts"7. Consultar servicios"
		puts"8. Consultar deudores de servicios"
		puts"9. Salir"
		puts"Seleccione una opcion: "
		opcion = gets.chomp.to_i
	end until(opcion>=1 and opcion<=9)
	case opcion
		when 1
			registrarDepartamento()
		when 2
			registrarServicio()
		when 3
			registrarFamiliares()
		when 4
			registrarVisitas()
		when 5
			registrarPagosServicios()
		when 6
			listarVisitas()
		when 7
			listarPagosServicios()
		when 8
			listarDeudores()
		when 9
			salida()
	end
end
def registrarDepartamento()
	system("cls")
	puts"////////////////////////////////////////////"
	puts"|||||||||| REGISTRAR DEPARTAMENTO ||||||||||"
	puts"////////////////////////////////////////////"
	puts"Ingrese numero departamento: "
	puts"-----------------------------"
	numero = gets.chomp
	puts"Ingrese dni: "
	puts"-------------"
	dni = gets.chomp
	puts"Ingrese nombre: "
	puts"----------------"
	nombre = gets.chomp
	puts"Ingrese apellido: "
	puts"------------------"
	apellido = gets.chomp
	obj = Factory.crearDepartamento(numero,dni,nombre,apellido)
	$arregloDepartamento.push(obj)
	puts
	puts"--------------------------"
	puts "Departamento Registrado!"
	puts"--------------------------"
	puts 
	puts"¿Desea registrar otro Departamento?(si/no): "
	puts"--------------------------------------------"
	m = gets.chomp
		if m == "si"
			puts
			system("pause")
			registrarDepartamento()
		end
	system("pause")
	MenuPrincipal()
end

def registrarServicio()
	system("cls")
	puts"////////////////////////////////////////////"
	puts"|||||||||||| REGISTRAR SERVICIO ||||||||||||"
	puts"////////////////////////////////////////////"
	puts"Ingrese tipo: "
	puts"--------------"
	tipo = gets.chomp
	puts"Ingrese descripcion: "
	puts"---------------------"
	descripcion = gets.chomp
	puts"Ingrese monto: "
	puts"---------------"
	monto = gets.chomp
	puts"Ingrese fVencimiento(AAAA/MM/DD): "
	puts"----------------------------------"
	fVencimiento = gets.chomp
	obj = Factory.crearServicio(tipo,descripcion,monto,fVencimiento)
	$arregloServicio.push(obj)
	puts
	puts"---------------------"
	puts "Servicio Registrado!"
	puts"---------------------"
	puts 
	puts"¿Desea registrar otro servicio?(si/no): "
	puts"----------------------------------------"
	m = gets.chomp
		if m == "si"
			puts
			system("pause")
			registrarServicio()
		end
	system("pause")
	MenuPrincipal()	
end

def registrarFamiliares()
	system("cls")
	puts"//////////////////////////////////////////////"
	puts"|||||||||||| REGISTRAR FAMILIARES ||||||||||||"
	puts"//////////////////////////////////////////////"
	puts"Ingrese numero departamento: "
	puts"-----------------------------"
	numero = gets.chomp
	departamento = $arregloDepartamento.find_all{|d| d.numero == numero}
	if(departamento == [])
		puts "El numero ingresado no se encuentra"
		system("pause")
		puts
		MenuPrincipal()
	end
	puts"Ingrese dni: "
	puts"-------------"
	dni = gets.chomp
	puts"Ingrese nombre: "
	puts"----------------"
	nombre = gets.chomp
	puts"Ingrese apellido: "
	puts"------------------"
	apellido = gets.chomp
	puts"Ingrese parentesco: "
	puts"--------------------"
	parentesco = gets.chomp
	obj = Factory.crearFamilia(numero,dni,nombre,apellido,parentesco)
	$arregloFamilia.push(obj)
	puts
	puts"--------------------"
	puts "Persona Registrada!"
	puts"--------------------"
	puts
	puts"¿Desea registrar otra persona?(si/no): "
	puts"---------------------------------------"
	m = gets.chomp
		if m == "si"
			puts
			system("pause")
			registrarFamiliares()
		end
	system("pause")
	MenuPrincipal()	
end

def registrarVisitas()
	system("cls")
	puts"///////////////////////////////////////////"
	puts"|||||||||||| REGISTRAR VISITAS ||||||||||||"
	puts"///////////////////////////////////////////"
	puts"Ingrese numero departamento: "
	puts"-----------------------------"
	numero = gets.chomp
	departamento = $arregloDepartamento.find_all{|d| d.numero == numero}
	if(departamento == [])
		puts "El numero ingresado no se encuentra"
		system("pause")
		puts
		MenuPrincipal()
	end
	puts"Ingrese dni: "
	puts"-------------"
	dni = gets.chomp
	puts"Ingrese nombre: "
	puts"----------------"
	nombre = gets.chomp
	puts"Ingrese apellido: "
	puts"------------------"
	apellido = gets.chomp
	puts"Tiene autorizacion(si/no): "
	puts"---------------------------"
	autorizacion = gets.chomp
		if autorizacion == "si"
			puts "Adelante, puede ingresar"
		else autorizacion == "no"
			puts "Lo sentimos, no tiene autorizacion para ingresar"
		end
	fVisita = DateTime.now()
	puts
	puts"----------------------------"
	puts "Fecha de Visita Registrada"
	puts"---------------------------" 
	puts "#{(fVisita).strftime("%d/%m/%Y %I:%M %p")}"
	obj = Factory.crearVisita(numero,dni,nombre,apellido,fVisita,autorizacion)
	$arregloVisita.push(obj)
	puts
	system("pause")
	MenuPrincipal()	
end

def registrarPagosServicios()
	system("cls")
	puts"//////////////////////////////////////////////////////"
	puts"|||||||||||| REGISTRAR PAGOS DE SERVICIOS ||||||||||||"
	puts"//////////////////////////////////////////////////////"
	puts"Ingrese numero departamento: "
	puts"-----------------------------"
	numero = gets.chomp
	departamento = $arregloDepartamento.find_all{|d| d.numero == numero}
	if(departamento == [])
		puts "El numero ingresado no se encuentra"
		system("pause")
		puts
		MenuPrincipal()
	end
	puts "Ingrese tipo de servicio: "
	puts"---------------------------"
	tipo = gets.chomp
	servicio = $arregloServicio.find_all{|s| s.tipo == tipo}
	if(servicio == [])
		puts "El servicio ingresado no se encuentra"
		puts
		system("pause")
		puts
		MenuPrincipal()
	end
	item = [departamento[0],servicio[0]]
	$arregloCondominio.push(item)
	puts
	puts "Se ha registrado el Pago del Departamento #{departamento[0].numero} por concepto de #{servicio[0].tipo}!"
	system("pause")
	MenuPrincipal()	
end
def listarVisitas()
	system("cls")
	puts"///////////////////////////////////////////////////"
	puts"|||||||||||| CONSULTA LISTA DE VISITAS ||||||||||||"
	puts"///////////////////////////////////////////////////"
	msj = "********** NO SE ENCONTRARON COINCIDENCIAS **********"
	puts "Ingrese busqueda: "
	puts"-------------------"
	dat = gets.chomp
	for p in $arregloVisita			
			print "Numero".ljust(7)
			print "DNI".ljust(10)
			print "Nombre".ljust(10)
			print "Apellido".ljust(10)
			print "Fecha Visita".ljust(20)
			print "Autorizadoo".ljust(10)
			puts
		if p.dni == dat
			msj = ""
			$arregloVisita.each do |item|
				print "#{item.numero}".ljust(7)
				print "#{item.dni}".ljust(10)
				print "#{item.nombre}".ljust(10)
				print "#{item.apellido}".ljust(10)
				print "#{(item.fVisita).strftime("%d/%m/%Y %I:%M %p")}".ljust(20)
				print "#{item.autorizacion}".ljust(15)
				puts
			end		
		elsif p.numero == dat
			msj = ""
			$arregloVisita.each do |item|
				print "#{item.numero}".ljust(7)
				print "#{item.dni}".ljust(10)
				print "#{item.nombre}".ljust(10)
				print "#{item.apellido}".ljust(10)
				print "#{(item.fVisita).strftime("%d/%m/%Y %I:%M %p")}".ljust(20)
				print "#{item.autorizacion}".ljust(15)
				puts
			end
		elsif (p.fVisita).strftime("%d/%m/%Y") == dat
			msj = ""
			$arregloVisita.each do |item|
				print "#{item.numero}".ljust(7)
				print "#{item.dni}".ljust(10)
				print "#{item.nombre}".ljust(10)
				print "#{item.apellido}".ljust(10)
				print "#{(item.fVisita).strftime("%d/%m/%Y %I:%M %p")}".ljust(20)
				print "#{item.autorizacion}".ljust(15)
				puts
			end			
		end
	end
	puts msj
	system("pause")
	MenuPrincipal()
end

def listarPagosServicios()
	system("cls")
	puts"////////////////////////////////////////////////////"
	puts"|||||||||||| CONSULTA PAGOS DE SERVICIO ||||||||||||"
	puts"////////////////////////////////////////////////////"
	puts "Ingrese busqueda: "
	puts"-------------------"
	dat = gets.chomp
	print "Numero".ljust(7)
	print "DNI".ljust(10)
	print "Nombre".ljust(10)
	print "Apellido".ljust(10)
	print "Tipo".ljust(10)
	print "Descripcion".ljust(15)
	print "Monto".ljust(7)
	print "Vencimiento".ljust(10)
	puts
	$arregloCondominio.each do |item|
		if (item[0].dni == dat)
			print "#{item[0].numero}".ljust(7)
			print "#{item[0].dni}".ljust(10)
			print "#{item[0].nombre}".ljust(10)
			print "#{item[0].apellido}".ljust(10)
			print "#{item[1].tipo}".ljust(10)
			print "#{item[1].descripcion}".ljust(15)
			print "#{item[1].monto}".ljust(7)
			print "#{item[1].fVencimiento}".ljust(10)
			puts
		elsif(item[0].numero == dat)
			print "#{item[0].numero}".ljust(7)
			print "#{item[0].dni}".ljust(10)
			print "#{item[0].nombre}".ljust(10)
			print "#{item[0].apellido}".ljust(10)
			print "#{item[1].tipo}".ljust(10)
			print "#{item[1].descripcion}".ljust(15)
			print "#{item[1].monto}".ljust(7)
			print "#{item[1].fVencimiento}".ljust(10)
			puts
		end
	end	
	system("pause")
		MenuPrincipal()
end

def listarDeudores()
	system("cls")
	puts"///////////////////////////////////////////////////////"
	puts"|||||||||||| CONSULTA DEUDORES DE SERVICIO ||||||||||||"
	puts"///////////////////////////////////////////////////////"
	puts "Ingrese busqueda: "
	puts"-------------------"
	dat = gets.chomp
	print "Numero".ljust(7)
	print "DNI".ljust(10)
	print "Nombre".ljust(10)
	print "Apellido".ljust(10)
	print "Tipo".ljust(10)
	print "Descripcion".ljust(15)
	print "Monto".ljust(7)
	print "Vencimiento".ljust(10)
	puts
	$arregloCondominio.each do |item|
		if (item[1].fVencimiento < dat)
			print "#{item[0].numero}".ljust(7)
			print "#{item[0].dni}".ljust(10)
			print "#{item[0].nombre}".ljust(10)
			print "#{item[0].apellido}".ljust(10)
			print "#{item[1].tipo}".ljust(10)
			print "#{item[1].descripcion}".ljust(15)
			print "#{item[1].monto}".ljust(7)
			print "#{item[1].fVencimiento}".ljust(10)
			puts
		end
	end
	system("pause")
		MenuPrincipal()
end

def salida()
	i = 0
	while i <1 
		puts "Gracias por la atención prestada"
		i = i + 1
		sleep(2)
	end
	
end
MenuPrincipal()
=begin
d1 = crearDepartamento.new("A","101",10101010,"Juan","Perez")
d2 = Departamento.new("A","102",20202020,"Ramon","Flores")
d3 = Departamento.new("B","103",30303030,"Andres","Roca")
d4 = Departamento.new("C","204",40404040,"Reina","Diaz")
d5 = Departamento.new("D","105",50505050,"Olaf","Gudsen")
d6 = Departamento.new("E","306",60606060,"Rebeca","Suarez")
d7 = Departamento.new("E","101",70707070,"Paul","Walker")

d = $arregloDepartamento
d.push(d1)
d.push(d2)
d.push(d3)
d.push(d4)
d.push(d5)
d.push(d6)

s1 = Servicio.new("luz","001",23)

s = $arregloServicio
s.push(s1)
#s1 = 

c = $arregloCondominio
$arregloCondominio.push(d1,s1)
#tipo,bloque,numero
=end


