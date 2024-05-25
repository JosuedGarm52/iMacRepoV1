//
//  CeldaNoticia.swift
//  Replica_2505
//
//  Created by Josue Garcia on 25/05/24.
//

import UIKit

class CeldaNoticia: UITableViewCell {
    
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var imgPortada: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
