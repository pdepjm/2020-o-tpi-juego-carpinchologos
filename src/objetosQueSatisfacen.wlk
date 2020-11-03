import wollok.game.*

class Elemento {
	
	var image
	
	var position

	method interaccionConPersonaje(unPersonaje){
		unPersonaje.agarrarElemento(self)
	}	
	
	method image() = image
	
	method position() = position
	
}

object zanahoria inherits Elemento{
	override method position() = game.at(11,0)
	
	override method image() = "zanahoria.png"
	
	method posicionVisual() = game.at(0, 19)
}

object comidita inherits Elemento {
	override method position() = game.at(13,0)
	
	override method image() = "comidita.png"
	
	method posicionVisual() = game.at(1, 19)
}

object mate inherits Elemento{
	override method position() = game.at(15,0)
	
	override method image() = "mate.png"
	
	method posicionVisual() = game.at(2, 19)
}

object lasagna inherits Elemento{
	override method position() = game.at(17,0)
	
	override method image() = "lasagna.png"
	
	method posicionVisual() = game.at(3, 19)
}

object pan inherits Elemento{
	override method position() = game.at(19,0)
	
	override method image() = "pan.png"
	
	method posicionVisual() = game.at(4, 19)
}
