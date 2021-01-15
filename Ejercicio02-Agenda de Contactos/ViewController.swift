//
//  ViewController.swift
//  Ejercicio02-Agenda de Contactos
//
//  Created by Marcos Ledesma on 08/01/2021.
//  Copyright © 2021 Marcos Ledesma. All rights reserved.
//

import UIKit

// Va a utilizar el protocolo ObtenerContactoDelegate que hemos creado para poder trarese el contacto
// Además tiene que gestionar una tabla -> UITableViewDataSource, UITableViewDelegate
class ViewController: UIViewController, ObtenerContactoDelegate, UITableViewDataSource, UITableViewDelegate {
    // Métodos para utilizar UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count
    }
    // Ver qué contacto tiene que coger, inflar la celda y devolver la celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contacto = contactos[indexPath.row] // Position -> indexPath.row
        // Instanciar celda (Layout Inflater)
        let fila = tabla.dequeueReusableCell(withIdentifier: "PERSONA", for: indexPath) as! PersonaTableViewCell
        
        fila.lblPersonaCelda.text = contacto.nombre
        // Devolver la fila
        return fila
    }
    
    func obtenerContacto(contacto: ContactoModel, emisor: AddContactoViewController) {
        contactos.append(contacto)
        emisor.dismiss(animated: true)
        actualizaResumen()
    }
    
    // Variables de la vista (txt)
    @IBOutlet weak var tabla: UITableView!
    @IBOutlet weak var lblResumen: UILabel!
    @IBOutlet weak var txtNumContacto: UITextField!
    
    // Variables para la lógica
    var contactos: [ContactoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        tabla.delegate = self
        tabla.dataSource = self
        // Llamar a la func
        actualizaResumen()
    }

    // Func contar contactos del array
    func actualizaResumen() {
        tabla.reloadData()
    }
    
    // Func para crear el nuevo contacto (btnAddContacto), almacenarlo en el array y después actualizar el lblResumen y limpiar los campos
    /*
    @IBAction func btnAddContactoClick() {
        // Si los txt no están vacíos, crea el contacto
        if let nombre = txtNombre.text,
            let apellidos = txtApellidos.text,
            let edad = Int(txtEdad.text ?? "0")
        {
            let contacto = ContactoModel(nombre: nombre, apellidos: apellidos, edad: edad)
            // Guardarlo en la lista
            contactos.append(contacto)
            // Actualizar resumen y limpiar campos
            actualizaResumen()
            limpiaCampos()
        }
    }
 */
    
    // Comprobar qué segue se está activando (a qué ventana vas)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "VerContacto":
            // Cuando ya tengo el contacto accedo al destino
            let contacto = contactos[tabla.indexPathForSelectedRow!.row]
            let destino = segue.destination as! VerContactoViewController
            destino.contacto = contacto
        case "AddContacto":
            let destino = segue.destination as! AddContactoViewController
            destino.delegate = self
        default:
            print("HOLA")
        }
    }
}

