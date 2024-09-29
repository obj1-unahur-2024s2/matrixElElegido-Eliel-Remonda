object nave {
    const pasajeros = [neo, morfeo, trinity]
    method pasajeros() = pasajeros
    
    method subirNave(unPasajero){
        pasajeros.add(unPasajero)
    }


    method bajarNave(unPasajero){
        pasajeros.remove(unPasajero)
    }

    method cantidadPasajeros(){
        return pasajeros.size()
    }

    method mayorVitalidad(){
        return pasajeros.max({p => p.vitalidad()})
    }

    method menorVitalidad() {
        return pasajeros.min({p => p.vitadlidad()})
    }

    method estaEquilibrada(){
        return self.mayorVitalidad() <= self.menorVitalidad() * 2
    }

    method estaElElegido(){
        return pasajeros.any({p => p.esElElegido()})
    }

    method chocar(){
        pasajeros.forEach({ p => p.saltar()})
        pasajeros.clear()
    }
    method acelerar1(){
        if (!pasajeros.esElElegido()) 
            pasajeros.saltar()
    }
    method pasajerosSinElElegido() {
        return pasajeros.filter({p => !p.esElElegido()})
    }
    method acelerar() {
        self.pasajerosSinElElegido().forEach({p => p.saltar()})
    }
}

object neo {
    var energia = 100
    method esElElegido() = true
    method saltar() {
        energia = energia / 2
    }
    method vitalidad() {
        return energia * 0.1
    }
}

object morfeo {
    var vitalidad = 8
    var descansado = false
    method esElElegido() = false
    method vitalidad() = vitalidad
    method saltar(){
        vitalidad -= 1
        descansado = !descansado
    }
    method descansado() = descansado
}

object trinity {
    method vitalidad() = 0
    method esElElegido() = false
    method saltar() {}
}