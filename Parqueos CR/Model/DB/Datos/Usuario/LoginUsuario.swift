//
//  LoginUsuario.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 6/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation
import RealmSwift

class LoginUsuario {
    
    var correoUser:String = ""
    var passwordUser:String = ""
    
    let realm = try! Realm()
    
    init(paramCorreo:String,paramPassword:String) {
        self.correoUser = paramCorreo
        self.passwordUser = paramPassword
    }
    
    func loginUsuario() -> Bool{
        let consulta = realm.objects(Usuario.self).filter("correoUser == %@ AND passwordUser == %@ AND estadoUser == false",self.correoUser,self.passwordUser)
        
        if(consulta.count == 1){
            print("Si hace Match")
            /*let tbUsuario = Usuario()
            tbUsuario.correoUser = self.correoUser
            tbUsuario.passwordUser = self.passwordUser
            try! realm.write {
                realm.add(tbUsuario)
            }*/
            let updateUsuario = realm.objects(Usuario.self).filter("correoUser == %@",self.correoUser).first
            try! realm.write {
                updateUsuario?.estadoUser = true
            }
            return true
        }else{
            print("No hay coincidencias")
            return false
        }
        
    }
    
    func existeUsuario() -> Bool{
        let consulta = realm.objects(Usuario.self).filter("correoUser == %@",self.correoUser)
        
        if(consulta.count == 1){
            print("Si existe el Usuario")
            return true
        }else{
            print("No existe el Usuario")
            return false
        }
        
    }
}
