//
//  llenaTableParqueos.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 3/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation
import RealmSwift

class llenaTableParqueos{
    
    let realm = try! Realm()
    
    let arrayParqueos = listaParqueos()
    var arrayObject:[Object]?
    
    func guardaParqueos()
    {
        let valParqueos = realm.objects(Parqueos.self)
        
        if(valParqueos.count == 0){
            for parqueo in arrayParqueos.ListaParqueos {
                let tbParqueos = Parqueos()
                print(parqueo.nombreP)
                tbParqueos.nombrePQ = parqueo.nombreP
                tbParqueos.direccionPQ = parqueo.direccionP
                tbParqueos.telefonoPQ = parqueo.telefonoP
                tbParqueos.tarifaPQ = parqueo.tarifaP
                tbParqueos.latitudPQ = parqueo.latitudP
                tbParqueos.longitudPQ = parqueo.longitudP
                tbParqueos.idPQ = parqueo.idP
                tbParqueos.horarioPQ = parqueo.horarioP
                tbParqueos.totalEspacioPQ = parqueo.totalEspacioP
                tbParqueos.espaciosDisponiblesPQ = parqueo.espaciosDisponiblesP
                //realm.add(tbParqueos)
                try! realm.write {
                    realm.add(tbParqueos)
                }
                //arrayObject?.append(tbParqueos)
            }
            
        }
        else
        {
            print("Ya la tabla tiene: ", valParqueos.count, " Parqueos.")
        }
        
        try! realm.write {
            
        }
        
    }
    
}
