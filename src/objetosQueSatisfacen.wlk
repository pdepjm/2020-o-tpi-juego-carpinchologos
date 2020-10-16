import wollok.game.*

class Elemento{

	method interaccionConElPersonaje(unPersonaje){
		unPersonaje.agarrarElemento(self)
	}	
	
	method image()
}

object zanahoria inherits Elemento {

	method position() = game.at(12,10)
	
 	override method image() = "zanahoria.png"
}
object manzana inherits Elemento {

	method position() = game.at(13,10)
	
 	override method image() = "manzana.png"
}
