import wollok.game.*

object lago {
	const superficiesDeAgua = #{}
	
	method superficiesDeAgua() = superficiesDeAgua
	
	method agregarAgua(unaPosicion, unaImagen){
		const agua = new Agua(imagen = unaImagen, posicion = unaPosicion)
		superficiesDeAgua.add(agua)
		game.addVisual(agua)
		agua.determinarColision()
	}
	
	method generarBordeSuperior() {
		self.agregarAgua(game.at(0,16), "lagoSuperior.png")
	}
	
	method generarBordeInferior() {
		self.agregarAgua(game.at(0,3), "lagoInferior.png")
	}

	method generarBordeIntermedio(posicionDeY){
		self.agregarAgua(game.at(0, posicionDeY), "lagoMedio.png")
	}

	method generar() {
		self.generarBordeSuperior()
		12.times({ i => self.generarBordeIntermedio(i+3)})
		self.generarBordeInferior()
	}
}

class Agua{
	var posicion	
	var imagen
	
	method position() = posicion
	
	method image() = imagen

	method determinarColision() {
		game.onCollideDo(self, {visualColisionado => visualColisionado.interaccionConAgua()})
	}
	
	method interaccionConPersonaje() {
		// Vacio para que no se rompa el polimorfismo 
	}
}