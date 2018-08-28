
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
		return 50.min(cliente.precioPactadoPorKm() * kms)
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
	
	method intercambiarChoferes() {
		// versión "clásica"
		const recuerdoPrimero = choferPrimeraOpcion
		choferPrimeraOpcion = choferSegundaOpcion
		choferSegundaOpcion = recuerdoPrimero
		
		// versión "objetosa"
		// self.asignarChoferes(choferSegundaOpcion, choferPrimeraOpcion)
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