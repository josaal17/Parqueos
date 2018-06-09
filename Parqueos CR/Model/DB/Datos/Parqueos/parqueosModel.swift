//
//  parqueosModel.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 3/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation

class parqueosModel {
    let nombreP:String
    let direccionP:String
    let telefonoP:String
    let tarifaP:String
    let latitudP:Double
    let longitudP:Double
    let idP:Int
    let horarioP:String
    let totalEspacioP:Int
    let espaciosDisponiblesP:Int
    
    init(nombre:String,direccion:String,telefono:String,tarifa:String,latitud:Double,longitud:Double,id:Int,horario:String,totalEspacio:Int,espaciosDisponibles:Int) {
        self.nombreP = nombre
        self.direccionP = direccion
        self.telefonoP = telefono
        self.tarifaP = tarifa
        self.latitudP = latitud
        self.longitudP = longitud
        self.idP = id
        self.horarioP = horario
        self.totalEspacioP = totalEspacio
        self.espaciosDisponiblesP = espaciosDisponibles
    }
}
