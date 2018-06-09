//
//  listaParqueos.swift
//  Parqueos CR
//
//  Created by MacBookDesarrolloTecno on 3/6/18.
//  Copyright © 2018 Technical-PC. All rights reserved.
//

import Foundation

class listaParqueos {
    var ListaParqueos = [parqueosModel]()
    
    init() {
        self.ListaParqueos.append(parqueosModel(nombre: "Parqueo de Cenfotec", direccion: "203, San José, San Pedro", telefono: "6000 8050", tarifa: "Gratuito Estudiantes", latitud: 9.933153, longitud: -84.031139, id: 1, horario: "Mismo horario de la Universidad", totalEspacio: 150, espaciosDisponibles: 15))
        self.ListaParqueos.append(parqueosModel(nombre: "Parqueo San Lorenzo School", direccion: "Carr. a Granadilla, San José, San Pedro", telefono: "8965 8457", tarifa: "Gratuito Estudiantes y Profesores", latitud: 9.930623, longitud: -84.030675, id: 2, horario: "Mismo horario de la Universidad y School", totalEspacio: 25, espaciosDisponibles: 10))
        self.ListaParqueos.append(parqueosModel(nombre: "Parqueo público La Merced", direccion: "Calle 12, San José", telefono: "2222 3556", tarifa: "1000 col por Hora.", latitud: 9.932022, longitud: -84.084175, id: 3, horario: "L a D de 7:00am a 7:00pm", totalEspacio: 80, espaciosDisponibles: 22))
        self.ListaParqueos.append(parqueosModel(nombre: "Parqueo 24 Horas", direccion: "Av 5, San José, San Pedro", telefono: "8888 8897", tarifa: "1500 por Hora.", latitud: 9.936733, longitud: -84.077087, id: 4, horario: "Mismo horario de la Universidad y School", totalEspacio: 100, espaciosDisponibles: 25))
        self.ListaParqueos.append(parqueosModel(nombre: "Parqueo Asís", direccion: "Costado oeste de la Plaza Asís, Calle 2, Provincia de Cartago, Cartago", telefono: "2552 4360", tarifa: "900 por Hora.", latitud: 9.860619, longitud: -83.921804, id: 5, horario: "L-S de 7:00am a 8:00pm", totalEspacio: 78, espaciosDisponibles: 45))
        self.ListaParqueos.append(parqueosModel(nombre: "Parqueo Público Santiago", direccion: "50m Sur del Banco Nacional, Calle 4, Provincia de Cartago, Cartago", telefono: "8989 8267", tarifa: "1000 por Hora.", latitud: 9.864836, longitud: -83.921826, id: 6, horario: "L-S de 7:00am a 10:20pm", totalEspacio: 70, espaciosDisponibles: 8))
        self.ListaParqueos.append(parqueosModel(nombre: "Parqueo Maria Fernanda", direccion: "Calle 4, Provincia de Cartago, Cartago", telefono: "2222 9078", tarifa: "1000 por Hora.", latitud: 9.866356, longitud: -83.921905, id: 7, horario: "L-S de 7:00am a 8:00pm", totalEspacio: 68, espaciosDisponibles: 7))
        self.ListaParqueos.append(parqueosModel(nombre: "Parqueo Doña Leonor", direccion: "Calle 14B, Cartago Province, Cartago", telefono: "2550 2970", tarifa: "1000 por Hora.", latitud: 9.862495, longitud: -83.927705, id: 8, horario: "L-S de 7:00am a 8:00pm", totalEspacio: 69, espaciosDisponibles: 23))
        self.ListaParqueos.append(parqueosModel(nombre: "Parqueo La Basílica", direccion: "Detrás de la Basílica de los Ángeles, Calle 15A, Provincia de Cartago, Cartago", telefono: "6798 3421", tarifa: "1000 por Hora.", latitud: 9.864270, longitud: -83.912175, id: 9, horario: "L-D de 8:30am a 8:00pm", totalEspacio: 55, espaciosDisponibles: 5))
        self.ListaParqueos.append(parqueosModel(nombre: "Parqueo Mora & Monge", direccion: "Provincia de Cartago, Cartago", telefono: "8888 4444", tarifa: "1000 por Hora.", latitud: 9.865099, longitud: -83.918921, id: 10, horario: "L-S de 7:00am a 8:00pm", totalEspacio: 33, espaciosDisponibles: 9))
    }
    
}
