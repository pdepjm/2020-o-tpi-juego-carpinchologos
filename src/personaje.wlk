import wollok.game.*

object personaje {

	var position = game.at(3,6)

	const elementosAgarrados = #{}
	
	method position() = position
	
	method image() = "boo.png"

	method moverseA(unaPosicion){
		position = unaPosicion
	}
	
	/*method agarrarElemento(){
		if (self.pocosElementos()) {
			elementosAgarrados.add(visualColisionado)})
		} 
		else {
			game.say(self, "Ya tengo muchos elementos!")
		} 
	}*/

	// El conjunto puede teneer hasta 3 elementos
	method pocosElementos() = elementosAgarrados.size() < 4
	
	method colisionDeCarpinchoConObjeto() {
		// Necesario para que no tire mensaje de error (unc arpincho choca con un personaje)
		// Acá la interacción implica ver el tema de la satisfacción de necesidades
	}
	

}
