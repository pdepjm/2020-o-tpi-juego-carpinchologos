import wollok.game.*
import carpincho.*
import necesidades.*
import objetosQueSatisfacen.*
import inventario.*

object personaje {

	var position = game.at(3,6)

	var property imagen 
	
	method position() = position
	
	method image() = imagen

	method moverseA(unaPosicion){
		position = unaPosicion
	}

	method agarrarElemento(unElemento){
		inventario.agregarElemento(unElemento)
	}
	
	method elementosAgarrados() = inventario.elementosAgarrados()
	
	method tieneAlgunElemento() = inventario.hayElementos()

	method interaccionConPersonaje() {
		// Cuando el personaje interactua consigo mismo. Probar si se puede sacar
	}

	method interaccionConAgua(){
		// Vacio para que no rompa WG
	}

	method establecerComportamiento() {
		game.onCollideDo(self, {algo => algo.interaccionConPersonaje(self)})
	}

	method quitarElemento(unElemento) {
		inventario.removerElemento(unElemento)
	}

	method advertencia(textoAdvertencia) {
		game.say(self, textoAdvertencia)
	}
}
