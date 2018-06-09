//
//  vehiculosModel.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 4/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation

class vehiculosModel {
    let placaCarro:String
    let marcaCarro:String
    
    init(paramPlaca:String,paramMarca:String) {
        self.placaCarro = paramPlaca
        self.marcaCarro = paramMarca
    }
}
