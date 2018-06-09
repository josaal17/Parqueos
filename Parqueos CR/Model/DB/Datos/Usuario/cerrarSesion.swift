//
//  cerrarSesion.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 7/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation
import RealmSwift

class cerrarSesion {
    
    let realm = try! Realm()
    
    init() {
 
    }
    
    func logout() -> Bool{
        let consulta = realm.objects(Usuario.self).filter("estadoUser == true")
        
        if(consulta.count == 1){
            print("Si hace Match")
            /*let tbUsuario = Usuario()
             tbUsuario.correoUser = self.correoUser
             tbUsuario.passwordUser = self.passwordUser
             try! realm.write {
             realm.add(tbUsuario)
             }*/
            let updateUsuario = realm.objects(Usuario.self).filter("correoUser == %@",consulta[0].correoUser).first
            try! realm.write {
                updateUsuario?.estadoUser = false
            }
            return true
        }else{
            print("No actualizo, no cierra sesion")
            return false
        }
        
    }
}
