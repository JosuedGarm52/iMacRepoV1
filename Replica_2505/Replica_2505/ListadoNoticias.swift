//
//  ViewController.swift
//  Replica_2505
//
//  Created by Josue Garcia on 25/05/24.
//

import UIKit
import SafariServices

class ListadoNoticias: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvNoticias : UITableView!
    
    var listadoNoticias: [Noticia] = []
    let urlI = "https://newsapi.org/v2/everything?q=microsoft&from=2024-05-01&to=2024-05-24&sortBy=popularity&pageSize=30&language=es&apiKey=1f52f28a0f8f4cef8fc32018f2a7a6b3"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchNoticias()
    }

    func tableView(_ tableView : UITableView, didSelectRowAt indexPath : IndexPath){
        //al seleccionar una celda
        tableView.deselectRow(at: indexPath, animated: true)
        
        let articulo = listadoNoticias[indexPath.row]
        let vistaSafari = SFSafariViewController(url: URL(string: articulo.url ?? "")!)
        present(vistaSafari, animated: true)
    }

    func fetchNoticias(){
        //Networking
        //1- crear url
        let cadenaConexion = urlI
        if let url = URL(string : cadenaConexion){
            //2- Crear
            let sesion  = URLSession(configuration: .default)
            
            //3-
            let task = sesion.dataTask(with: url){data, response, error in
                if error != nil{
                    print(error)
                    return
                }
                if let datosRegresados = data{
                    //let respuesta = String(datosRegresados, encoding: .utf8)
                    //print(respuesta)
                    
                    //descomponer json
                    //decodificador
                    let decoder = JSONDecoder()
                    do{
                        let decodificado = try decoder.decode(Noticias.self, from: datosRegresados)
                        self.listadoNoticias = decodificado.articles
                        
                        //print(decodificado.articles.count)
                        self.listadoNoticias = decodificado.articles
                        
                        //Actualizar la tabla una vez regrese al hilo principal
                        DispatchQueue.main.async{
                            self.tvNoticias.reloadData()
                        }
                    }catch{
                        print(error)
                    }
                }
            }
            //4.- empezar la tarea
            task.resume()
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listadoNoticias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articulo = listadoNoticias[indexPath.row]
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaNoticia") as! CeldaNoticia
        
        celda.lblTitulo.text = articulo.title

        //mostrar la imagen en base al link
        if let urlImagen = URL(string: articulo.urlToImage ?? ""){
            let dataTask = URLSession.shared.dataTask(with: urlImagen){data, response, error in
                guard let imagenData = data else {return}
                
                DispatchQueue.main.async{
                    celda.imgPortada.image = UIImage(data: imagenData)
                }
            }
            dataTask.resume()
        }
        
        return celda
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }

}
