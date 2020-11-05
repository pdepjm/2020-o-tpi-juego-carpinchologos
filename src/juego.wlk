import wollok.game.*
import personaje.*
import carpincho.*
import necesidades.*
import lago.*
import objetosQueSatisfacen.*
import pantallas.*

object juego {
	
	const property carpinchos = []

	var carpinchosSalvados = 0
	
	var property musica = game.sound("sounds/chacarera.mp3") // SETTEAR MUSICA INICIAL

	method incrementarCarpinchosSalvados() {
		carpinchosSalvados += 1
	}
	
    method iniciar(){
    	self.configurarJuego()
		pantallas.ejecutar()
        game.start()
        //self.reproducirMusica()
    }
	
	method postSeleccion() {
		fondo.cambiar("fondo.png")
		self.generarSuperficieDeAgua()
        self.agregarElementos()
        self.configurarTeclas()
		self.generarCarpinchos()
		self.agregarPersonaje()
	}

    method configurarJuego() {
 		game.cellSize(64)
		game.title("Carpinchologos")
		game.width(30)
		game.height(20)
	}

    method agregarPersonaje() { // El onCollide necesita el componente visual (es importante el orden de los métodos)
		game.addVisual(personaje)
		personaje.establecerComportamiento()
	}

	method agregarElementos() {
		game.addVisual(zanahoria)
		game.addVisual(manzana)
		game.addVisual(birra)
		game.addVisual(matienzo)
		game.addVisual(baguette)
	}
	
	method configurarTeclas() {
		keyboard.up().onPressDo({ personaje.moverseA(personaje.position().up(1))})
		keyboard.down().onPressDo({ personaje.moverseA(personaje.position().down(1))})
		keyboard.left().onPressDo({ personaje.moverseA(personaje.position().left(1))})
		keyboard.right().onPressDo({ personaje.moverseA(personaje.position().right(1))})
	}

	method generarCarpinchos(){
		//on tick -> genere un carpincho hasta que el jugador gane o pierda
		game.onTick(4000, "pop carpincho", {=> self.generarUnCarpinchoYMoverEnLineaRecta()})
	}

	method generarUnCarpinchoYMoverEnLineaRecta() {
		const carpincho = new Carpincho()
		game.addVisual(carpincho)
		carpincho.aparecerYMover()
	}
	
	method generarSuperficieDeAgua(){		
		lago.generar()
	}
	
	method reproducirSonido(sonidoAReproducir){ // Reproduce un sonido cualquiera
    	const sonido = game.sound("sounds/" + sonidoAReproducir)
        sonido.play()
    }
    
    method reproducirMusica() { // Reproduce la musica del juego
    	musica.volume(0.30)
    	musica.play()
    }
    
    method cambiarMusica(musicaNueva) {
    	musica.stop()
    	musica = game.sound("sounds/" + musicaNueva)
    	self.reproducirMusica()
    }
} 

object fondo {
    var image = "menu.png"
    const position = game.at(0,0)

    method image() = image

	method position() = position

    method cambiar(nuevoFondo) {
        image = nuevoFondo
    }
}

