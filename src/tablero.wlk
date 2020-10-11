
object tablero {

    method generarTablero(){
        self.generarAgua()
        
    }

    /*method generarAgua() {
        numero.times({n => const agua = new Agua()})

        for (int y = 0; y <= 20; y++){
            const agua = new Agua(agua.position(0, y))
        }

    }*/

}


class Agua {
    var position = game.at(0,0)
	method position(unaPosition) {
        position = unaPosition
    }
	method image() = "agua.png"

}


