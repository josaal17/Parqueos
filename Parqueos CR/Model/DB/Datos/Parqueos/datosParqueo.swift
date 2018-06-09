//
//  datosParqueo.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 8/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation
//
//  datosUsuario.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 7/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation
import RealmSwift

class datosParqueo {
    
    let realm = try! Realm()
    var nombre:String = ""
    var direccion:String = ""
    var telefono:String = ""
    var tarifa:String = ""
    var horario:String = ""
    var espaciosDisponibles:Int = 0
    var id:Int = 0
    var latitud:Double = 0.0
    var longitud:Double = 0.0
    
    init() {
        
    }
    
    func datosPQ(){
        let consulta = realm.objects(Parqueos.self).filter("nombrePQ == %@", self.nombre)
        
        if(consulta.count == 1){
            print("Si hace Match")
            nombre = consulta[0].nombrePQ
            direccion = consulta[0].direccionPQ
            telefono = consulta[0].telefonoPQ
            tarifa = consulta[0].tarifaPQ
            horario = consulta[0].horarioPQ
            espaciosDisponibles = consulta[0].espaciosDisponiblesPQ
            latitud = consulta[0].latitudPQ
            longitud = consulta[0].longitudPQ
            id = consulta[0].idPQ
            
        }else{
            print("No encontro datos")
            
        }
    }
}
