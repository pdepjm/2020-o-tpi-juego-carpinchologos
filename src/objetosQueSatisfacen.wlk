import wollok.game.*
import personaje.*


class Elemento{
	
	//var estado = libre
	
	
	method atrapado(){
		//estado = atrapado
		
	}

	method interaccionConElPersonaje(){
		// transladarse abajo -> visual

	}	
	
	method image()
}

object zanahoria inherits Elemento {

	method position() = game.at(12,19)
	
 	override method image() = "zanahoria.png"
}

/*
object libre {
	method posicion() = game.at(12,19)
}

object atrapado {
	method posicion() = personaje.position().right(1)
} */

