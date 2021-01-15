//
//  ContactoModel.swift
//  Ejercicio02-Agenda de Contactos
//
//  Created by Marcos Ledesma on 08/01/2021.
//  Copyright © 2021 Marcos Ledesma. All rights reserved.
//

import UIKit

class ContactoModel: NSObject {
    // Atributos del Contacto
    var nombre: String
    var apellidos: String
    var edad: Int
    
    // Para no crear los atributos opcionales (String?) creamos el inicializador (init)
    init(nombre: String, apellidos: String, edad: Int) {
        self.nombre = nombre
        self.apellidos = apellidos
        self.edad = edad
    }
    
}
