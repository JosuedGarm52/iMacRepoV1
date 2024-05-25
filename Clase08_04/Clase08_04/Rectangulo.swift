//
//  Rectangulo.swift
//  Clase08_04
//
//  Created by Josue Garcia on 10/04/24.
//

import Foundation

class Rectangulo: Figura{
  init(_ largo: Double, _ ancho: Double ){
    self.largo = largo
    self.ancho = ancho
  }
  private var largo: Double
  private var ancho:  Double
  var Largo: Double{
        get{return largo}
        set{largo = newValue}
    }
    var Ancho: Double{
        get{return ancho}
        set{ancho = newValue}
    }
  override func CalcularArea() -> Double{
            var area : Double
            area = (Ancho * Largo)
            return area
    }
}
