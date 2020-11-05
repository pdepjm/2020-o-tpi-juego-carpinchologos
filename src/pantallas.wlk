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
			//juego.reproducir("audioRasta.mp3")
			fondo.cambiar("menu.png")
			teclaEnterUsada = true
			keyboard.a().onPressDo({self.determinarSeleccionDePersonaje("alf.png", "chacarera.mp3")})
			keyboard.r().onPressDo({self.determinarSeleccionDePersonaje("rasta.png", "alalalalalong.mp3")})
		}
	}
	
	
	method determinarSeleccionDePersonaje(imagenDePersonaje, sonido) {
		if (not teclaDeSeleccionUsada) {
			personaje.seleccionado(imagenDePersonaje, sonido)
			teclaDeSeleccionUsada = true
			juego.postSeleccion()
		}
	}
	
	method mostrarReporte() {
        fondo.cambiar("fonditoReporte.png")
        juego.cambiarMusica("missionPassed.mp3") // cambiar el method
        game.addVisual(fondo)
        self.mostrarCantidadDeCarpinchosSalvados()
        game.schedule(10000, { => game.stop()})
    }
    
   method mostrarCantidadDeCarpinchosSalvados(){
   	const puntaje = juego.carpinchosSalvados().toString()
   	if (juego.carpinchosSalvados() >= 10){
   		const unidadesPuntaje = puntaje.takeRight(1)
        const decenaPuntaje = puntaje.takeLeft(1)
        const decena = new Numero(imagen = decenaPuntaje + ".png", posicion = game.at(15,9))
        const unidades = new Numero(imagen = unidadesPuntaje + ".png", posicion = game.at(20,9))
        game.addVisual(decena)
        game.addVisual(unidades)
        }
        else{
        	const punt = new Numero(imagen = puntaje + ".png", posicion = game.at(20,9))
        	game.addVisual(punt)
        } 
	}
}

class Numero{
    const imagen 
    const posicion

    method position() = posicion 

    method image() = imagen

}
