//
//  PersonaTableViewCell.swift
//  Ejercicio02-Agenda de Contactos
//
//  Created by Marcos Ledesma on 15/01/2021.
//  Copyright © 2021 Marcos Ledesma. All rights reserved.
//

import UIKit

class PersonaTableViewCell: UITableViewCell {
    // lblPersonaCelda
    @IBOutlet weak var lblPersonaCelda: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
