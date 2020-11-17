import wollok.game.*
import lago.*
import juego.*
import personaje.*
import necesidades.*
import pantallas.*

class Carpincho {

	var posicion = game.at(10,10) 

	var property necesidad 
	
	var yaMuto = false
	
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
				const elemento = necesidad.objetoNecesario()	
				self.mutarOMorir(elemento)				
				personaje.quitarElemento(elemento)
		}
		else if (personaje.tieneAlgunElemento()) {
				game.say(self, "No quiero ese elemento!")
		}
	}	
	
	method interaccionConAgua() {
		/*game.clear()
		pantallas.mostrarReporte()*/
		//juego.cambiarPantallaYEjecutar(pantallaReporte)
		pantallaJuego.cambiate()
	}

	method aparecerYMover() {
		self.aparecerEnBorde()
		self.avanzarAutomaticamente()
		self.mostrarNecesidad()
	}
	
	method mostrarNecesidad() { 															
		game.onTick(3000, "carpincho muestra su necesidad", { =>  game.say(self, necesidad.mensaje())})
	}

	method mutarOMorir(elemento){
        if(not yaMuto){
            self.mutar(elemento)
        }else {
            elemento.reproducirSonidoDeAccion()
            self.desaparecer()
        }
    }

    method mutar(elemento){
        elemento.reproducirSonidoDeAccion()
        yaMuto = true
		necesidad = tiposDeNecesidades.dameUnaNecesidadMutada()
    }
}
