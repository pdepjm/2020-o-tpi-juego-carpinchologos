import wollok.game.*
import personaje.*
import carpincho.*
import necesidades.*
import lago.*

object juego {
	
	const property carpinchos = []
	
    method iniciar(){
        self.configurarJuego()
        self.agregarPersonajes()
        self.agregarElementos()
        self.configurarTeclas()
		self.generarCarpinchos()
		self.generarSuperficieDeAgua()
		self.configurarAcciones()
        game.start()
    }

    method configurarJuego() {
		game.cellSize(64)
		game.title("Carpinchologos")
		game.width(30)
		game.height(20)
		game.boardGround("prueba.png")
	}
    method agregarPersonajes() {
    	
		game.addVisual(personaje)
		/*carpincho2.aparecer(0,10)
		carpincho1.aparecer(0,0)*/
	}

	method agregarElementos() {
		game.addVisual(zanahoria)
	}
	method configurarTeclas() {
		keyboard.up().onPressDo({ personaje.moverseA(personaje.position().up(1))})
		keyboard.down().onPressDo({ personaje.moverseA(personaje.position().down(1))})
		keyboard.left().onPressDo({ personaje.moverseA(personaje.position().left(1))})
		keyboard.right().onPressDo({ personaje.moverseA(personaje.position().right(1))})
	}

	method generarCarpinchos(){
		//on tick -> genere un carpincho hasta que el jugador gane o pierda
		game.onTick(500, "pop carpincho", {=> self.generarUnCarpinchoYMoverEnLineaRecta()})
	}

	method generarUnCarpinchoYMoverEnLineaRecta() {
		const carpincho = new Carpincho()
		carpinchos.add(carpincho)
		game.addVisual(carpincho)
		carpincho.aparecerEnBorde()
		carpincho.avanzarAutomaticamente()
		game.onCollideDo(carpincho, {unaSupDeAgua => unaSupDeAgua.hacerAlgo()})
	}
	
	method generarSuperficieDeAgua(){		
		lago.generarBordeSuperior()
		18.times({ i => lago.generarBordeIntermedio(i)})
		lago.generarBordeInferior()
	}
	
	method configurarAcciones(){

		game.onCollideDo(personaje, {visualColisionado => visualColisionado.atrapado()})
		//game.onCollideDo(carpincho, {carpincho => carpincho.carpinchoPisaLago()})
		//self.carpinchoPisaLago()
	}

	/*method carpinchoPisaLago(){
		if(self.algunCarpinchoTocaElAgua()){
			game.stop()
		}
	}
	
	method algunCarpinchoTocaElAgua() = carpinchos.any({carpincho => carpincho.tocaSuperficieDeAgua()})*/
	
	
} 




