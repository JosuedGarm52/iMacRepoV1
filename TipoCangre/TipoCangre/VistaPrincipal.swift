//
//  VistaPrincipal.swift
//  TipoCangre
//
//  Created by Josue Garcia on 06/05/24.
//

import UIKit
import WebKit
import SafariServices

class VistaPrincipal: UIViewController{
    @IBOutlet weak var lblDato: UILabel!

    let miUrl = "https://www.gob.mx/salud"

    override func viewDidLoad(){
        super.viewDidLoad()
        lblDato.text = "Ningún valor registrado"
        if let nombre = UserDefaults.standard.value(forKey: "udNombre") as? String,
            let peso = UserDefaults.standard.value(forKey: "udPeso") as? String,
            let sangre = UserDefaults.standard.value(forKey: "udTipo") as? String{
            
            lblDato.text = "--Datos Paciente--\nNombre paciente: \(nombre)\nPeso del paciente: \(peso)\nTipo de sangre del paciente: \(sangre)"
        }
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            // Recuperar los datos de UserDefaults y actualizar la vista
            if let nombre = UserDefaults.standard.value(forKey: "udNombre") as? String,
                let peso = UserDefaults.standard.value(forKey: "udPeso") as? String,
                let sangre = UserDefaults.standard.value(forKey: "udTipo") as? String {
                
                lblDato.text = "--Datos Paciente--\nNombre paciente: \(nombre)\nPeso del paciente: \(peso)\nTipo de sangre del paciente: \(sangre)"
            }else {
                lblDato.text = "Ningún valor registrado"
                
            }
        }

    @IBAction func ConsultarPaginaSafari(_ sender: UIButton) {
        //crea una vista de safari y carga la url indicada
        let vistaSafari = SFSafariViewController(url: URL(string: miUrl)!)
        //se presenta la vista con la pagina web
        present(vistaSafari, animated: true)
        
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool{
        return true
    }

    override func prepare(for segue : UIStoryboardSegue, sender: Any?){
        
    }
}
