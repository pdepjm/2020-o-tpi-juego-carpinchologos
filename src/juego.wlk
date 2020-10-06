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
		game.width(10)
		game.height(10)
	}
    method agregarPersonajes() {
    	//const carpincho = new Carpincho()
		game.addVisual(carpincho)
		
	}
}