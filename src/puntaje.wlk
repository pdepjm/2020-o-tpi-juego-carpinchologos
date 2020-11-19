import wollok.game.*

object puntaje{
	var property puntos = 0
	
	method sumarUnPunto(){
		puntos = puntos + 1 
	}

	method mostrate() {
   	const puntaje = puntos.toString()
   	if (puntos >= 10){ 
   		const unidadesPuntaje = puntaje.takeRight(1)
        const decenaPuntaje = puntaje.takeLeft(1)
        const decena = new Numero(imagen = decenaPuntaje + ".png", posicion = game.at(15,9))
        const unidades = new Numero(imagen = unidadesPuntaje + ".png", posicion = game.at(20,9))
        game.addVisual(decena)
        game.addVisual(unidades)
        }
        else{
        	const punt = new Numero(imagen = puntaje + ".png", posicion = game.at(20,9))
        	game.addVisual(punt)
        }
	}
}

class Numero{
    const imagen 
    const posicion

    method position() = posicion 

    method image() = imagen
}