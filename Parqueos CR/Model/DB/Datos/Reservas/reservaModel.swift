//
//  reservaModel.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 6/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation

class reservaModel {

    let idReserva:Int
    let parqueoReserva:String
    let horaReserva:String
    let espacioReserva:String
    let estadoReserva :String
    let placaReserva :String
    
    init(pIdReserva:Int,pParqueoReserva:String,pHoraReserva:String,pEspacioReserva:String,pEstadoReserva:String,pPlacaReserva:String) {
        self.idReserva = pIdReserva
        self.parqueoReserva = pParqueoReserva
        self.horaReserva = pHoraReserva
        self.espacioReserva = pEspacioReserva
        self.estadoReserva = pEstadoReserva
        self.placaReserva = pPlacaReserva
    }
}
