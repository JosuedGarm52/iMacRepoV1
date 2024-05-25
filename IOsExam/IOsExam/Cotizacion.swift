//
//  Cotizacion.swift
//  IOsExam
//
//  Created by Josue Garcia on 22/04/24.
//

import Foundation

class Cotizacion{

    var montoCarro = 500000
    private let compacto = 500000
    private let familiar = 700000
    private let deportivo = 950000
    
    func cambiarCarro(_ x : Int){
        if x == 1{
            montoCarro = compacto
        }else if x == 2{
            montoCarro = familiar
        }else {
            montoCarro = deportivo
        }
    }
    
    var enganche = 20
    func CalcularEnganche() -> String{
            var x : Double = 0.0
            if enganche == 20{
                x = Double(montoCarro) * 0.2
            }else if enganche == 30{
                 x =  Double(montoCarro) * 0.3
            } else if enganche == 40{
                x = Double(montoCarro) * 0.4
            }else{
                x = Double(montoCarro) * 0.5
            }
            return String(format: "Monto Enganche: $ %.2f",x)
    }
    var meses = 12
    
}
