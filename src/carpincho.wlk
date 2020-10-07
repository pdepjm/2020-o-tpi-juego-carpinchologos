import wollok.game.*

class Carpincho {

	var posicion = game.at(10,10)

	method position() = posicion

	method aparecer(x, y) {
		posicion = game.at(x,y)
	}
		
	method moverseA(unaPosicion){
		posicion = unaPosicion
	}
	method image() = "carpincho.png"

	method avanzarLineaRecta() {
		self.moverseA(self.position().right(1))
	}

	method avanzarAutomaticamente() {
		game.onTick(1000, "carpicnchoSeMueve", { =>  self.avanzarLineaRecta() self.position()})
	}
	
	
}



/*Juego:
Cosas a definir: ¿Como ganaria el jugador?
Aparecen carpinchos cada X tiempo con una necesidad cada carpincho. Jugador tiene que 
Darle lo que necesita antes de que llegue al otro lado. Si le da lo que necesita, 
desaparece de la pantalla, y si llega al otro lado, el juego termina y pierde.

Carpincho:
- Avanza 
- Recibir elemento (validar si cubre o no necesidad)
  cubrir necesidad (desaparecer)
- desaparecer

Jugador:
- Agarrar
- Entregar


Al llegar a la abscisa 0, el juego se termina*/

