//
//  AlumnoDetalle.swift
//  TablaAlumnox
//
//  Created by Josue Garcia on 19/05/24.
//

import UIKit

class AlumnoDetalle: UIViewController {

    @IBOutlet weak var imgFoto: UIImageView!

        @IBOutlet weak var lblPromedio: UILabel!
        @IBOutlet weak var lblNombre: UILabel!
        @IBOutlet weak var lblNumControl: UILabel!

        var alumnoSeleccionado : Alumno?
        override func viewDidLoad() {
            super.viewDidLoad()
            cargarDatos()
        }

        func cargarDatos(){
            imgFoto.image = alumnoSeleccionado?.fotoPerfil
            lblNombre.text = alumnoSeleccionado?.nombre
            if let promedio = alumnoSeleccionado?.promedio{
                lblPromedio.text = String(promedio)
            }else{
                lblPromedio.text = ""
            }
            if let numeroControl = alumnoSeleccionado?.numeroControl{
                lblNumControl.text = String(numeroControl)
            }else{
                lblNumControl.text = ""
            }
        }
    }
