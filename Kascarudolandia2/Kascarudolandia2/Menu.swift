//
//  Menu.swift
//  Kascarudolandia2
//
//  Created by Josue Garcia on 21/04/24.
//

import Foundation

class Menu{
    private let CostoHambNormal = 40
    private var _NumHamburNormal: Int = 0
    
    var numHamburNormal: Int {
        get {
            return _NumHamburNormal
        }
        set {
            if newValue >= 0 {
                _NumHamburNormal = newValue
            } else {
                print("Error: El número de hamburguesas debe ser un número positivo.")
            }
        }
    }
    private let CostoHambQueso = 50
    private var _NumHamburQueso: Int = 0
    var numHamburQueso: Int {
        get {
            return _NumHamburQueso
        }
        set {
            if newValue >= 0 {
                _NumHamburQueso = newValue
            } else {
                print("Error: El número de hamburguesas con queso debe ser un número positivo.")
            }
        }
    }
    private let CostoPapas = 20
    private var _NumPapas: Int = 0
    var numPapas: Int {
        get {
            return _NumPapas
        }
        set {
            if newValue >= 0 {
                _NumPapas = newValue
            } else {
                print("Error: El número de papas debe ser un número positivo.")
            }
        }
    }
    private let CostoRefresco = 12
    private var _NumRefresco: Int = 0
    var numRefresco: Int {
        get {
            return _NumRefresco
        }
        set {
            if newValue >= 0 {
                _NumRefresco = newValue
            } else {
                print("Error: El número de refrescos debe ser un número positivo.")
            }
        }
    }
    private let CostoPostre = 8
    private var _NumPostre: Int = 0
    var numPostre: Int {
        get {
            return _NumPostre
        }
        set {
            if newValue >= 0 {
                _NumPostre = newValue
            } else {
                print("Error: El número de refrescos debe ser un número positivo.")
            }
        }
    }
    
    public var Descuento = false
    
    private var Propina = 0
    
    func AsignarPropina(_ x : Int){
        if x == 1 {
            Propina = 3
        }else if x == 2{
            Propina = 10
        }else if x == 3 {
            Propina = 15
        }else {
            Propina = 0
        }
    }
    
    func Cuenta() -> String{
        if _NumHamburNormal > 0,
            _NumHamburQueso > 0,
            _NumPapas > 0,
            _NumPostre > 0,
            _NumRefresco > 0{
            
            var texto = "-- Cuenta --\n-------------\n"
            let totalHN:Double = 0
            let totalHQ:Double = 0
            let totalP:Double = 0
            let totalPo:Double = 0
            let totalR:Double = 0
            if _NumHamburNormal > 0 {
                let totalHN = Double(_NumHamburNormal * CostoHambNormal) * (Descuento ? 0.5 : 1.0)
                texto += String(format:"-- X(%d) Hamburguesas normales: .... $ %.2f \n",_NumHamburNormal,totalHN)
            }
            if _NumHamburQueso > 0 {
                let totalHQ = Double(_NumHamburQueso * CostoHambQueso) * (Descuento ? 0.5 : 1.0)
                texto += String(format:"-- X(%d) Hamburguesas con queso: ..... $ %.2f",_NumHamburQueso,totalHQ)
            }
            if _NumPapas > 0 {
                let totalP = Double(_NumPapas * CostoPapas) * (Descuento ? 0.5 : 1.0)
                texto += String(format:"-- X(%d) Paquetes de papas: .......... $ %.2f",_NumPapas,totalP)
            }
            if _NumPostre > 0{
                let totalPo = Double(_NumPostre * CostoPostre) * (Descuento ? 0.5 : 1.0)
                texto += String(format:"-- X(%d) Postres: ..................... $ %.2f",_NumPostre,totalPo)
            }
            if _NumRefresco > 0{
            let totalR = Double(_NumRefresco * CostoRefresco) * (Descuento ? 0.5 : 1.0)
                texto += String(format:"-- X(%d) Refrescos: ................... $ %.2f",_NumRefresco,totalR)
            }
            texto += "-----------------"
            let articulosTotales = _NumHamburNormal + _NumHamburQueso + _NumPapas + _NumPostre + _NumRefresco
            
            texto += "-- Numeros de articulos: \(articulosTotales)\n\n"
            
            let subtotal = totalHN + totalHQ + totalP + totalPo + totalR
            
            texto += String(format: "-- Subtotal $ %.2f \n", subtotal )
            
            var prop: Double
            if Propina == 3{
                prop = 0.03
            }else if Propina == 10{
                prop = 0.10
            }else if Propina == 15{
                prop = 0.15
            }else {
                prop = 0
            }
            
            texto += String(format: "-- Propina %d %% $ %.2f \n", Propina, (Double(subtotal) * prop))
            
            let total = (Double(subtotal) * prop) + Double(subtotal)
            
            texto += String(format: "-- Total a pagar $ %.2f \n", total )
            
            return texto
        }else{
            return "La mesa aun no ha ordenado"
        }
    }
}
