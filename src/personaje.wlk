import wollok.game.*
import carpincho.*
import necesidades.*
import objetosQueSatisfacen.*

object personaje {

	var position = game.at(3,6)

	var elementosAgarrados = #{}

	method elementosAgarrados() = elementosAgarrados
	
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

	method interaccionConElPersonaje() {} // para que no rompa el onCollide 

	method elementosDelPersonajeQueSatisfacenAlCarpincho(carpincho){
		//algun objeto de la lista de lista de elem agarrados satisface alguna de las necesidades del carpcinho
		//la lista del carpincho	
		const property objetosNecesarios = carpincho.necesidades().map({x=>x.objetoNecesario()})
		const elementosEnComun = self.elementosAgarrados().intersection(objetosNecesarios)	
		return elementosEnComun
		
	}

	method tieneAlgoQueSatisface(carpincho) = not (self.elementosDelPersonajeQueSatisfacenAlCarpincho(carpincho).isEmpty())

