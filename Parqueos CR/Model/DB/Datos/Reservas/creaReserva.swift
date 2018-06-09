//
//  creaReserva.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 8/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation
import RealmSwift

class creaReserva {

    var parqueoReserva:String = ""
    var horaReserva:String = ""
    var espacioReserva:String = ""
    var estadoReserva:String = ""
    var placaReserva:String = ""
    
    let realm = try! Realm()
    
    init(paramParqueoReserva:String,paramHoraReserva:String,paramEspacioReserva:String,paramEstadoReserva:String,paramPlacaReserva:String) {
        self.parqueoReserva = paramParqueoReserva
        self.horaReserva = paramHoraReserva
        self.estadoReserva = paramEspacioReserva
        self.estadoReserva = paramEstadoReserva
        self.placaReserva = paramPlacaReserva
    }
    
    func guardaReserva() -> Bool{
        let consulta = realm.objects(Reserva.self).filter("parqueoReserva == %@ AND placaReserva == %@",self.parqueoReserva, self.placaReserva)
        
        if(consulta.count > 0){
            print("Ya existe la Reserva")
            return false
        }else{
            let tbReserva = Reserva()
            tbReserva.idReserva = tbReserva.idReserva + 1
            tbReserva.parqueoReserva = self.parqueoReserva
            tbReserva.horaReserva = self.horaReserva
            tbReserva.espacioReserva = self.espacioReserva
            tbReserva.estadoReserva = self.estadoReserva
            tbReserva.placaReserva = self.placaReserva
            try! realm.write {
                realm.add(tbReserva)
            }
            return true
        }
        
    }
}
