import clientes.*

object roxana {
	method precioViaje(cliente, kms) {
		return cliente.precioPactadoPorKm() * kms
	}
}

object gabriela {
	method precioViaje(cliente, kms) {
		return cliente.precioPactadoPorKm() * kms * 1.2
	}
}

object mariela {
	
	method precioViaje(cliente, kms) {
		const precioMinimo = 50
		const precio = cliente.precioPactadoPorKm() * kms
		return precioMinimo.max(precio) 
	}
}

object juana {
	method precioViaje(cliente, kms) {
		return (if (kms <= 8) { 100 } else { 200 })
	}
}










object lucia {
	var aQuienEstaReemplazando

	method estaReemplazandoA(quien) { aQuienEstaReemplazando = quien }
	method precioViaje(cliente, kms) {
		return aQuienEstaReemplazando.precioViaje(cliente, kms)
	}
}

























object oficina {
	var choferPrimeraOpcion
	var choferSegundaOpcion

	method asignarChoferes(primero, segundo) {
		choferPrimeraOpcion = primero
		choferSegundaOpcion = segundo
	}

	method cambiarPrimerChoferPor(fercho) { choferPrimeraOpcion = fercho }
	method cambiarSegundoChoferPor(fercho) { choferSegundaOpcion = fercho }

	method choferPrimeraOpcion() {
		return choferPrimeraOpcion
	}

	method choferSegundaOpcion() {
		return choferSegundaOpcion
	}




	method intercambiarChoferes_variante() {
		self.asignarChoferes(choferSegundaOpcion, choferPrimeraOpcion)
	}


	method intercambiarChoferes() {
		// versión "clásica"
		const pivot = choferPrimeraOpcion
		choferPrimeraOpcion = choferSegundaOpcion
		choferSegundaOpcion = pivot
	}

	method intercambiarChoferes_mal() {
		choferPrimeraOpcion = choferSegundaOpcion
		choferSegundaOpcion = choferPrimeraOpcion
	}









	method choferElegidoParaViaje(cliente, kms) {
		const precioPrimerChofer = choferPrimeraOpcion.precioViaje(cliente, kms)
		const precioSegundoChofer = choferSegundaOpcion.precioViaje(cliente, kms)
		if (precioSegundoChofer < precioPrimerChofer - 30) {
			return choferSegundaOpcion
		} else {
			return choferPrimeraOpcion
		}
	}
}


//		return 50.max(cliente.precioPactadoPorKm() * kms)
