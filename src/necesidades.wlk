import objetosQueSatisfacen.*
import personaje.*
import carpincho.*
import wollok.game.*

object tiposDeNecesidades {
	const necesidadesIniciales = [hambrientoDeZanahorias, hambrientoDeManzana]

	const necesidadesMutadas = [argentino, irlandes, frances]
	
	method dameUnaNecesidadInicial() = necesidadesIniciales.anyOne()

	method dameUnaNecesidadMutada() = necesidadesMutadas.anyOne()
}

class Necesidad {

	method esSatisfechaPorPersonaje() = personaje.tiene(self.objetoNecesario())
	method mensaje()
	method objetoNecesario()
	method imagenAsociada()
	
	method efecto(unCarpincho){
		self.objetoNecesario().reproducirSonidoDeAccion()
		personaje.quitarElemento(self.objetoNecesario())
	}

	method mostrarse(unCarpincho) {
		game.say(unCarpincho,self.mensaje())		
	}
}

class NecesidadBasica inherits Necesidad{
	override method imagenAsociada() = "carpincho.png"
	
	override method efecto(unCarpincho) {
		super(unCarpincho)
		const necesidadMutada = tiposDeNecesidades.dameUnaNecesidadMutada()
		unCarpincho.necesidad(necesidadMutada)
	}
}

object hambrientoDeZanahorias inherits NecesidadBasica {
	override method mensaje() = "TRAEME ZANAHORIAS"
	override method objetoNecesario() = zanahoria
}

object hambrientoDeManzana inherits NecesidadBasica {
	override method mensaje() = "NECESITO UNA MANZANA"
	override method objetoNecesario() = manzana
	
}

class NecesidadMutada inherits Necesidad {

 	override method efecto(unCarpincho) {
		super(unCarpincho)
		unCarpincho.desaparecer()
	 }
}

object argentino inherits NecesidadMutada { 
	override method mensaje() = "QUE GANAS DE UN MATTIOLI REEEY!"
	override method objetoNecesario() = matienzo
	override method imagenAsociada() = "carpinArgento.png"

}

object irlandes inherits NecesidadMutada { 
	override method mensaje() = "ALCANZAME UNA BIRRITA"
	override method objetoNecesario() = birra
	override method imagenAsociada() = "carpinIrlandes.png"
	
}

object frances inherits NecesidadMutada { 
	override method mensaje() = "ME TRAES UN BAGUETTE CALENTITO?"
	override method objetoNecesario() = baguette
	override method imagenAsociada() = "carpinUlala.png"

}
