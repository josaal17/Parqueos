//
//  datosUsuario.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 7/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation
import RealmSwift

class datosUsuario {
    
    let realm = try! Realm()
    var nombre:String = ""
    var foto:String = ""
    var correo:String = ""
    var recordarDatos:Bool = false
    
    init() {
        
    }
    
    func datosUser(){
        let consulta = realm.objects(Usuario.self).filter("estadoUser == true")
        
        if(consulta.count == 1){
            print("Si hace Match")
            /*let tbUsuario = Usuario()
             tbUsuario.correoUser = self.correoUser
             tbUsuario.passwordUser = self.passwordUser
             try! realm.write {
             realm.add(tbUsuario)
             }*/
            nombre = consulta[0].nombreUser
            foto = consulta[0].fotoUser
            recordarDatos = consulta[0].recordarUser
            
        }else{
            print("No encontro datos")
            
        }
        
    }
    
    func recuerdaDatos() -> Bool {
        let consulta = realm.objects(Usuario.self)
        
        if(consulta.count == 1){
            print("Si recuerda datos.")
            recordarDatos = consulta[0].recordarUser
            return recordarDatos
        }else{
            return false
            
        }
    }
    
    func cargaDatos() -> String {
        let consulta = realm.objects(Usuario.self)
        
        if(consulta.count == 1){
            print("Si recuerda datos.")
            correo = consulta[0].correoUser
            return correo
        }else{
            return ""
            
        }
    }
    
    func actualizaRecuerdaDatos(){
        let consulta = realm.objects(Usuario.self)
        
        if(consulta.count == 1){
            //let updateUsuario = realm.objects(Usuario.self).filter("correoUser == %@",consulta[0].correoUser).first
            let updateUsuario = realm.objects(Usuario.self).first
            try! realm.write {
                updateUsuario?.recordarUser = recordarDatos
            }
        }else{
            
        }
    }
    
    
}
