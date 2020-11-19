import wollok.game.*
import juego.*
import personaje.*

class Elemento {
	var image
	var position

	method interaccionConPersonaje(){
		personaje.agarrarElemento(self)
	}	
	
	method image() = image
	
	method position() = position
	
	method reproducirSonidoDeAccion() {
		juego.reproducirSonido("sonidoMorder.mp3")
	}

	method posicionVisual()

	method tienePosicionVisual(unaPosicion) = self.posicionVisual() == unaPosicion
}

object zanahoria inherits Elemento{
	override method position() = game.at(11,1)

	override method image() = "zanahoria.png"

	override method posicionVisual() = game.at(0, 19)
}

object manzana inherits Elemento {
	override method position() = game.at(13,1)

	override method image() = "manzana.png"

	override method posicionVisual() = game.at(1, 19)
}

object matienzo inherits Elemento{
	override method position() = game.at(15,1)
	
	override method image() = "mate.png"
	
	override method posicionVisual() = game.at(2, 19)
	
	override method reproducirSonidoDeAccion() {
		juego.reproducirSonido("ruidoDeMate.mp3")
	}
}

object birra inherits Elemento{
	override method position() = game.at(19,1)

	override method image() = "cerveza.png"
	
	override method posicionVisual() = game.at(4, 19)
	
	override method reproducirSonidoDeAccion() {
		juego.reproducirSonido("audioBirra.mp3")
	}
}

object baguette inherits Elemento{
	override method position() = game.at(17,1)
	
	override method image() = "baguette.png"
	
	override method posicionVisual() = game.at(3, 19)
	
	override method reproducirSonidoDeAccion() {
		juego.reproducirSonido("sonidoMorder.mp3")
	}
}
