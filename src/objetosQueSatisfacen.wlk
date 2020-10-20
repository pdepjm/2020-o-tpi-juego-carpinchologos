import wollok.game.*

class Elemento {
	
	var property copiaDeElemento
	
	var image
	
	var position

	method interaccionConElPersonaje(unPersonaje){
		unPersonaje.agarrarElemento(self)
	}	
	
	method image() = image
	
	method position() = position
	
}

const zanahoria = new Elemento(copiaDeElemento = copiaZanahoria, image = "zanahoria.png", position = game.at(12,19))

const comidita = new Elemento(copiaDeElemento = copiaComidita, image = "comidita.png", position = game.at(16,19))

object copiaZanahoria {
	method position() = game.at(1,19)
	
	method image() = "zanahoria.png"
	
}

object copiaComidita {
	method position() = game.at(3,19)
	
	method image() = "comidita.png"
}
