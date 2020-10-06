import wollok.game.*
//import personaje.*
import carpincho.*

object juego {

    method iniciar(){
        self.configurarJuego()
        self.agregarPersonajes()
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
    	carpincho2.mover(game.at(22, 10))
		game.addVisual(carpincho1)
		game.addVisual(carpincho2)
		
	}
}