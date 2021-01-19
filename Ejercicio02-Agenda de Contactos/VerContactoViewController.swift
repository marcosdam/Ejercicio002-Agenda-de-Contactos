//
//  VerContactoViewController.swift
//  Ejercicio02-Agenda de Contactos
//
//  Created by Marcos Ledesma on 08/01/2021.
//  Copyright © 2021 Marcos Ledesma. All rights reserved.
//

import UIKit

class VerContactoViewController: UIViewController {

    // Contacto a mostrar (opcional)
    var contacto: ContactoModel?
    
    // labels (nombre, apellidos, edad)
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblApellidos: UILabel!
    @IBOutlet weak var lblEdad: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        lblNombre.text = contacto!.nombre
        lblApellidos.text = contacto!.apellidos
        lblEdad.text = String(contacto!.edad)
    }
    
    // botón Done (cerrar esta ventana -> self dismiss)
    @IBAction func btnDoneClick() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
