import juego.*
import wollok.game.*
import personaje.*

object inventario{

    const property elementosAgarrados = #{}
    
    const visuales = #{}

    method pocosElementos() = elementosAgarrados.size() < 3

	method hayElementos() = not elementosAgarrados.isEmpty()
	
    method elementoRepetido(unElemento) = elementosAgarrados.contains(unElemento)

    method agregarElemento(unElemento){
		self.verificarAgarrar(unElemento) 
		elementosAgarrados.add(unElemento)
		self.crearVisual(unElemento.image(), unElemento.posicionVisual())
	}
	
	
	method verificarAgarrar(unElemento){
	  	if(not self.pocosElementos()) 				self.error("Ya tengo muchos elementos!")
	  	if(self.elementoRepetido(unElemento))	self.error("Ya tengo este elemento!")  
	}
	
	
	

    method removerElemento(unElemento) {
        elementosAgarrados.remove(unElemento)
        self.quitarVisual(unElemento.posicionVisual())
    }

    method crearVisual(imagen, posicion) {
		const visual = new Visual(posicion = posicion, image = imagen)			//code smells, imagen necesario? es la misma
		visuales.add(visual)													//posicion si
		game.addVisual(visual)
	 }
     
	 method quitarVisual(posicion){
	 	const visual = visuales.find({visual => visual.position() == posicion})
	 	visuales.remove(visual)
	 	game.removeVisual(visual)
	 }
}

class Visual{
	
	var posicion
	
	var image
	
	method position() = posicion
	
	method image() = image
	
	method interaccionConPersonaje(unPersonaje) {
		// Necesario para que no tire mensaje de error
	}
}

