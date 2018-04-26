//
//  DB.swift
//  ZipOperator
//
//  Created by Fernando Mota e Silva on 25/04/2018.
//  Copyright © 2018 Fernando Mota e Silva. All rights reserved.
//

import Foundation


class DB {
    
    let persons = [
        Person(id: "1", name: "Fernando", friends: []),
        Person(id: "2", name: "Ana", friends: [])
    ]
    
    let friends = [
        Friend(id: "1", name: "Amanda", personId: "1"),
        Friend(id: "2", name: "Ellen", personId: "1"),
        Friend(id: "3", name: "Juju", personId: "1"),
        Friend(id: "4", name: "Marco", personId: "2"),
        Friend(id: "5", name: "Polo", personId: "2"),
        Friend(id: "6", name: "Ryu", personId: "2")
    ]
}
