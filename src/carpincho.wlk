import wollok.game.*
import lago.*
import juego.*
import personaje.*
import necesidades.*
import pantallas.*
import puntaje.*

class Carpincho {

	var posicion = game.at(10,10) 

	var property necesidad 
	
	constructor () {
		necesidad = tiposDeNecesidades.dameUnaNecesidadInicial()
	}
	
	method position() = posicion 

	method image() = necesidad.imagenAsociada()

	method avanzarAutomaticamente() {
		game.onTick(1000, "carpincho avanza", { =>  self.avanzarLineaRecta() })
	}

	method avanzarLineaRecta() {
		posicion = self.position().left(1)
	}

	method aparecerEnBorde(){
		const y = 4.randomUpTo(game.height() - 4)
		posicion = game.at(30, y)
	}

	method desaparecer() {
		puntaje.sumarUnPunto()
		game.removeTickEvent("carpincho avanza")
		game.removeTickEvent("carpincho muestra su necesidad")
        game.removeVisual(self)
	}

	method interaccionConPersonaje() {
		if(necesidad.esSatisfechaPorPersonaje()){
				necesidad.efecto(self)
		}
		else if (personaje.tieneAlgunElemento()) {
				game.say(self, "No quiero ese elemento!")
		}
	}	
	
	method interaccionConAgua() {
		pantallaJuego.cambiate()
	}

	method aparecerYMover() {
		self.aparecerEnBorde()
		self.avanzarAutomaticamente()
		self.mostrarNecesidad()
	}
	
	method mostrarNecesidad() { 															
		game.onTick(3000, "carpincho muestra su necesidad", { => necesidad.mostrarse(self)})
	}
}
