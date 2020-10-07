import wollok.game.*
import personaje.*
import carpincho.*
import necesidades.*

object juego {

    method iniciar(){
        self.configurarJuego()
        self.agregarPersonajes()
        self.configurarTeclas()
    }

    method configurarJuego() {
		game.title("Carpinchologos")
		game.width(30)
		game.height(18)
		game.boardGround("pasto.jpg")
	}
    method agregarPersonajes() {
    	const carpincho1 = new Carpincho()
    	const carpincho2 = new Carpincho()
    	carpincho2.mover(game.at(5, 0))
		game.addVisual(carpincho1)
		game.addVisual(carpincho2)
		game.addVisual(personaje)
		game.addVisual(zanahoria)
	}
	method configurarTeclas() {
		keyboard.up().onPressDo({ personaje.moverseA(personaje.position().up(1))})
		keyboard.down().onPressDo({ personaje.moverseA(personaje.position().down(1))})
		keyboard.left().onPressDo({ personaje.moverseA(personaje.position().left(1))})
		keyboard.right().onPressDo({ personaje.moverseA(personaje.position().right(1))})
	}
}