
object ludmila {
	method precioPactadoPorKm() { return 18 }
}

object anaMaria {
	method precioPactadoPorKm() { return 30 }
}

object teresa {
	method precioPactadoPorKm() { return 22 }
}

object melina {
	var paraQuienEstaTrabajando
	
	method estaTrabajandoPara(quien) { paraQuienEstaTrabajando = quien }
	method precioPactadoPorKm() { 
		return paraQuienEstaTrabajando.precioPactadoPorKm() - 3
	}
}