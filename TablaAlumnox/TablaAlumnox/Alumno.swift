//
//  Alumno.swift
//  TablaAlumnox
//
//  Created by Josue Garcia on 19/05/24.
//

import Foundation
import UIKit

class Alumno{
    var fotoPerfil : UIImage
    var nombre : String
    var promedio : Double
    var numeroControl : Int

    init(fotoPerfil : UIImage, nombre: String, promedio: Double, numeroControl: Int){
        self.fotoPerfil = fotoPerfil
        self.nombre = nombre
        self.promedio = promedio
        self.numeroControl = numeroControl
    }
}	
