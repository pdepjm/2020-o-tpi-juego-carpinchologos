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
		if (self.pocosElementos())
		{
			elementosAgarrados.add(unElemento)
			juego.crearVisual(unElemento.image(), unElemento.posicionVisual())
		}
		else game.say(self, "Ya tengo muchos elementos!")
	}
	
	method interaccionConCarpincho(unCarpincho) {
		if(unCarpincho.necesidadSatisfecha(elementosAgarrados))
		{
			unCarpincho.desaparecer()
			const elemento = unCarpincho.elementoNecesario() // esto esta mal por que estamos obteniendo la necesidad del Carpincho cuando antes le consultamos si satisfacia
			juego.quitarVisual(elemento.posicionVisual())
			elementosAgarrados.remove(elemento) 
			
		}
	}

	method interaccionConPersonaje() {
		// Cuando el personaje interactua consigo mismo. Probar si se puede sacar
	}

	/*method elementosDelPersonajeQueSatisfacenAlCarpincho(carpincho){
		//algun objeto de la lista de lista de elem agarrados satisface alguna de las necesidades del carpcinho
		//la lista del carpincho	
		const objetosNecesarios = carpincho.necesidades().map({x=>x.objetoNecesario()})
		const elementosEnComun = self.elementosAgarrados().intersection(objetosNecesarios)	
		return elementosEnComun
	}*/
	
}

class Visual{
	
	var posicion
	
	var image
	
	method position() = posicion
	
	method image() = image
}