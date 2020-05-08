
object ludmila {
	method precioPactadoPorKm() { return 18 }
}

object anaMaria {
	var estaEstable = true
	// forma 1
	method estadoEstabilidad(booleano) { estaEstable = booleano }
	// forma 2
	method estabilizarse() { estaEstable = true }
	method desestabilizarse() { estaEstable = false }
	// forma 3
	method cambiarEstabilidad() { estaEstable = not estaEstable }
	
	method precioPactadoPorKm() {
		if (estaEstable) { return 30 } else { return 25 } 
	}
}


object anaMaria_variante {
	var estado = estadoEstable

	method cambiarEstado(nuevoEstado) { estado = nuevoEstado }
	
	method precioPactadoPorKm() {
		return estado.precioPactadoPorKm() 
	}
}

object estadoMillonaria {
	method precioPactadoPorKm() { return 50 }
}

object estadoEstable {
	method precioPactadoPorKm() { return 30 }
}

object estadoInestable {
	method precioPactadoPorKm() { return 25 }
}


object teresa {
	var precioPactado = 22
	method cambiarPrecio(nuevoPrecio) { precioPactado = nuevoPrecio }
	method precioPactadoPorKm() { return precioPactado }
}


object melina {
	var paraQuienEstaTrabajando
	
	method estaTrabajandoPara(quien) { paraQuienEstaTrabajando = quien }
	method paraQuienTrabaja() { return paraQuienEstaTrabajando }
	method precioPactadoPorKm() { 
		return paraQuienEstaTrabajando.precioPactadoPorKm() - 3
	}
}


















