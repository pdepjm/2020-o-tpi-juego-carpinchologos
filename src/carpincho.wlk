import wollok.game.*

class Carpincho {

	method position() {
		return game.at(7,5)
	}

	method image() {
		return "carpincho.jpg"
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

