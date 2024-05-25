//
//  ViewController.swift
//  ParedRect
//
//  Created by Josue Garcia on 23/03/24.
//

import UIKit
//import Rectangulo		

class ViewController: UIViewController {
    

    @IBOutlet weak var txtBasePared: UITextField!
    
    @IBOutlet weak var txtAlturaPared: UITextField!
    @IBOutlet weak var txtBaseWin: UITextField!
    @IBOutlet weak var txtAlturaWin: UITextField!
    
    @IBOutlet weak var btnCalcular: UIButton!
    
    @IBOutlet weak var lblResultado: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pared1 = Rectangulo(3,3)
        let ventana1 = Rectangulo(1,1)

        let areaVentana1 = ventana1.CalcularArea()
        let areaPared1 = pared1.CalcularArea() - areaVentana1

        let tiempo1 = areaPared1 * 10
        print("Minutos \(tiempo1) ")
    }
    

    @IBAction func click(_ sender: UIButton) {
        if let basep = (txtBasePared.text), let xx = Double(basep)
            , let alturap = txtAlturaPared.text, let xy = Double(alturap)
           , let basew = txtBaseWin.text, let yx = Double(basew)
           , let alturaw = txtAlturaWin.text, let yy = Double(alturaw){
            //begin
            let pared = Rectangulo(xx,xy) //10.0 5.0
            let ventana = Rectangulo(yx,yy) //2 1

            let areaVentana = ventana.CalcularArea()
            let areaPared = pared.CalcularArea() - areaVentana

            let tiempo = areaPared * 10
            print("Minutos \(tiempo) ")

            
            lblResultado.text = "\(tiempo) minutos"
        }else{
            lblResultado.text = "no todos los campos estan llenados bien"
        }
        
    }
}

