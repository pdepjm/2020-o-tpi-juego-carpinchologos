import wollok.game.*

object lago {
	const superficiesDeAgua = #{}
	
	method superficiesDeAgua() = superficiesDeAgua
	
	method agregarAgua(unaPosicion, unaImagen){
		const agua = new Agua(imagen = unaImagen, posicion = unaPosicion)
		superficiesDeAgua.add(agua)
		game.addVisual(agua)
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
}

class Agua{
	var posicion	
	var imagen
	
	method position() = posicion
	
	method image() = imagen
	
	method atrapado() {
		
	}
	method interaccionConCarpincho(carpincho) {
		//game.stop() 
		carpincho.desaparecer()
	}
}