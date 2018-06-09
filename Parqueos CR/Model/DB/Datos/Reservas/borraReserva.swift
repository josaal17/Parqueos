//
//  borraReserva.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 8/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation
import RealmSwift

class borraReserva {
    
    var idReserva: Int = 0
    
    let realm = try! Realm()
    
    init(paramReserva:Int) {
        self.idReserva = paramReserva
    }
    
    func borraReservacion() -> Bool{
        let consulta = realm.objects(Reserva.self).filter("idReserva == %@",self.idReserva)
        //print(consulta.count)
        if(consulta.count == 1){
            try! realm.write {
                realm.delete(consulta[0])
            }
            return true
        }else{
            return false
        }
        
    }
}
