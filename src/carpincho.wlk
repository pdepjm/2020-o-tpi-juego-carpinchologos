import wollok.game.*
import lago.*
import juego.*
import personaje.*
import necesidades.*

class Carpincho {

	var imagen = "carpincho.png"

	var posicion = game.at(10,10) // lo pusimos asi para q no nos tire problema con la generacion del carpincho
	
	//const necesidades = #{hambriento} // maximo de 2
	
	var necesidad 

	var yaMuto = false
	
	constructor () {
		necesidad = juego.dameUnaNecesidad()
	}
	
	method elementoNecesario() = necesidad.objetoNecesario()
	
	method position() = posicion 

	method image() = imagen

	method avanzarAutomaticamente() {
		game.onTick(500, "carpincho avanza", { =>  self.avanzarLineaRecta()})
	}

	method avanzarLineaRecta() {
		posicion = self.position().left(1)
	}

	method aparecerEnBorde(){
		const y = 4.randomUpTo(game.height() - 4)
		posicion = game.at(30, y)
	}

	method pisaAgua() {
		imagen = "carpinchoEnojado.jpg"
	}
	
	method desaparecer() {
		juego.incrementarCarpinchosSalvados()
		game.removeTickEvent("carpincho avanza")
        game.removeVisual(self)

	}
	
	method necesidadSatisfecha(unPersonaje) {
		const elementos = unPersonaje.elementosAgarrados()
		return elementos.contains(necesidad.objetoNecesario())
	}

	method interaccionConPersonaje(unPersonaje) {
		if(self.necesidadSatisfecha(unPersonaje)){
				const elemento = self.elementoNecesario()
				self.mutarOMorir()				
				unPersonaje.quitarElemento(elemento)
		}
		else if (unPersonaje.tieneAlgunElemento()) {
				game.say(self, "No quiero ese elemento!")
		}
	}	
	
	method interaccionConAgua() {
		game.clear()
		//juego.mostrarReporte()
		
		//self.desaparecer()
		juego.mostrarReporte() //fondo.cambiarFondo("pasto.jpg")
		game.schedule(5000, { => game.stop()})

		//1. borra todos lo objetos 
		// 2. muestra el reporte
		// 3. se cierra
	}

	method aparecerYMover() {
		self.aparecerEnBorde()

		self.avanzarAutomaticamente()

		self.mostrarNecesidad()
	}
	
	method mostrarNecesidad() {
		const mensaje = "Tengo " + necesidad.nombre()

		game.schedule(3000, { => game.say(self, mensaje)}) // FALTA CAMBIAR DE COLOR LA IMAGEN DEL CARPINCHO
		/*
		 * imagen = necesidad.carpinchoImagen()
		 * 
		 */
	}

	method mutarOMorir(){
        if(not yaMuto){
            self.mutar()
        }else {
            self.desaparecer()
        }
    }

    method mutar(){
        //self.hacerRuidito()
        //necesidad.accion(self)
        yaMuto = true
		necesidad = juego.dameUnaNecesidadMutada()
        //cambiar la imagen y la necesidad (usando la funcion de los chicos)
        //ruidos de nacionalidad
    }

    method hacerRuidito(){
    	const sonido = game.sound("sounds/sonidoMorder.wav")
        sonido.play()
    }
}



/*Juego:
Cosas a definir: ¿Como ganaria el jugador?
Aparecen carpinchos cada X tiempo con una necesidad cada carpincho. Jugador tiene que 
Darle lo que necesita antes de que llegue al otro lado. Si le da lo que necesita, 
desaparece de la pantalla, y si llega al otro lado, el juego termina y pierde.

Carpincho:
- Avanza 
- Recibir elemento (validar si cubre o no necesidad)
  cubrir necesidad (desaparecer)
- desaparecer

Jugador:
- Agarrar
- Entregar


Al llegar a la abscisa 0, el juego se termina*/

/*method interaccionConPersonaje(unPersonaje){
		var elementoEnComun = unPersonaje.elementosDelPersonajeQueSatisfacenAlCarpincho(self) 
		// segun el modelado actual (correspondencia uno a uno entre necesidades y elementos que las satisfacen) 
		//este elemento puede ser uno solo
		
		if(not elementoEnComun.isEmpty()){
		// darle la frutita implica : carpincho eliminar la necesidad
    	//					 		  personaje eliminar objeto de la lista bolsita
		//							  frutita eliminar el objeto de la pantalla

		} //falta completar a futuro porque ahora solo lo estamos haciendo con una unica necesidad (posiblemente, ampliemos la cantidad de necesidades - ver)
	}*/

