//
//  AddContactoViewController.swift
//  Ejercicio02-Agenda de Contactos
//
//  Created by Marcos Ledesma on 08/01/2021.
//  Copyright © 2021 Marcos Ledesma. All rights reserved.
//

import UIKit

// Protocolo ANTES DE LA CLASE (para poder obtener el contacto de la activity AddContacto)
protocol ObtenerContactoDelegate {
    func obtenerContacto(contacto: ContactoModel, emisor: AddContactoViewController)
}

class AddContactoViewController: UIViewController {
    // Vars de la vista
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellidos: UITextField!
    @IBOutlet weak var txtEdad: UITextField!
    
    
    // Var delegate (para obtener el contacto)
    var delegate: ObtenerContactoDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //btnDonde
    @IBAction func btnDoneClick(_ sender: Any) {
        if let nombre = txtNombre.text, let apellidos = txtApellidos.text, let edad = Int(txtEdad.text ?? "0" ) {
            let contacto = ContactoModel(nombre: nombre, apellidos: apellidos, edad: edad)
            // Devolver el contacto a la venta que me ha llamado ( como onActivityResult)
            // en la principal para trabajar sobre el contacto
            delegate?.obtenerContacto(contacto: contacto, emisor: self)
        }else{
            // Cuando algún dato no esté bien aparece AlertDialog
            let alerta = UIAlertController(title: "ERROR", message: "Tienes datos mal introducidos", preferredStyle: .alert)
            // Añadimos la acción
            alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            // Mostrar Alert
            self.present(alerta, animated: true, completion: nil)
        }
    }
    
}
