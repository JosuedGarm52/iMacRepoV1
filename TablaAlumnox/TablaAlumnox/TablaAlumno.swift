//
//  ViewController.swift
//  TablaAlumnox
//
//  Created by Josue Garcia on 18/05/24.
//

import UIKit

class TablaAlumno: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var TablaAlumnos: UITableView!

    var alumnos: [Alumno] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TablaAlumnos.delegate = self
        TablaAlumnos.dataSource = self
        rellenarArregloAlumnos()
    }
    
    func rellenarArregloAlumnos(){
        let alumno1 = Alumno(fotoPerfil: UIImage(named: "1")! , nombre: "Javier Campos", promedio: 89, numeroControl: 23100234)
        let alumno2 = Alumno(fotoPerfil: UIImage(named: "2")! , nombre: "Victor Torres", promedio: 100, numeroControl: 23100189)
        let alumno3 = Alumno(fotoPerfil: UIImage(named: "3")! , nombre: "Rogelio Castillo", promedio: 73, numeroControl: 23100035)
        let alumno4 = Alumno(fotoPerfil: UIImage(named: "4")! , nombre: "Maria Gonzalez", promedio: 90, numeroControl: 23100845)
        let alumno5 = Alumno(fotoPerfil: UIImage(named: "5")! , nombre: "Rosa Hernandez", promedio: 91, numeroControl: 23100341)
        let alumno6 = Alumno(fotoPerfil: UIImage(named: "6")! , nombre: "Ana Montes", promedio: 60, numeroControl: 23100202)
        
        alumnos.append(alumno1)
        alumnos.append(alumno2)
        alumnos.append(alumno3)
        alumnos.append(alumno4)
        alumnos.append(alumno5)
        alumnos.append(alumno6)
    }

    //total de celdas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return alumnos.count
    }

    //contenido de la celda, se manda a llamar cada que aparece una celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let alumnoCelda = alumnos[indexPath.row]

        let celda = tableView.dequeueReusableCell(withIdentifier: "CeldaAlumno") as! CeldaAlumno

        celda.AsignarAlumno(alumno: alumnoCelda)

        return celda
    }

    //definir el alto de la celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath : IndexPath) -> CGFloat {
        return 150
    }

    //identificar que celda fue seleccionada
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath : IndexPath) {
        performSegue(withIdentifier : "SeleccionarAlumno", sender : self)

        tableView.deselectRow(at: indexPath, animated: false)
    }

    //pasar datos del alumno seleccionado
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let destino = segue.destination as? AlumnoDetalle{
            destino.alumnoSeleccionado = alumnos[TablaAlumnos.indexPathForSelectedRow!.row]
        }
    }
}

