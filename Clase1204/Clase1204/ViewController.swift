//
//  ViewController.swift
//  Clase1204
//
//  Created by Josue Garcia on 12/04/24.
//

import UIKit

class ViewController: UIViewController
            , UIPickerViewDelegate
                      , UIPickerViewDataSource {
    
    @IBOutlet weak var pvkColores: UIPickerView!
    
    @IBOutlet weak var lblColor: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    let colores = ["","Azules","Amarillo","Gris","Morado","Verde"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pvkColores.delegate = self
        pvkColores.dataSource = self
    }

    //numero de componentes (columnas)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //numero de renglones
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colores.count
    }
    //INDICAR EL CONTENIDo de cada fila
    func pickerView(_ pickerView : UIPickerView, titleForRow row: Int, forComponent component:Int) -> String? {
        return colores[row]
    }
    //
    func pickerView(_ pickerView : UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        lblColor.text = colores[row]
        //imgColor.image = UIImage(named: colores[row])
        //"blue"
        //imgColor = nil
        
    }
    @IBAction func SelectionPickerView ( _ sender : UISwitch){
        if sender.isOn{
            
        }else{
            
        }
    }
    //{ }
   

}

/*
 1.
 2.
 3.
 4.
 5.
 6.
 7.
 
 */
