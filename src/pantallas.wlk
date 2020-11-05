import juego.*
import wollok.game.*
import personaje.*


object pantallas {
	
	var teclaEnterUsada = false
	
	var teclaDeSeleccionUsada = false
	
	method ejecutar() {
		fondo.cambiar("presentacion.png") // Se modeló al fondo con un objeto para cambiarlo al final y mostrar el reporte
		game.addVisual(fondo)
		keyboard.enter().onPressDo({self.determinarComportamientoDeTeclaEnter()})
	}
	
	method determinarComportamientoDeTeclaEnter() {
		if (not teclaEnterUsada) {
			fondo.cambiar("menu.png")
			teclaEnterUsada = true
			keyboard.a().onPressDo({self.determinarSeleccionDePersonaje("alf.png")})
			keyboard.r().onPressDo({self.determinarSeleccionDePersonaje("rasta.png")})
		}
	}
	
	method determinarSeleccionDePersonaje(imagenDePersonaje) {
		if (not teclaDeSeleccionUsada) {
			personaje.imagen(imagenDePersonaje) 
			teclaDeSeleccionUsada = true
			juego.postSeleccion()
		}
	}
	
	method mostrarReporte() {
		fondo.cambiar("fonditoReporte.jpg")
		juego.reproducir("missionPassed.mp3")
		game.addVisual(fondo)
		game.schedule(10000, { => game.stop()})
	}
}



