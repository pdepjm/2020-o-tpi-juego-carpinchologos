import wollok.game.*

object personaje {

	var posicion = game.at(3,6)

	method position() = posicion

	method moverseA(unaPosicion){
		posicion = unaPosicion
	}
	method image() = "boo.png"
	
}