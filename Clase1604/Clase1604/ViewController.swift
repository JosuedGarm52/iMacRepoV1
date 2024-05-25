//
//  ViewController.swift
//  Clase1604
//
//  Created by Josue Garcia on 16/04/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Alert1(_ sender: Any) {
            MostrarAlerta(tipoAlerta:1, titulo:"Aviso", mensaje:"Hola Mundo!!")
        }
        @IBAction func Alert2(_ sender: Any) {
            MostrarAlerta(tipoAlerta:2, titulo:"Alerta", mensaje:"Estilo ActionSheet")
        }
        @IBAction func Alert3(_ sender: Any) {
            MostrarAlerta(tipoAlerta:3, titulo:"Botones", mensaje:"Varios botones")
        }
        @IBAction func Alert4(_ sender: Any) {
            MostrarAlerta(tipoAlerta:4, titulo:"Edad", mensaje:"Captura tu edad")
        }
        @IBAction func Alert5(_ sender: Any) {
            MostrarAlerta(tipoAlerta:5, titulo:"Aviso", mensaje:"Hola Mundo!!")
        }
    
    @IBAction func Alert6(_ sender: Any) {
        MostrarAlerta(tipoAlerta:2, titulo:"Aviso", mensaje:"Hola Mundo!!")
    }
    
        func MostrarAlerta(tipoAlerta: Int, titulo: String, mensaje: String){
            let alerta : UIAlertController

            if tipoAlerta == 1{
                //crear la alerta
                alerta = UIAlertController(title:titulo,
                                            message: mensaje,
                                            preferredStyle: .alert)

                //Agregarle botones a la alerta

                //ESTILOS DE BOTONES
                //.default --> OK
                //.cancel --> para cancelar, el texto se ve en negritas
                //.destructive --> el color de la fuente es en rojo, para acciones que no se pueden deshacer, como eliminar algo

                alerta.addAction(UIAlertAction(title:"Aceptar",
                                        style: .default,
                                        handler: {
                                            action in print("Boton Aceptar")
                                        }))

                //Una vez creada la alerta, hay que mostrarla en la pantalla
                present(alerta, animated: true)
            }else if tipoAlerta == 2{
                //crear la alerta
                alerta = UIAlertController(title:titulo,
                                            message: mensaje,
                                            preferredStyle: .actionSheet)

                alerta.addAction(UIAlertAction(title: "Aceptar",
                                                style: .default,
                                                handler: { action in
                                                    print("Boton Aceptar")
                                                }))
                alerta.addAction(UIAlertAction(title:"Cancelar",
                                        style: .default,
                                        handler: {
                                            action in print("Boton Cancelar")
                                        }))
                alerta.addAction(UIAlertAction(title:"Eliminar",
                                        style: .default,
                                        handler: {
                                            action in print("Boton Eliminar")
                                        }))
                //Una vez creada la alerta, hay que mostrarla en la pantalla
                                present(alerta, animated: true)
            }else if tipoAlerta == 3{
                //crear la alerta
                alerta = UIAlertController(title:titulo,
                                            message: mensaje,
                                            preferredStyle: .alert)

                //Agregarle botones a la alerta

                //ESTILOS DE BOTONES
                //.default --> OK
                //.cancel --> para cancelar, el texto se ve en negritas
                //.destructive --> el color de la fuente es en rojo, para acciones que no se pueden deshacer, como eliminar algo

                alerta.addAction(UIAlertAction(title:"Aceptar",
                                        style: .default,
                                        handler: {
                                            action in print("Boton Aceptar")
                                        }))
                alerta.addAction(UIAlertAction(title:"Cancelar",
                                        style: .default,
                                        handler: {
                                            action in print("Boton Cancelar")
                                        }))
                alerta.addAction(UIAlertAction(title:"Eliminar",
                                        style: .default,
                                        handler: {
                                            action in print("Boton Eliminar")
                                        }))
                alerta.addAction(UIAlertAction(title:"Aceptar2",
                                        style: .default))

                //Una vez creada la alerta, hay que mostrarla en la pantalla
                present(alerta, animated: true)
            }else if tipoAlerta == 4{
                //crear la alerta
                alerta = UIAlertController(title:titulo,
                                            message: mensaje,
                                            preferredStyle: .alert)

                //Agregar un textbox
                alerta.addTextField{(edad) in
                    edad.keyboardType = .numberPad
                }

                //Agregarle botones a la alerta
                alerta.addAction(UIAlertAction(title:"Aceptar",
                                        style: .default,
                                        handler: {
                                            action in print("Boton Aceptar")
                                            //en camposTexto se guarda un vector de cajas de texto
                                            if let camposTexto = alerta.textFields{
                                                //accedemos al primer elemento, donde txtEdad ya es de tipo UITextField
                                                let txtEdad = camposTexto[0]
                                                //obtener el valor capturado en el txt
                                                guard let edad = txtEdad.text
                                                                , !edad.isEmpty
                                                                , Int(edad)! > 0 else{
                                                    print("La edad tiene que ser mayor a cero")
                                                    return
                                                }
                                                print("Edad: \(edad)")
                                            }
                                        }))
                alerta.addAction(UIAlertAction(title:"Cancelar",
                                        style: .cancel))

                //Una vez creada la alerta, hay que mostrarla en la pantalla
                present(alerta, animated: true)
            }else{
                //crear la alerta
                alerta = UIAlertController(title:titulo,
                                            message: mensaje,
                                            preferredStyle: .alert)

                //Agregar un textbox
                alerta.addTextField{(email) in
                    email.keyboardType = .emailAddress
                    email.placeholder = "Correo electronico"
                }
                alerta.addTextField{(password) in
                    password.isSecureTextEntry = true
                    password.placeholder = "Contraseña"
                }

                //Agregarle botones a la alerta
                alerta.addAction(UIAlertAction(title:"Aceptar",
                                        style: .default,
                                        handler: {
                                            action in print("Boton Aceptar")
                                            //en camposTexto se guarda un vector de cajas de texto
                                            if let camposTexto = alerta.textFields{
                                                //accedemos al primer elemento, donde txtEdad ya es de tipo UITextField
                                                let txtEmail = camposTexto[0]
                                                let txtPassword = camposTexto[1]
                                                //obtener el valor capturado en el txt
                                                guard let email = txtEmail.text
                                                                , !email.isEmpty
                                                                , let password = txtPassword.text
                                                                , !email.isEmpty else{
                                                    print("Correo/Password no puede ser vacio")
                                                    return
                                                }
                                                print("Correo: \(email), Password: \(password)")
                                            }
                                        }))
                alerta.addAction(UIAlertAction(title:"Cancelar",
                                        style: .cancel))

                //Una vez creada la alerta, hay que mostrarla en la pantalla
                present(alerta, animated: true)
            }
        }
}

