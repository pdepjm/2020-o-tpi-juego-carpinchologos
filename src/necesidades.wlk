import wollok.game.*
import personaje.*


class Elemento {
	
	var estado = libre
	
	method position() = estado.posicion()
	
	method atrapado() {
		estado = atrapado
	}
	
	method image()
}

object zanahoria inherits Elemento {
	
 	override method image() = "zanahoria.png"
}


object libre {
	method posicion() = game.at(12,19)
}

object atrapado {
	method posicion() = personaje.position().right(1)
}