import wollok.game.*
import movimientos.*

class Carpincho {

	var imagen = "carpincho.png"

	var posicion = game.at(10,10) // lo pusimos asi para q no nos tire problema con la generacion del carpincho
	
	const necesidad = #{} // maximo de 2
	
	method position() = posicion 

	method image() = imagen

	method avanzarAutomaticamente() {
		game.onTick(500, "carpincho avanza", { =>  self.avanzarLineaRecta()})
	}

	method avanzarLineaRecta() {
		posicion = self.position().left(1)
	}

	method aparecerEnBorde(){
		const y = 4.randomUpTo(game.height() - 4)
		posicion = game.at(30, y)
	}

	method estaSatisfecho() {
		//desaparece el carpincho 
	}

	method pisaAgua() {
		imagen = "carpinchoEnojado.jpg"
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

