import juego.*
import wollok.game.*
import personaje.*

object inventario{

    const property elementosAgarrados = #{}
    
    const visuales = #{}

    // El conjunto puede tener hasta 3 elementos
    method pocosElementos() = elementosAgarrados.size() < 3

	method hayElementos() = not elementosAgarrados.isEmpty()
	
    method elementoRepetido(unElemento) = elementosAgarrados.contains(unElemento)

    method agregarElemento(unElemento){
		if (self.pocosElementos())
		{
			if(not self.elementoRepetido(unElemento))
			{
				elementosAgarrados.add(unElemento)
			    self.crearVisual(unElemento.image(), unElemento.posicionVisual())
			}
			else
			{
				personaje.advertencia("Ya tengo este elemento!")
			}
		}
		else personaje.advertencia("Ya tengo muchos elementos!")
	}

    method removerElemento(unElemento) {
        elementosAgarrados.remove(unElemento)
        self.quitarVisual(unElemento.posicionVisual())
    }

    method crearVisual(imagen, posicion) {
		const visual = new Visual(posicion = posicion, image = imagen)
		visuales.add(visual)
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
		// Necesario apra que wg no tire mensaje de error
	}
}

