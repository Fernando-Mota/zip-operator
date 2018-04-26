//
//  Pessoa.swift
//  ZipOperator
//
//  Created by Fernando Mota e Silva on 25/04/2018.
//  Copyright © 2018 Fernando Mota e Silva. All rights reserved.
//

import Foundation


class Pessoa {
    
    let nome: String
    
    var amigos: [Amigo]
    
    init(nome: String, amigos: [Amigo]) {
        self.nome = nome
        self.amigos = amigos
    }
    
    func toString() -> String {
        var result = "Esta é a pessoa: \(nome) \nAmigos: "
        for amigo in amigos {
            result += "\n          \(amigo.nome)"
        }
        result += "\n\n"
        return result
    }
}
