//
//  ViewController.swift
//  FiguraR
//
//  Created by Josue Garcia on 16/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnArea: UIButton!
        @IBOutlet weak var btnPerimetro: UIButton!
        @IBOutlet weak var lblEtiqueta: UILabel!
        @IBOutlet weak var txtAncho: UITextField!
        @IBOutlet weak var txtAlto: UITextField!
        @IBOutlet weak var txtX: UITextField!
        @IBOutlet weak var txtY: UITextField!

        var perimetro : Int = 0
        var area : Int = 0

        var ancho = 0
        var alto = 0
        var x = 0
        var y = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func llenarDatos() -> Bool {
        guard let ancho1 = Int(txtAncho.text ?? "0"),
            let alto1 = Int(txtAlto.text ?? "0"),
            let x1 = Int(txtX.text ?? "0"),
            let y1 = Int(txtY.text ?? "0") else {
                lblEtiqueta.text = "Un dato está incompleto"
                return false
            }
                ancho = ancho1
                alto = alto1
                x = x1
                y = y1
            return true
        }


        @IBAction func obtenerArea(_ sender: UIButton) {
            if llenarDatos(){
                let figura1basealtura = x * alto
                let figura2ancho = ancho - x
                let figura2basealtura = figura2ancho * y
                area = figura1basealtura + figura2basealtura

                lblEtiqueta.text = "Area: \(area)"
            }
        }

        @IBAction func obtenerPerimetro(_ sender: UIButton) {
            if llenarDatos(){
                perimetro = (2*ancho)+(2*alto)

                lblEtiqueta.text = "Perimetro: \(perimetro)"
            }
            
        }

}

