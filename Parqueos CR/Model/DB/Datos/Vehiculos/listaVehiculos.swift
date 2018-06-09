//
//  listaVehiculos.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 4/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation
import RealmSwift

class listaVehiculos {
    var ListaVehiculos = [vehiculosModel]()
    let realm = try! Realm()
    
    init() {
        //self.ListaVehiculos.append(vehiculosModel(paramPlaca: "BDL868", paramMarca: "Honda"))
        let valVehiculos = realm.objects(Vehiculo.self)
        print("Hay: ", valVehiculos.count," placas.")
        if(valVehiculos.count > 0){
            for parqueo in valVehiculos {
                
                self.ListaVehiculos.append(vehiculosModel(paramPlaca: parqueo.placaCar, paramMarca: parqueo.marcaCar))
            }
        }
    }
    
}
