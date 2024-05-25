//
//  Circulo.swift
//  Clase08_04
//
//  Created by Josue Garcia on 10/04/24.
//

import Foundation

class Circunferencia : Figura{
  init(_ radio:Double) {
    self.radio = radio
  }
  private var radio: Double
  var Radio:Double {
    get{return radio}
    set{radio = newValue}
  }
  override func CalcularArea() -> Double {
    let pi = Double.pi
    return pi * pow(radio, 2)
  }
}
