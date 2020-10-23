import wollok.game.*
import personaje.*
import carpincho.*
import necesidades.*
import lago.*
import objetosQueSatisfacen.*

class Visual{
	
	var posicion
	
	var image
	
	method position() = posicion
	
	method image() = image
}

object juego {
	
	const property carpinchos = []
	
	const visuales = #{}
	
    method iniciar(){
        self.configurarJuego()
        self.generarSuperficieDeAgua()
        self.agregarElementos()
        self.configurarTeclas()
		self.generarCarpinchos()
		self.agregarPersonaje()
        game.start()
    }

    method configurarJuego() {
		game.cellSize(64)
		game.title("Carpinchologos")
		game.width(30)
		game.height(20)
		game.boardGround("fondo.png")
	}
    method agregarPersonaje() { // El onCollide necesita el componente visual (es importante el orden de los métodos)
		game.addVisual(personaje)
		personaje.establecerComportamiento()
	}

	method agregarElementos() {
		game.addVisual(zanahoria)
		game.addVisual(comidita)
	}
	
	method configurarTeclas() {
		keyboard.up().onPressDo({ personaje.moverseA(personaje.position().up(1))})
		keyboard.down().onPressDo({ personaje.moverseA(personaje.position().down(1))})
		keyboard.left().onPressDo({ personaje.moverseA(personaje.position().left(1))})
		keyboard.right().onPressDo({ personaje.moverseA(personaje.position().right(1))})
	}

	method generarCarpinchos(){
		//on tick -> genere un carpincho hasta que el jugador gane o pierda
		game.onTick(1000, "pop carpincho", {=> self.generarUnCarpinchoYMoverEnLineaRecta()})
	}

	method generarUnCarpinchoYMoverEnLineaRecta() {
		const carpincho = new Carpincho()
		game.addVisual(carpincho)
		carpincho.aparecerYMover()
	}
	
	method generarSuperficieDeAgua(){		
		lago.generar()
	}	
	
	method crearVisual(imagen, posicion) {
		const visual = new Visual(posicion = posicion, image = imagen)
		visuales.add(visual)
		game.addVisual(visual)
	 
	 }
	 method quitarVisual(posicion){
	 	const visual = visuales.find({visual => visual.position() == posicion})
	 	visuales.remove(visual)
	 	game.removeVisual(visual)
	 }
} 




