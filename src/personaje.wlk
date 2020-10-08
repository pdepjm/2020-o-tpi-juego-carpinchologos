import wollok.game.*

object personaje {

	var posicion = game.at(3,6)

	const elementosAgarrados = #{}
	
	method position() = posicion
	
	method image() = "boo.png"

	method moverseA(unaPosicion){
		posicion = unaPosicion
	}
	
	method agarrarElemento(){
		if(elementosAgarrados.size() < 4 ) // El conjunto puede teneer hasta 3 elementos
		{
			game.onCollideDo(self, { visualColisionado => visualColisionado.atrapado() elementosAgarrados.add(visualColisionado)})
		} 
		else {
			// decir que hay muchos elementos en su bolsita (mostrar mensaje)
		} 
	}

	

}
