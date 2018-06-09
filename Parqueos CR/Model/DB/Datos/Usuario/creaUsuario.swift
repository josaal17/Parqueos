//
//  creaUsuario.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 6/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation
import RealmSwift

class creaUsuario {
    
    var nombreUser:String = ""
    var telefonoUser:String = ""
    var correoUser:String = ""
    var passwordUser:String = ""
    var ubicacionUser:String = ""
    var estadoUser:Bool = false
    
    let realm = try! Realm()
    
    init(paramNombre:String,paramTelefono:String,paramCorreo:String,paramPassword:String,paramUbicacion:String,paramEstado:Bool) {
        self.nombreUser = paramNombre
        self.telefonoUser = paramTelefono
        self.correoUser = paramCorreo
        self.passwordUser = paramPassword
        self.ubicacionUser = paramUbicacion
        self.estadoUser = paramEstado
    }
    
    func guardaUsuario() -> Int{
        let consulta = realm.objects(Usuario.self).filter("correoUser == %@",self.correoUser)
        
        if(consulta.count > 0){
            print("Ya existe el Usuario")
            return 0
        }else{
            let tbUsuario = Usuario()
            tbUsuario.nombreUser = self.nombreUser
            tbUsuario.telefonoUser = self.telefonoUser
            tbUsuario.correoUser = self.correoUser
            tbUsuario.passwordUser = self.passwordUser
            tbUsuario.ubicacionUser = self.ubicacionUser
            tbUsuario.estadoUser = self.estadoUser
            try! realm.write {
                realm.add(tbUsuario)
            }
            return 1
        }
        
    }
}
