//
//  usuarioModel.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 4/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation

class usuarioModel {
    let nombreUsuario:String
    let telefonoUsuario:String
    let correoUsuario:String
    let passwordUsuario:String
    let ubicacionUsuario:String
    let estadoUsuario:Bool
    let fotoUsuario:String
    
    init(nombre:String,telefono:String,correo:String,password:String,ubicacion:String,estado:Bool,foto:String) {
        self.nombreUsuario = nombre
        self.telefonoUsuario = telefono
        self.correoUsuario = correo
        self.passwordUsuario = password
        self.ubicacionUsuario = ubicacion
        self.estadoUsuario = estado
        self.fotoUsuario = foto
    }
}
