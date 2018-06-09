//
//  ParqueoAnotacionMap.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 5/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//


import MapKit

class ParqueoAnotacionMap: NSObject, MKAnnotation {
    let title: String?
    let disponibilidad: String?
    let coordinate: CLLocationCoordinate2D
    let idParqueo: Int
    
    init(title: String, disponibilidad: String, coordinate: CLLocationCoordinate2D, idParqueo:Int) {
        self.title = title
        self.coordinate = coordinate
        self.disponibilidad = disponibilidad
        self.idParqueo = idParqueo
        
        super.init()
    }
    
    var subtitle: String? {
        return disponibilidad
    }
    
    var idPQ: Int? {
        return idParqueo
    }
}
