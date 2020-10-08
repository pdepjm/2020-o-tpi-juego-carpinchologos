import wollok.game.*

object lineaRecta {
	
	var posicion = game.at(30, 20)
	
	method posicion() = posicion
	
	method nuevaPosicionRecta() = posicion.left(1)
}
