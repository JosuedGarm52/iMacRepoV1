//
//  CeldaAlumno.swift
//  TablaAlumnox
//
//  Created by Josue Garcia on 19/05/24.
//

import UIKit

class CeldaAlumno: UITableViewCell {
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblPromedio: UILabel!

    @IBOutlet weak var imgFotoAlumno: UIImageView!

    override func awakeFromNib(){
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool){
        super.setSelected(selected, animated: animated)
    }

    func AsignarAlumno( alumno : Alumno){
        imgFotoAlumno.image = alumno.fotoPerfil
        lblNombre.text = alumno.nombre
        lblPromedio.text = String(alumno.promedio)
    }
}
