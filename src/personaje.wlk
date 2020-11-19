import wollok.game.*
import carpincho.*
import necesidades.*
import objetosQueSatisfacen.*
import inventario.*
import juego.*

object personaje {

	var position = game.at(3,6)

	var property imagen 
	
	method position() = position
	
	method image() = imagen

	method moverseA(unaPosicion){
		position = unaPosicion
	}

	method agarrarElemento(unElemento){
		try{ inventario.agregarElemento(unElemento)}
		catch excepcion : DomainException {
			self.advertencia(excepcion.message())
		}
	}
	
	method elementosAgarrados() = inventario.elementosAgarrados()
	
	method tieneAlgunElemento() = inventario.hayElementos()

	method interaccionConAgua(){
		// Vacio para que no rompa WG
	}

	method establecerComportamiento() {
		game.onCollideDo(self, {algo => algo.interaccionConPersonaje()})
	}

	method quitarElemento(unElemento) {
		inventario.removerElemento(unElemento)
	}

	method advertencia(textoAdvertencia) {
		game.say(self, textoAdvertencia)
	}
	
	method seleccionado(imagenASetear, musica) {
		imagen = imagenASetear
		const musicaACambiar = game.sound("sounds/" + musica) // ABSTRAER EESTE CACHITO DE CODIGO
		juego.musica(musicaACambiar) // CUANDO INICIALICEMOS LA MUSICA EN ESTE PUNTO TENEMOS QUE USAR EL METODO CAMBIARMUSICA(PARAM)
		juego.reproducirMusica()
		//juego.cambiarMusica(musicaACambiar) // No se puede detener una musica que nunca se reprodujo
	}

	method tiene(elemento) = inventario.contiene(elemento)
}
