import wollok.game.*
import juego.*

class Elemento {
	var image
	var position

	method interaccionConPersonaje(unPersonaje){
		unPersonaje.agarrarElemento(self)
	}	
	
	method image() = image
	
	method position() = position
	
	method reproducirSonidoDeAccion() {
		juego.reproducirSonido("sonidoMorder.mp3")
	}
}

object zanahoria inherits Elemento{
	override method position() = game.at(11,1)

	override method image() = "zanahoria.png"

	method posicionVisual() = game.at(0, 19)
}

object manzana inherits Elemento {
	override method position() = game.at(13,1)

	override method image() = "manzana.png"

	method posicionVisual() = game.at(1, 19)
}

object matienzo inherits Elemento{
	override method position() = game.at(15,1)
	
	override method image() = "mate.png"
	
	method posicionVisual() = game.at(2, 19)
	
	override method reproducirSonidoDeAccion() {
		juego.reproducirSonido("ruidoDeMate.mp3")
	}
}

object birra inherits Elemento{
	override method position() = game.at(19,1)
	//cambiar la foto!!
	override method image() = "cerveza.png"
	
	method posicionVisual() = game.at(4, 19)
	
	override method reproducirSonidoDeAccion() {
		juego.reproducirSonido("audioBirra.mp3")
	}
}

object baguette inherits Elemento{
	override method position() = game.at(17,1)
	
	override method image() = "baguette.png"
	
	method posicionVisual() = game.at(3, 19)
	
	override method reproducirSonidoDeAccion() {
		juego.reproducirSonido("sonidoMorder.mp3")
	}
}
