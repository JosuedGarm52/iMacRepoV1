//
//  Rectangulo.swift
//  ParedRect
//
//  Created by Josue Garcia on 23/03/24.
//

import Foundation

class Rectangulo{
      private var largo: Double = 0.0
      private var ancho: Double = 0.0

      var Largo: Double{
        get{return largo}
        set{largo = newValue}
      }
      var Ancho: Double{
        get{return ancho}
        set{ancho = newValue}
      }
      init(_ largo: Double, _ ancho: Double){
        self.largo = largo
        self.ancho = ancho
      }
      func CalcularArea() -> Double{
        var area : Double
        area = (Ancho * Largo)
        return area
      }
}
