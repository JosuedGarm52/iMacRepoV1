//
//  ViewController.swift
//  Naranja
//
//  Created by Josue Garcia on 16/04/24.
//

import UIKit

class ViewController: UIViewController {
        @IBOutlet weak var btnConvertir: UIButton!
        @IBOutlet weak var lblManzana: UILabel!
        @IBOutlet weak var lblNaranja: UILabel!
        @IBOutlet weak var txtManzana: UITextField!

        let interNaranja = 3
        let interManzana = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Convertir(_ sender: UIButton) {
        if let x = Int(txtManzana.text ?? "0"){
                    let  manzana = x % interManzana
                    let naranja = x / interManzana * interNaranja

                    print("X: \(x) Manzana: \(manzana) Naranja: \(naranja)")
                    lblManzana.text = "Manzanas restantes: \(manzana)"
                    lblNaranja.text = "Numero de naranja obtenidas: \(naranja)"
                }else{
                    lblManzana.text = "Valor invalido"
                }
    } 
}

