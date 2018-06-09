//
//  Parqueos.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 3/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import RealmSwift

class Parqueos: Object {
    
    @objc dynamic var nombrePQ = ""
    @objc dynamic var direccionPQ = ""
    @objc dynamic var telefonoPQ = ""
    @objc dynamic var tarifaPQ = ""
    @objc dynamic var latitudPQ = 0.0
    @objc dynamic var longitudPQ = 0.0
    @objc dynamic var idPQ = 0
    @objc dynamic var horarioPQ = ""
    @objc dynamic var totalEspacioPQ = 0
    @objc dynamic var espaciosDisponiblesPQ = 0
    
}
