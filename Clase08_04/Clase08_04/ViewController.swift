//
//  ViewController.swift
//  Clase08_04
//
//  Created by Josue Garcia on 08/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchConfig: UISwitch!
    
    
    @IBOutlet weak var selector: UISegmentedControl!
    
    @IBOutlet weak var txtValor1: UITextField!
    
    @IBOutlet weak var txtValor2: UITextField!
    
    @IBOutlet weak var btnCalcular: UIButton!
    
    
    @IBOutlet weak var txtResultado: UILabel!
    
    
    @IBOutlet weak var lblValor1: UILabel!
    
    @IBOutlet weak var lblValor2: UILabel!
    
    var paginaNum: Int = 0
    
    //Body del codigo
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switchConfig.isEnabled = false
        
        lblValor1.text = "Largo:"
        lblValor2.text = "Ancho:"
        
        
    }


    @IBAction func InvertirSentido(_ sender: Any) {
        
    }
    
    @IBAction func InvertirSentido1(_ sender: UISwitch) {
        if sender.isOn {
            //txtTexto.isHidden = false
        }else{
            //txtTexto.isHidden = true
            //lblSemestre.text = "x"
            //sliderSemestre.setValue(1,animated: false)
        }
    }
    
    

    @IBAction func CambioSegmento(_ sender: Any) {
        
    }
    
    
    @IBAction func CambioPestana(_ sender: UISegmentedControl) {
        lblValor2.isHidden = false
        txtValor2.isHidden = false
        txtResultado.text = "resultado"
        txtValor1.text = ""
        txtValor2.text = ""
        switch sender.selectedSegmentIndex {
            case 0:
                print("Cuadrado")
                lblValor1.text = "Largo:"
                lblValor2.text = "Ancho:"
                paginaNum = 0
            case 1:
                print("Circulo")
                lblValor1.text = "Radio"
                lblValor2.isHidden = true
                txtValor2.isHidden = true
                paginaNum = 1
            case 2:
                print("Triangulo")
                lblValor1.text = "Altura:"
                lblValor2.text = "Base:"
                
                paginaNum = 2
            default:
                print("Ocurrio un error")
        }
    }
    
    @IBAction func Calcular(_ sender: UIButton) {
        switch paginaNum{
            case 0:
                if let x = Double(txtValor1.text ?? "0.0" ),
                   let y = Double(txtValor2.text ?? "0.0" ),
                   x > 0,
                   y > 0{
                    let rect = Rectangulo(x, y)
                    let resultado = "Resultado de area del Rectangulo: \(rect.CalcularArea())"
                    txtResultado.text = resultado
                }
            case 1:
                if let x = Double(txtValor1.text ?? "0.0" ),
                   x > 0{
                    let rect = Circunferencia(x)
                    let resultado = "Resultado de area de circunferencia: \(rect.CalcularArea())"
                    txtResultado.text = resultado
                }
        case 2:
                if let x = Double(txtValor1.text ?? "0.0" ),
                   let y = Double(txtValor2.text ?? "0.0" ),
                   x > 0,
                   y > 0{
                    let rect = Triangulo(x,y)
                    let resultado = "Resultado de area de circunferencia: \(rect.CalcularArea())"
                    txtResultado.text = resultado
                    
                }
            default:
                print("Eerror en el boton")
        }
    }
}

