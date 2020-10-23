import wollok.game.*
import carpincho.*
import necesidades.*
import objetosQueSatisfacen.*
import juego.*

object personaje {

	var position = game.at(3,6)

	const elementosAgarrados = #{}

	method elementosAgarrados() = elementosAgarrados
	
	method position() = position
	
	method image() = "boo.png"

	method moverseA(unaPosicion){
		position = unaPosicion
	}
	
	// El conjunto puede tener hasta 3 elementos
	method pocosElementos() = elementosAgarrados.size() < 3
	
	method agarrarElemento(unElemento){
		if (self.pocosElementos() )
		{
			if(not self.elementoRepetido(unElemento))
			{
				elementosAgarrados.add(unElemento)
			    juego.crearVisual(unElemento.image(), unElemento.posicionVisual())
			}
			else
			{
				game.say(self, "Ya tengo este elemento!")
			}
		}
		else game.say(self, "Ya tengo muchos elementos!")
	}
	
	method elementoRepetido(unElemento) = elementosAgarrados.contains(unElemento)

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
		elementosAgarrados.remove(unElemento)
	}
}
