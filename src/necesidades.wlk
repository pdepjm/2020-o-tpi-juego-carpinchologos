import objetosQueSatisfacen.*
import personaje.*

object tiposDeNecesidades {
	const necesidadesIniciales = [hambrientoDeZanahorias, hambrientoDeManzana]

	const necesidadesMutadas = [argentino, irlandes, frances]
	
	method dameUnaNecesidadInicial() = necesidadesIniciales.anyOne()

	method dameUnaNecesidadMutada() = necesidadesMutadas.anyOne()
}

class Necesidad {

	method esSatisfechaPorPersonaje() = personaje.tiene(self.objetoNecesario())
	/*{
		const elementos = unPersonaje.elementosAgarrados()		//unPersonaje.contieneElemento(objetoNecesario)
		return elementos.contains(necesidad.objetoNecesario())
	}*/
	
	method mensaje()
	method objetoNecesario()
	method imagenAsociada() = "carpincho.png"
}

object hambrientoDeZanahorias inherits Necesidad {
	override method mensaje() = "TRAEME ZANAHORIAS"
	override method objetoNecesario() = zanahoria
	//method accion() aca iria la parte de mutar
}

object hambrientoDeManzana inherits Necesidad {
	override method mensaje() = "NECESITO UNA MANZANA"
	override method objetoNecesario() = manzana
	//method accion() aca iria la parte de mutar
}

object argentino inherits Necesidad { 
	override method mensaje() = "QUE GANAS DE UN MATTIOLI REEEY!"
	override method objetoNecesario() = matienzo
	override method imagenAsociada() = "carpinArgento.png"
	//override method accion() aca muere
}

object irlandes inherits Necesidad { 
	override method mensaje() = "ALCANZAME UNA BIRRITA"
	override method objetoNecesario() = birra
	override method imagenAsociada() = "carpinIrlandes.png"
	//override method accion() aca muere
}

object frances inherits Necesidad { 
	override method mensaje() = "ME TRAES UN BAGUETTE CALENTITO?"
	override method objetoNecesario() = baguette
	override method imagenAsociada() = "carpinUlala.png"
	//method accion() aca muere
}