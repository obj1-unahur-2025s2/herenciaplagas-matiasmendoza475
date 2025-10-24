import plagas.*
class Hogar {
  const confort
  var property nivelDeMugre

  method esBueno() {
    return nivelDeMugre <= confort*0.5
  }
  method recibirAtaque(unaPlaga) {
    nivelDeMugre = nivelDeMugre + unaPlaga.nivelDeDañoQueProduce()
    
  }
}

class Huerta {
    var capacidadProduccion

    method capacidadProduccion() = capacidadProduccion 
    method esBueno() {
        return self.capacidadProduccion() > nivelMinimoRequerido.valor()
    }
    method recibirAtaque(unaPlaga){
        capacidadProduccion = (capacidadProduccion - unaPlaga.nivelDeDañoQueProduce() *0.1
        - if(unaPlaga.transmiteEnfermedades()) 10 else 0).max(0)
       

    }
}


object nivelMinimoRequerido {
    var property valor = 15
}

class Mascota {
    var salud

    method salud() = salud 
    method esBueno() {
        return salud > 250
    }
    method recibirAtaque(unaPlaga){
        if(unaPlaga.transmiteEnfermedades()){
            salud = (salud - unaPlaga.nivelDeDañoQueProduce()).max(0)
        }
        
    }
}

class Barrio {
    const property elementos =  []

    method agregarElemento(unElemento) {
      elementos.add(unElemento)
    }
    method quitarElemento(unElemento) {
      elementos.remove(unElemento)
    }

    method esCopado() {
        return self.cantidadDeElementosBuenos() > self.cantidadDeElementosNoBuenos()
    }
    method cantidadDeElementosBuenos() {
        return elementos.count({e=> e.esBueno()})
    }
    method cantidadDeElementosNoBuenos() {
        return elementos.count({e=> !e.esBueno()})
    } 
}