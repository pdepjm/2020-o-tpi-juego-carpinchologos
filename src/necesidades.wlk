import objetosQueSatisfacen.*

object tiposDeNecesidades {
	const necesidadesIniciales = [hambrientoDeZanahorias, hambrientoDeManzana]

	const necesidadesMutadas = [argentino, irlandes, frances]
	
	method dameUnaNecesidadInicial() = necesidadesIniciales.anyOne()

	method dameUnaNecesidadMutada() = necesidadesMutadas.anyOne()
}

object hambrientoDeZanahorias {
	method mensaje() = "TRAEME ZANAHORIAS"
	method objetoNecesario() = zanahoria
	method imagenAsociada() {}
}

object hambrientoDeManzana {
	method mensaje() = "NECESITO UNA MANZANA"
	method objetoNecesario() = manzana
	method imagenAsociada() {}
}

object argentino { 
	method mensaje() = "QUE GANAS DE UN MATTIOLI REEEY!"
	method objetoNecesario() = matienzo
	method imagenAsociada() = "carpinArgento.png"
}

object irlandes { 
	method mensaje() = "ALCANZAME UNA BIRRITA"
	method objetoNecesario() = birra
	method imagenAsociada() = "carpinIrlandes.png"
}

object frances { 
	method mensaje() = "ME TRAES UN BAGUETTE CALENTITO?"
	method objetoNecesario() = baguette
	method imagenAsociada() = "carpinUlala.png"
}