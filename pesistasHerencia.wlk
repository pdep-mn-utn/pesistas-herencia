class Pesista {

  var property imm // Índice de Masa muscular

  method entrenaFierros(horas) {

    imm += horas / 24 

  }

  method entrenaCardio(kilometros) {

    imm = (imm - kilometros / 10).max(0)

  }

}

class CrossFitter inherits Pesista {}

class PowerLifter inherits Pesista {

  const turnosDiarios = 3

  override method entrenaFierros(horas) {
    
    super(horas * turnosDiarios)

  }

  override method entrenaCardio(kilometros) {}

}

class BodyBuilder inherits Pesista {

  const dosisTestosterona = 2

  override method entrenaFierros(horas) {

    self.entrenaCardio(1)
    super(horas ** dosisTestosterona)

  }

}

object theKing inherits BodyBuilder(imm = 100, dosisTestosterona = 7) {

  var property posesRealizadas = 0

  override method entrenaFierros(horas) {

    super(horas)
    posesRealizadas += self.posesDelEntrenamiento() 
  }

  method posesDelEntrenamiento() = 1.randomUpTo(10).truncate(0)

}