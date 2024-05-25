//
//  ModeloNoticia.swift
//  Replica_2505
//
//  Created by Josue Garcia on 25/05/24.
//

import Foundation

struct Noticias : Decodable{
    //se debe llamar igual ala coleccion
    let articles: [Noticia]
    
    
}

struct Noticia: Decodable{
    //se debe llamar igualma las etiquetas del json
    let author : String?
    let title : String?
    let description : String?
    let url: String?
    let urlToImage : String?
}
