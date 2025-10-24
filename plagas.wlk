class Plaga {
  var poblacion

  method poblacion() = poblacion 
  method transmiteEnfermedades() {
    return poblacion >= 10
  }

  method atacar(unElemento){
    unElemento.recibirAtaque(self)
    self.efectoDespuesDeAtacar()
  }
  method efectoDespuesDeAtacar(){
    poblacion = poblacion + poblacion * 0.1
  }
}

class Cucarachas inherits Plaga {
  
  var pesoPromedio

  method nivelDeDañoQueProduce(){
    return poblacion * 0.5
  }
  override method transmiteEnfermedades() {
    return super() && pesoPromedio >= 10
  }
  override method efectoDespuesDeAtacar(){
    super()
    pesoPromedio = pesoPromedio + 2
  }
}

class Pulgas inherits Plaga {

  method nivelDeDañoQueProduce() {
    return poblacion *2
  }
}

class Garrapatas inherits Pulgas {
    override method efectoDespuesDeAtacar(){
        poblacion = poblacion * 1.2
    }
}

class Mosquitos inherits Plaga {

  method nivelDeDañoQueProduce(){
    return poblacion
  }
  override method transmiteEnfermedades() {
    return super() && poblacion % 3 == 0
  }
}