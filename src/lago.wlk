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
		self.agregarAgua(game.at(0,19), "lagoSuperior.png")
	}
	
	method generarBordeInferior() {
		self.agregarAgua(game.at(0,0), "lagoInferior.png")
	}

	method generarBordeIntermedio(posicionDeY){
		self.agregarAgua(game.at(0, posicionDeY), "lagoMedio.png")
	}

	method generar() {
		//falta modificar el fondo.png
		self.generarBordeSuperior() //linea 16
		12.times({ i => self.generarBordeIntermedio(i+3)})
		self.generarBordeInferior() //linea 3
	}
}

class Agua{
	var posicion	
	var imagen
	
	method position() = posicion
	
	method image() = imagen

	method atrapado() {
		
	}

	method determinarColision() {
		game.onCollideDo(self, {visualColisionado => visualColisionado.interaccionConAgua()})
	}
	method interaccionConAgua() {
		// Vacio para que no se rompa el polimorfismo 
	}

	method interaccionConPersonaje(unPersonaje) {
		// No hace nada
	}
}