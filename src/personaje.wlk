import wollok.game.*
import carpincho.*
import necesidades.*
import objetosQueSatisfacen.*

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
	method pocosElementos() = elementosAgarrados.size() < 2
	
	method agarrarElemento(unElemento){
		if (self.pocosElementos()) elementosAgarrados.add(unElemento)
		else game.say(self, "Ya tengo muchos elementos!")
	}
	
	method colisionDeCarpinchoConObjeto() {
		// Necesario para que no tire mensaje de error (unc arpincho choca con un personaje)
		// Acá la interacción implica ver el tema de la satisfacción de necesidades
	}

	method interaccionConElPersonaje() {}

	method elementosDelPersonajeQueSatisfacenAlCarpincho(carpincho){
		//algun objeto de la lista de lista de elem agarrados satisface alguna de las necesidades del carpcinho
		//la lista del carpincho	
		const property objetosNecesarios = carpincho.necesidades().map({x=>x.objetoNecesario()})
		const elementosEnComun = self.elementosAgarrados().intersection(objetosNecesarios)	
		return elementosEnComun
	}

	method tieneAlgoQueSatisface(carpincho) = not (self.elementosDelPersonajeQueSatisfacenAlCarpincho(carpincho).isEmpty())

