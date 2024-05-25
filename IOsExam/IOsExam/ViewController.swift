//
//  ViewController.swift
//  IOsExam
//
//  Created by Josue Garcia on 21/04/24.
//

import UIKit

class ViewController: UIViewController
                      ,UIPickerViewDelegate
                      ,UIPickerViewDataSource {
          
          let textos = ["Compacto $500,000","Familiar $700,000","Deportivo 950,500"]
          
          @IBOutlet weak var segmento: UISegmentedControl!
          @IBOutlet weak var picker: UIPickerView!
          @IBOutlet weak var lblMonto: UILabel!
          @IBOutlet weak var lblPlazo: UILabel!
          @IBOutlet weak var lblMensualidad: UILabel!
    @IBOutlet weak var imgv: UIImageView!
    
    
    let carro = Cotizacion()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pickerDelegate = self
        picker.delegate = pickerDelegate
        picker.dataSource = pickerDelegate
        
        lblMonto.text = carro.CalcularEnganche()
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { let count =  textos.count; return count; }
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { return textos[row] }
        
        //Obtener el valor seleccionado
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
            //imgColor.image = UIImage(named: colores[row])
            var imagee = ""
            if row == 0{
                        imagee = "compacto"
                        carro.cambiarCarro(1)
                    }else if row == 1{
                        imagee = "familiar"
                        carro.cambiarCarro(2)
                    }else {
                        imagee = "deportivo"
                        carro.cambiarCarro(3)
                    }
            lblMonto.text = carro.CalcularEnganche()
            imgv.image = UIImage(named: imagee)
            
        }
    @IBAction func CambiarMensualidad(_ sender: UISegmentedControl) {
            let x = sender.selectedSegmentIndex
            if x == 0{
                carro.enganche = 20
            }else if x == 1{
                carro.enganche = 30
            }else if x == 2{
                carro.enganche = 40
            }else {
                carro.enganche = 50
            }
            lblMonto.text = carro.CalcularEnganche()
        }

    @IBAction func ImprimirPorcentaje(_ sender: UISlider) {
        let valor = Int(sender.value)
        if valor == 12 || valor == 24 || valor == 36 || valor == 48 || valor == 60 || valor == 72{
            carro.meses = valor
            lblPlazo.text = "\(valor) meses"
            //carro.CalcularMensualidad()
            //lblMensualidad.text = String(format: "Mensualidades: %.2f",carro.Mensualidad)
            
        }
    }
}

