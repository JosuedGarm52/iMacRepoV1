//
//  ViewController.swift
//  Mundial_ooOuO
//
//  Created by Josue Garcia on 20/04/24.
//

import UIKit

class ViewController: UIViewController
                      , UIPickerViewDelegate
                      , UIPickerViewDataSource {
    
        
    @IBOutlet weak var lblE1: UILabel!
    @IBOutlet weak var lblE2: UILabel!
    @IBOutlet weak var lblE3: UILabel!
    @IBOutlet weak var lblE4: UILabel!
    
          @IBOutlet weak var pkvEquipos: UIPickerView!
          var equiposMain = ["Qatar","Belgica","Brasil",
                          "Francia","Argentina","Inglaterra","España","Portugal"]
    
        let bombo1 = ["Qatar","Belgica","Brasil","Francia","Argentina","Inglaterra","España","Portugal"]
        let bombo2 = ["Dinamarca","Paises Bajos","Alemania","Suiza","Croacia","Uruguay","Mexico","EE.UU"]
        let bombo3 = ["Iran","Japon","Serbia","Corea del sur","Tuñez","Polonia","Marruecos","Senegal"]
        let bombo4 = ["Arabia Saudita","Ecuador","Ghana","Canada","Cameru","Australia","Costa Rica","Gales"]

        let concacaf = ["Mexico","EE.UU","Canada","Costa Rica"]
        let africa = ["Egipto","Camerun","Ghana","Marruecos","Tuñez"]
        let resto = ["Arabia Saudita","Australia","Japon","Corea del sur"]
        let conmebol = ["Brasil","Argentina","Ecuador","Uruguay"]
    
        @IBOutlet weak var segmento: UISegmentedControl!
        
        
        @IBOutlet weak var imgv1: UIImageView!
        @IBOutlet weak var imgv2: UIImageView!
        @IBOutlet weak var imgv3: UIImageView!
        @IBOutlet weak var imgv4: UIImageView!
    
    
          override func viewDidLoad() {
              super.viewDidLoad()
            let pickerDelegate = self
            pkvEquipos.delegate = pickerDelegate
            pkvEquipos.dataSource = pickerDelegate
            
              
          }

          //Numero de componentes (columnas)
          func numberOfComponents(in pickerView: UIPickerView) -> Int {
              return 1
          }
          
          //numero de renglones
          func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            let count = equiposMain.count
            //print("Número de filas en el componente \(component): \(count)")
            return count
          }
          
          //Indicar el contenido de cada fila
          func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
              return equiposMain[row]
              
          }
          
          //Obtener el valor seleccionado
          func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
              
              //imgColor.image = UIImage(named: colores[row])
          }
    @IBAction func pulsarSorteo(_ sender: UIButton) {
            var pila: [Int] = []
            for numero in 1...4 {
                pila.append(numero)
            }
            pila.shuffle()

            var pais1 = ""
            var pais2 = ""
            var pais3 = ""
            var pais4 = ""

            var banderaConcacaf = false
            var banderaAfrica = false
            var banderaResto = false
            var banderaConmebol = false
            var numEquipoEuropeo = 2

            while let bombo = pila.popLast() {
                if bombo == 1{
                  if let elemento = bombo1.randomElement(){
                    if concacaf.contains(elemento) && !banderaConcacaf {
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                      banderaConcacaf = true
                    } else if africa.contains(elemento) && !banderaAfrica {
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                      banderaAfrica = true
                    } else if resto.contains(elemento) && !banderaResto {
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                      banderaResto = true
                    } else if conmebol.contains(elemento) && !banderaConmebol {
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                      banderaConmebol = true
                    }else if numEquipoEuropeo != 0{
                      numEquipoEuropeo -= 1
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                            } else {
                      pila.append(bombo)
                    }
                  }
                  
                      }else if bombo == 2{
                        if let elemento = bombo2.randomElement(){
                    if concacaf.contains(elemento) && !banderaConcacaf {
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                      banderaConcacaf = true
                    } else if africa.contains(elemento) && !banderaAfrica {
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                      banderaAfrica = true
                    } else if resto.contains(elemento) && !banderaResto {
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                      banderaResto = true
                    } else if conmebol.contains(elemento) && !banderaConmebol {
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                      banderaConmebol = true
                    }else if numEquipoEuropeo != 0{
                      numEquipoEuropeo -= 1
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                            } else {
                      pila.append(bombo)
                    }
                  }
                    }else if bombo == 3{
                        if let elemento = bombo3.randomElement(){
                    if concacaf.contains(elemento) && !banderaConcacaf {
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                      banderaConcacaf = true
                    } else if africa.contains(elemento) && !banderaAfrica {
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                      banderaAfrica = true
                    } else if resto.contains(elemento) && !banderaResto {
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                      banderaResto = true
                    } else if conmebol.contains(elemento) && !banderaConmebol {
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                      banderaConmebol = true
                    }else if numEquipoEuropeo != 0{
                      numEquipoEuropeo -= 1
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                            } else {
                      pila.append(bombo)
                    }
                  }
                    }else {
                            if let elemento = bombo4.randomElement(){
                    if concacaf.contains(elemento) && !banderaConcacaf {
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                      banderaConcacaf = true
                    } else if africa.contains(elemento) && !banderaAfrica {
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                      banderaAfrica = true
                    } else if resto.contains(elemento) && !banderaResto {
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                      banderaResto = true
                    } else if conmebol.contains(elemento) && !banderaConmebol {
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                      banderaConmebol = true
                    }else if numEquipoEuropeo != 0{
                      numEquipoEuropeo -= 1
                      if pais1 == ""{
                        pais1 = elemento
                      }else if pais2 == ""{
                        pais2 = elemento
                      }else if pais3 == ""{
                        pais3 = elemento
                      }else {
                        pais4 = elemento
                      }
                            } else {
                      pila.append(bombo)
                    }
                  }
                    }
              //print("La pila tiene \(pila.count) elementos")
            }

            print("Equipo1 \(pais1)")
            print("Equipo2 \(pais2)")
            print("Equipo3 \(pais3)")
            print("Equipo4 \(pais4)")
        
            if let name1 = llenarIMG(pais1),
                    let name2 = llenarIMG(pais2),
                    let name3 = llenarIMG(pais3),
                    let name4 = llenarIMG(pais4)
                {
                    imgv1.image = UIImage(named: name1)
                    lblE1.text=pais1
                    imgv2.image = UIImage(named: name2)
                    lblE2.text=pais2
                    imgv3.image = UIImage(named: name3)
                    lblE3.text=pais3
                    imgv4.image = UIImage(named: name4)
                    lblE4.text=pais4
                }
        }
        func llenarIMG(_ name : String) -> String?{
                let nombresImagenes: [String: String] = [
                    "Alemania": "alemania",
                    "Argentina": "argentina",
                    "Arabia Saudita": "arabiaSaudita",
                    "Australia": "australia",
                    "Belgica": "belgica",
                    "Brasil": "brazil",
                    "Canada": "canada",
                    "Cameru": "cameru",
                    "Corea del sur": "coreasur",
                    "Costa Rica": "costarica",
                    "Croacia": "croacia",
                    "Dinamarca": "dinamarca",
                    "EE.UU": "EEUU",
                    "Ecuador": "ecuador",
                    "España": "españa",
                    "Francia": "francia",
                    "Gales": "Gales",
                    "Ghana": "ghana",
                    "Inglaterra": "inglaterra",
                    "Iran": "iran",
                    "Japon": "japon",
                    "Marruecos": "marruecos",
                    "Mexico": "mexico",
                    "Paises Bajos": "paises_bajos",
                    "Polonia": "polonia",
                    "Portugal": "portugal",
                    "Qatar": "qatar",
                    "Senegal": "senegal",
                    "Serbia": "serbia",
                    "Suiza": "suiza",
                    "Tuñez": "tuñez",
                    "Uruguay": "uruguay"
                ]

                
                return nombresImagenes[name]
            }
        @objc func SeleccionarEquipo( _ sender: UISegmentedControl){
            let alerta : UIAlertController
                var mensaje = ""
                switch sender.selectedSegmentIndex{
                    case 0:
                        mensaje = "1: \n \(bombo1.joined(separator: "\n"))"
                    case 1:
                        mensaje = "2: \n \(bombo2.joined(separator: "\n"))"
                    case 2:
                        mensaje = "3: \n \(bombo3.joined(separator: "\n"))"
                        pkvEquipos.reloadAllComponents()
                    case 3:
                        mensaje = "4: \n \(bombo4.joined(separator: "\n"))"
                    default:
                        print("Error")
                        
                        
                }
                alerta = UIAlertController(title:"Selecciones",
                                            message: mensaje,
                                            preferredStyle: .alert)

                alerta.addAction(UIAlertAction(title:"Aceptar",
                                        style: .default,
                                        handler: {
                                            action in print("Boton Aceptar")
                                        }))
                present(alerta, animated: true)
        }
        
}


