import wollok.game.*
import personaje.*
import carpincho.*
import necesidades.*
import lago.*
import objetosQueSatisfacen.*

object juego {
	
	const property carpinchos = []
	
    method iniciar(){
        self.configurarJuego()
        self.generarSuperficieDeAgua()
        self.agregarElementos()
        self.configurarTeclas()
		self.generarCarpinchos()
		self.agregarPersonajes()
		self.configurarAcciones()
        game.start()
    }

    method configurarJuego() {
		game.cellSize(64)
		game.title("Carpinchologos")
		game.width(30)
		game.height(20)
		game.boardGround("fondo.png")
	}
    method agregarPersonajes() {
		game.addVisual(personaje)
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
		carpincho.aparecerEnBorde()
		carpincho.avanzarAutomaticamente()
		game.onCollideDo(carpincho, {visualColisionado => visualColisionado.interaccionConCarpincho(carpincho)}) // GENERAR REPORTE FINAL (PANTALLA DE RESUMEN AL FINAL DEL JUEGO)
	}
	
	method generarSuperficieDeAgua(){		
		lago.generarBordeSuperior()
		18.times({ i => lago.generarBordeIntermedio(i)})
		lago.generarBordeInferior()
	}
	
	method configurarAcciones(){
		game.onCollideDo(personaje, {algo => algo.interaccionConPersonaje(personaje)})
	}
	
} 




