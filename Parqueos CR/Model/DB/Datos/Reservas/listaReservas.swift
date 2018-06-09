//
//  listaReservas.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 6/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation
import RealmSwift

class listaReservas {
    var ListaReservas = [reservaModel]()
    let realm = try! Realm()
    
    init() {
        //self.ListaVehiculos.append(vehiculosModel(paramPlaca: "BDL868", paramMarca: "Honda"))
        let valReservas = realm.objects(Reserva.self)
        print("Hay: ", valReservas.count," Reservas.")
        if(valReservas.count > 0){
            for reserva in valReservas {
                self.ListaReservas.append(reservaModel(pIdReserva: reserva.idReserva, pParqueoReserva: reserva.parqueoReserva, pHoraReserva: reserva.horaReserva, pEspacioReserva: reserva.espacioReserva, pEstadoReserva: reserva.estadoReserva, pPlacaReserva: reserva.placaReserva))
            }
        }
    }
}
