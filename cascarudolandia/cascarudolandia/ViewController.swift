//
//  ViewController.swift
//  cascarudolandia
//
//  Created by Josue Garcia on 21/04/24.
//

import UIKit

class ViewController: UIViewController
                , UIPickerViewDelegate
                , UIPickerViewDataSource {
    
    @IBOutlet weak var segmento: UISegmentedControl!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var imgv: UIImageView!
    @IBOutlet weak var chkDesc: UISwitch!
    @IBOutlet weak var lblCantidad: UILabel!
    @IBOutlet weak var step1: UIStepper!
    @IBOutlet weak var lblMenu: UILabel!
    
    let menuito = ["Hamburguesa sencillo","Hamburguesa con queso","Papas Fritas","Refresco","Postre"]
    
    var mesa1 = Menu()
    let mesa2 = Menu()
    let mesa3 = Menu()
    var mesaActual = 1
    
    var elemento = 1
    
    var cantidad: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pickerDelegate = self
        picker.delegate = pickerDelegate
        picker.dataSource = pickerDelegate
        
        step1.addTarget(self, action: #selector(CambioStepper(_:)), for: .valueChanged)
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { let count =  menuito.count; return count; }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? { return menuito[row] }
    
    //Obtener el valor seleccionado
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        cantidad = 0
        
        //imgColor.image = UIImage(named: colores[row])
        var imagee = ""
        if row == 0{
            //Ham norm
            elemento = 1
            imagee = "hamn"
        }else if row == 1{
            //Ham Queso
            elemento = 2
            imagee = "hamq"
        }else if row == 2{
            //Papa
            elemento = 3
            imagee = "papasbob"
        }else if row == 3{
            //Refresco
            elemento = 4
            imagee = "refresco"
        }else {
            //Postre
            elemento = 5
            imagee = "postreb"
        }
        imgv.image = UIImage(named: imagee)
        
    }
    
    @IBAction func btnPropina(_ sender: UIButton) {
        let alerta : UIAlertController
        alerta = UIAlertController(title:"Propina",
                                    message: "¿Desea dejar propina?, Gracias",
                                    preferredStyle: .actionSheet)

        alerta.addAction(UIAlertAction(title: "3%",
                                style: .default,
                                handler: { action in
                                    if self.mesaActual == 0{
                                        self.mesa1.AsignarPropina(1)
                                    }else if self.mesaActual == 1{
                                        self.mesa2.AsignarPropina(1)
                                    }else {
                                        self.mesa3.AsignarPropina(1)
                                    }
                                }))
        alerta.addAction(UIAlertAction(title:"10%",
                                style: .default,
                                handler: {action in
                                    if self.mesaActual == 0{
                                        self.mesa1.AsignarPropina(2)
                                    }else if self.mesaActual == 1{
                                        self.mesa2.AsignarPropina(2)
                                    }else {
                                        self.mesa3.AsignarPropina(2)
                                    }
                                }))
        alerta.addAction(UIAlertAction(title:"15%",
                                style: .cancel,
                                handler: {action in
                                    if self.mesaActual == 0{
                                        self.mesa1.AsignarPropina(3)
                                    }else if self.mesaActual == 1{
                                        self.mesa2.AsignarPropina(3)
                                    }else {
                                        self.mesa3.AsignarPropina(3)
                                    }
                                }))
        alerta.addAction(UIAlertAction(title:"Cancelar (No dejar propina)",
                                style: .destructive,
                                handler: {action in
                                    if self.mesaActual == 0{
                                        self.mesa1.AsignarPropina(4)
                                    }else if self.mesaActual == 1{
                                        self.mesa2.AsignarPropina(4)
                                    }else {
                                        self.mesa3.AsignarPropina(4)
                                    }
                                }))
                                
        present(alerta, animated: true)
    }
    
    @IBAction func btnAgregar(_ sender: UIButton) {
        //print(elemento)
        if mesaActual == 0{
            switch elemento{
            case 1:
                mesa1.numHamburNormal = Int(cantidad)
            case 2:
                mesa1.numHamburQueso = Int(cantidad)
            case 3:
                mesa1.numPapas = Int(cantidad)
            case 4:
                mesa1.numRefresco = Int(cantidad)
            case 5:
                mesa1.numPostre = Int(cantidad)
            default:
                print("Error")
            }
        }else if mesaActual == 1{
            switch elemento{
            case 1:
                mesa2.numHamburNormal = Int(cantidad)
            case 2:
                mesa2.numHamburQueso = Int(cantidad)
            case 3:
                mesa2.numPapas = Int(cantidad)
            case 4:
                mesa2.numRefresco = Int(cantidad)
            case 5:
                mesa2.numPostre = Int(cantidad)
            default:
                print("Error")
            }
        }else {
            switch elemento{
            case 1:
                mesa3.numHamburNormal = Int(cantidad)
            case 2:
                mesa3.numHamburQueso = Int(cantidad)
            case 3:
                mesa3.numPapas = Int(cantidad)
            case 4:
                mesa3.numRefresco = Int(cantidad)
            case 5:
                mesa3.numPostre = Int(cantidad)
            default:
                print("Error")
            }
        }
    }
    
    @IBAction func btnPagar(_ sender: Any) {
        print(mesaActual)
        print(mesa1.Cuenta())
        print(mesa2.Cuenta())
        print(mesa3.Cuenta())
        if mesaActual == 0{
            (
            lblMenu.text = mesa1.Cuenta())
        }else if mesaActual == 1{
            lblMenu.text = mesa2.Cuenta()
        }else {
            lblMenu.text = mesa3.Cuenta()
        }
    }
    @IBAction func CambiarMesa(_ sender: UISegmentedControl) {
        lblMenu.text = "Pulsar Cargar"
        self.mesaActual = sender.selectedSegmentIndex
    }
    @IBAction func CompDesc(_ sender: UISwitch) {
        if sender.isOn {
            // Realiza acciones cuando el interruptor está activado
            if mesaActual == 0{
                mesa1.Descuento = true
            }else if mesaActual == 1{
                mesa2.Descuento = true
            }else {
                mesa3.Descuento = true
            }
        } else {
            // Realiza acciones cuando el interruptor está desactivado
            if mesaActual == 0{
                mesa1.Descuento = false
            }else if mesaActual == 1{
                mesa2.Descuento = false
            }else {
                mesa3.Descuento = false
            }
        }
    }
    @IBAction func CambioStepper(_ sender: UIStepper) {
        cantidad = Double(sender.value)
        lblCantidad.text = "Cantidad:   \(cantidad)"
    }
    
}

