import objetosQueSatisfacen.*

object tiposDeNecesidades {
	const necesidadesIniciales = [suenito, hambriento]

	const necesidadesMutadas = [argentino, irlandes, frances]
	
	method dameUnaNecesidadInicial() = necesidadesIniciales.anyOne()

	method dameUnaNecesidadMutada() = necesidadesMutadas.anyOne()
}

object hambriento {
	method objetoNecesario() = zanahoria
	
	method mensaje() = "Tengo hambrecito"
	method imagenAsociada() {}
	//method accion(unCarpincho){}
	
}

object suenito {
	method objetoNecesario() = comidita
	method imagenAsociada() {}

	method mensaje() = "Tengo suenito"

	//method accion(){}
}

object argentino { // Pensar después otro nombre
	method mensaje() = "Unas ganas de un matienzo!"
	method objetoNecesario() = mate
	method imagenAsociada() = "carpinArgento.png"
	
}

object irlandes { // Pensar después otro nombre
	method mensaje() = "Las ganas de una birrita que tengo"
	method objetoNecesario() = cerveza
	method imagenAsociada() = "carpinIrlandes.png"
	
}

object frances { // Pensar después otro nombre
	method mensaje() = "Me traes un baguette calentito?"
	method objetoNecesario() = baguette
	method imagenAsociada() = "carpinUlala.png"

}