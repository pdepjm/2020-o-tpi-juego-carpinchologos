import wollok.game.*
import lago.*
import juego.*
import personaje.*
import necesidades.*
import pantallas.*

class Carpincho {

	//var imagen = "carpincho.png"

	var posicion = game.at(10,10) 

	var property necesidad 
	
	//var mensaje

	var yaMuto = false
	
	constructor () {
		necesidad = tiposDeNecesidades.dameUnaNecesidadInicial()
		//mensaje = necesidad.mensaje()
	}
	
	//method elementoNecesario() = necesidad.objetoNecesario()
	
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
	
	method necesidadSatisfecha(unPersonaje) {
		const elementos = unPersonaje.elementosAgarrados()
		return elementos.contains(necesidad.objetoNecesario())
	}

	method interaccionConPersonaje(unPersonaje) {
		if(self.necesidadSatisfecha(unPersonaje)){
				const elemento = necesidad.objetoNecesario()
				self.mutarOMorir(elemento)				
				unPersonaje.quitarElemento(elemento)
		}
		else if (unPersonaje.tieneAlgunElemento()) {
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
	
	method mostrarNecesidad() { 															//podemos moverlo a necesidades.wlk para la buena delegacion
		game.onTick(3000, "carpincho muestra su necesidad", { =>  game.say(self, necesidad.mensaje())}) //necesidad.mensaje()
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
		//mensaje = necesidad.mensaje()								//eliminar mensaje, necesidad se encarga del msj
       	//imagen = necesidad.imagenAsociada()							//eliminar imagen,  necesidad se encarga de imagen
    }
}
