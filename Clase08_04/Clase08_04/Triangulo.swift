//
//  Triangulo.swift
//  Clase08_04
//
//  Created by Josue Garcia on 10/04/24.
//

import Foundation

class Triangulo: Figura{
  init(_ altura:Double, _ base:Double){
      self.altura = altura
      self.base = base
  }
  private var altura:Double
  private var base: Double
  var Altura: Double{
        get{return altura}
        set{altura = newValue}
    }
    var Base: Double{
        get{return base}
        set{base = newValue}
    }
    override func CalcularArea() -> Double{
        return ((Base * Altura)/2)
    }
}
