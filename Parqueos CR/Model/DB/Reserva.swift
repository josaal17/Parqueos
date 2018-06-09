//
//  Reserva.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 6/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import RealmSwift

class Reserva: Object {
    @objc dynamic var idReserva = 0
    @objc dynamic var parqueoReserva = ""
    @objc dynamic var horaReserva = ""
    @objc dynamic var espacioReserva = ""
    @objc dynamic var estadoReserva = ""
    @objc dynamic var placaReserva = ""
    
}
