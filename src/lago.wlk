import wollok.game.*

object lago {
	const lago = #{}
	method posicionesLago() = lago
	
	method agregarAgua(unaPosicion){
		const agua = new Agua(posicion = unaPosicion) 
		lago.add(agua.position())
	}

	method generarEnPosicion(posicionDeY){
		self.agregarAgua(game.at(0, posicionDeY))
	}
	
	method image() = "zanahoria.png"
	
	method position(){}
}

class Agua{
	var posicion	
	method position() = posicion
}