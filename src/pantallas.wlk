import juego.*
import wollok.game.*
import personaje.*
import lago.*
import carpincho.*
import objetosQueSatisfacen.*
import puntaje.*

/// ------ Refactor para las pantallas ------

class Pantalla {
	var image = "presentacion.png" // Se podria hacer const property image = "imagenQueLeCorresponda.png" en cada objeto, pero sería repetir el método image() y su implementación implíctamente
	const position = game.at(0,0)

	method image() = image
	method cambiarImagen(nuevaImagen) {
		image = nuevaImagen
	}
	method position() = position
	method mostrarPantalla() {
		game.addVisual(self)
	}
	method comportamientoDePantallaSegunTeclas()
	method cambiarPantalla(unaPantalla, imagenSiguiente) {
		game.clear()
		juego.cambiarPantallaYEjecutar(unaPantalla)
		unaPantalla.cambiarImagen(imagenSiguiente)
	}
	method ejecutar() {
		self.mostrarPantalla()
		self.comportamientoDePantallaSegunTeclas()
	}
}

object pantallaInicio inherits Pantalla{
	//image = "presentacion.png"

	override method comportamientoDePantallaSegunTeclas() { 
		keyboard.enter().onPressDo({self.cambiarPantalla(pantallaSeleccionPersonaje, "menu.png")})
	}
}

object pantallaSeleccionPersonaje inherits Pantalla {
	
	override method comportamientoDePantallaSegunTeclas() {
		keyboard.a().onPressDo({self.determinarSeleccionDePersonajeYCambiarPantalla("alf.png", "chacarera.mp3")})
		keyboard.r().onPressDo({self.determinarSeleccionDePersonajeYCambiarPantalla("rasta.png", "alalalalalong.mp3")})
	}

	/*method determinarSeleccionDePersonaje(imagenDePersonaje, musica) {
		personaje.seleccionado(imagenDePersonaje, musica)
	}*/

	method determinarSeleccionDePersonajeYCambiarPantalla(imagenDePersonaje, musica) {
		//self.determinarSeleccionDePersonaje(imagenDePersonaje, sonido)
		personaje.seleccionado(imagenDePersonaje, musica)
		self.cambiarPantalla(pantallaJuego, "fondo.png")
	}
	
}

object pantallaJuego inherits Pantalla {
	
	override method ejecutar() {
		super()
		self.agregarVisualesALaPantalla()
	}

	method agregarVisualesALaPantalla() {
		self.generarSuperficieDeAgua()
   		self.agregarElementos()
		self.generarCarpinchos()
		self.agregarPersonaje()
	}

 	override method comportamientoDePantallaSegunTeclas() {
		keyboard.up().onPressDo({ personaje.moverseA(personaje.position().up(1))})
		keyboard.down().onPressDo({ personaje.moverseA(personaje.position().down(1))})
		keyboard.left().onPressDo({ personaje.moverseA(personaje.position().left(1))})
		keyboard.right().onPressDo({ personaje.moverseA(personaje.position().right(1))})
	}

	method generarSuperficieDeAgua(){
		lago.generar()
	}

	method agregarElementos() {
		game.addVisual(zanahoria)
		game.addVisual(manzana)
		game.addVisual(birra)
		game.addVisual(matienzo)
		game.addVisual(baguette)
	}

	method generarCarpinchos(){
		//on tick -> genere un carpincho hasta que el jugador gane o pierda
		game.onTick(6000, "pop carpincho", {=> self.generarUnCarpinchoYMoverEnLineaRecta()})
	}

	method generarUnCarpinchoYMoverEnLineaRecta() {
		const carpincho = new Carpincho()
		game.addVisual(carpincho)
		carpincho.aparecerYMover()
	}

	method agregarPersonaje() { // El onCollide necesita el componente visual (es importante el orden de los métodos)
		game.addVisual(personaje)
		personaje.establecerComportamiento()
	}

	method cambiate() {
		self.cambiarPantalla(pantallaReporte, "fonditoReporte.png")
	}

}

object pantallaReporte inherits Pantalla {

	override method comportamientoDePantallaSegunTeclas() {}
	
	override method ejecutar() {
		super()
		self.mostrarReporte()
	}


	method mostrarReporte() {
        juego.cambiarMusica("missionPassed.mp3") // cambiar el method
        puntaje.mostrate()
        game.schedule(10000, { => game.stop()})
    }
	
}

/*P.Inicio ---apretando enter-----> 
sel Perso ----aprentado A/R-----> 
pantalla juego ---fin Juego---> 
pantalla reporte */