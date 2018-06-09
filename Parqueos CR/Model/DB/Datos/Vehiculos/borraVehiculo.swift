//
//  borraVehiculo.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 7/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation
import RealmSwift

class borraVehiculo {
    
    var placaCarro: String = ""

    let realm = try! Realm()
    
    init(paramPlaca:String) {
        self.placaCarro = paramPlaca
    }
    
    func borraPlaca() -> Bool{
        let consulta = realm.objects(Vehiculo.self).filter("placaCar == %@",self.placaCarro)
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
