//
//  VistaInsertar.swift
//  TipoCangre
//
//  Created by Josue Garcia on 06/05/24.
//

import UIKit

class VistaInsertar: UIViewController
                     , UIPickerViewDelegate
                     , UIPickerViewDataSource{
         @IBOutlet weak var txtNombre: UITextField!
         @IBOutlet weak var txtPeso: UITextField!
         @IBOutlet weak var picker: UIPickerView!
         let tipoSangre = ["A+","A-","B+","B-","AB+","AB-","O+","O-"]
         var tipoActual : String = "A+"

         override func viewDidLoad(){
             super.viewDidLoad()

             let pickerDelegate = self
             picker.delegate = pickerDelegate
             picker.dataSource = pickerDelegate
         }
         func numberOfComponents(in pickerView: UIPickerView) -> Int
                                 { return 1 }
         func pickerView(_ pickerView: UIPickerView,
                             numberOfRowsInComponent component: Int) -> Int
                             { let count =  tipoSangre.count; return count; }
         func pickerView(_ pickerView: UIPickerView,
                         titleForRow row: Int,
                         forComponent component: Int) -> String?
                         { return tipoSangre[row] }
         
         //Obtener el valor seleccionado
         func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
             tipoActual = tipoSangre[row]
         }
         func mostrarAlerta(_ mensaje: String) {
             let alerta = UIAlertController(title: "Aviso", message: mensaje,
                 preferredStyle: .alert)
             alerta.addAction(UIAlertAction(title: "Aceptar", style: .default))
             present(alerta, animated: true)
         }
         @IBAction func Guardar(_ sender: UIButton) {
             //tomar los datos de las cajas de texto
             let nombre = txtNombre.text ?? ""
             let peso = txtPeso.text ?? ""
             
             if nombre != "" && peso != ""{
                 //UserDefaults son pares de llave-valor
                 UserDefaults.standard.set(nombre, forKey: "udNombre")
                 UserDefaults.standard.set(peso, forKey: "udPeso")
                 UserDefaults.standard.set(tipoActual, forKey: "udTipo")
                 
                 txtNombre.text = ""
                 txtPeso.text = ""
                 picker.selectRow(0, inComponent: 0, animated: true)
                 
             }else{
                 mostrarAlerta("No se pueden dejar vacios los campos de Nombre/Peso")
             }
         }
         @IBAction func Consultar(_ sender: UIButton) {
             if let nombre = UserDefaults.standard.value(forKey: "udNombre") as? String,
                 let peso = UserDefaults.standard.value(forKey: "udPeso") as? String,
                 let sangre = UserDefaults.standard.value(forKey: "udTipo") as? String{
                 
                 txtNombre.text = nombre
                 txtPeso.text = peso
                 if let index = tipoSangre.firstIndex(of: sangre) {
                     picker.selectRow(index, inComponent: 0, animated: true)
                 } else {
                     // Tipo de sangre guardado no encontrado en el array
                     mostrarAlerta("El tipo de sangre guardado no coincide con ninguna opción.")
                 }
             }else{
                 mostrarAlerta("No hay datos guardados de UserDefaults")
             }
         }
         @IBAction func Eliminar(_ sender: UIButton) {
             UserDefaults.standard.removeObject(forKey: "udNombre")
             UserDefaults.standard.removeObject(forKey: "udPeso")
             UserDefaults.standard.removeObject(forKey: "udTipo")
             mostrarAlerta("Se han eliminado los datos del UserDefaults")
             
             txtNombre.text = ""
             txtPeso.text = ""
             picker.selectRow(0, inComponent: 0, animated: true)
         }
     }
