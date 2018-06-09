//
//  Persona.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 4/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import RealmSwift

class Usuario: Object {
    
    @objc dynamic var nombreUser = ""
    @objc dynamic var telefonoUser = ""
    @objc dynamic var correoUser = ""
    @objc dynamic var passwordUser = ""
    @objc dynamic var ubicacionUser = ""
    @objc dynamic var estadoUser = false
    @objc dynamic var fotoUser = ""
    @objc dynamic var recordarUser = false
}
