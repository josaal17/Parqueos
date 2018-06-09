//
//  listaUsuario.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 4/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation
import RealmSwift

class listaUsuario {
    var Usuarios = [usuarioModel]()
    let realm = try! Realm()
    let arrayUsuario = listaUsuario()
    
    init() {
        
        let valUsuario = realm.objects(Usuario.self)
        
        if(valUsuario.count > 0){
            for usuario in valUsuario {
                
                self.Usuarios.append(usuarioModel(nombre: usuario.nombreUser, telefono: usuario.telefonoUser, correo: usuario.correoUser, password: usuario.passwordUser, ubicacion: usuario.ubicacionUser, estado: usuario.estadoUser, foto: usuario.fotoUser))
            }
        }
        
    }
    
}
