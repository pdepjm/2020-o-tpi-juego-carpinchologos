import wollok.game.*
import personaje.*
import carpincho.*
import necesidades.*
import lago.*
import objetosQueSatisfacen.*
import pantallas.*

object juego {
	
	const property carpinchos = []

	var property carpinchosSalvados = 0
	
	var property musica = game.sound("sounds/chacarera.mp3") // SETTEAR MUSICA INICIAL

	var pantalla //= pantallaInicio

	method cambiarPantallaYEjecutar(nuevaPantalla) {
		pantalla = nuevaPantalla
		pantalla.ejecutar()
	}

	method incrementarCarpinchosSalvados() { // Este tendria que ir a pantalla de juego
		carpinchosSalvados += 1
	}
	
    method iniciar(){
    	self.configurarJuego()
		//pantalla.ejecutar() // era pantallas
		self.cambiarPantallaYEjecutar(pantallaInicio)
        game.start()
        //self.reproducirMusica()
    }

    method configurarJuego() {
 		game.cellSize(64)
		game.title("Carpinchologos")
		game.width(30)
		game.height(20)
	}
	
	method reproducirSonido(sonidoAReproducir){ // Reproduce un sonido cualquiera
    	const sonido = game.sound("sounds/" + sonidoAReproducir)
        sonido.play()
    }
    
    method reproducirMusica() { // Reproduce la musica del juego
    	musica.volume(0.20)
    	musica.play()
    }
    
    method cambiarMusica(musicaNueva) {
    	musica.stop()
    	musica = game.sound("sounds/" + musicaNueva)
    	self.reproducirMusica()
    }
} 

