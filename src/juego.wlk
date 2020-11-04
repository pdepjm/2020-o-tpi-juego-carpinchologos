import wollok.game.*
import personaje.*
import carpincho.*
import necesidades.*
import lago.*
import objetosQueSatisfacen.*

object juego {
	
	const property carpinchos = []
	
	const necesidadesPosibles = [suenito, hambriento]

	const necesidadesMutadas = [argentino, irlandes, frances]

	var carpinchosSalvados = 0

	method incrementarCarpinchosSalvados() {
		carpinchosSalvados += 1
	}

	method mostrarReporte() {

	}
	
	method dameUnaNecesidad() = necesidadesPosibles.anyOne()

	method dameUnaNecesidadMutada() = necesidadesMutadas.anyOne()
	//estan muriendo gatitos acá, volver a pensar
	
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
		//game.boardGround("fondo.png")
		game.addVisual(fondo) // Se modeló al fondo con un objeto para cambiarlo al final y mostrar el reporte
	}
    method agregarPersonaje() { // El onCollide necesita el componente visual (es importante el orden de los métodos)
		game.addVisual(personaje)
		personaje.establecerComportamiento()
	}

	method agregarElementos() {
		game.addVisual(zanahoria)
		game.addVisual(comidita)
		game.addVisual(cerveza)
		game.addVisual(mate)
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
} 

object fondo {
    var image = "fondo.jpg"

    var position = game.at(0,0)

    method image() = image

	method position() = position

    method cambiarFondo(nuevoFondo) {
        image = nuevoFondo
        game.addVisual(self)
    }
}

