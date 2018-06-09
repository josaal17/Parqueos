//
//  guardaVehiculo.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 5/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation
import RealmSwift

class guardaVehiculo {
    
    var placaCarro: String = ""
    var marcaCarro: String = ""
    
    let realm = try! Realm()
    
    init(paramPlaca:String,paramMarca:String) {
        self.marcaCarro = paramMarca
        self.placaCarro = paramPlaca
    }
    
    func guardaPlaca() -> Int{
        let consulta = realm.objects(Vehiculo.self).filter("placaCar == %@",self.placaCarro)
        
        if(consulta.count > 0){
            return 0
        }else{
            let tbVehiculo = Vehiculo()
            tbVehiculo.placaCar = self.placaCarro
            tbVehiculo.marcaCar = self.marcaCarro
            try! realm.write {
                realm.add(tbVehiculo)
            }
            return 1
        }
        
    }
}
