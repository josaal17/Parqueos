//
//  preguntaSession.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 6/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation
import RealmSwift

class preguntaSession {
    

    let realm = try! Realm()
    
    init() {

    }
    
    func estadoUsuario() -> Bool{
        let consulta = realm.objects(Usuario.self)
        if(consulta.count > 0){
            print("SI hay usuario")
            if(consulta[0].estadoUser == true)
            {
                print("El valor de estadoUser es: ", consulta[0].estadoUser)
                return true
            }
            else
            {
                return false
            }
        }else{
            return false
        }
        
    }
}
