import wollok.game.*
import personaje.*
import carpincho.*
import necesidades.*
import lago.*

object juego {

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
		game.boardGround("fondo.png")
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
		game.onTick(5000, "pop carpincho", {=> self.generarUnCarpinchoYMoverEnLineaRecta()})
	}

	method generarUnCarpinchoYMoverEnLineaRecta() {
		const carpincho = new Carpincho()
		game.addVisual(carpincho)
		carpincho.aparecerEnBorde()
		carpincho.avanzarAutomaticamente()
	}
	
	method generarSuperficieDeAgua(){		
		20.times({ i => lago.generarEnPosicion(i-1)})
	}
	
	method configurarAcciones(){

		game.onCollideDo(personaje, {visualColisionado => visualColisionado.atrapado()})
		game.onCollideDo(lago, {carpincho => carpincho.pisaAgua()})
		//self.carpinchoPisaLago()
	}

	/*method carpinchoPisaLago(){
		if(posCarpincho == posicionDeUnaSupDeAgua){
			temrinarJuego
		}
	}*/
	
} 




