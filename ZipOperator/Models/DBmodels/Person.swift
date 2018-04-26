//
//  Person.swift
//  ZipOperator
//
//  Created by Fernando Mota e Silva on 25/04/2018.
//  Copyright © 2018 Fernando Mota e Silva. All rights reserved.
//

import Foundation


class Person {
    
    let id: String
    
    let name: String
    
    var friends: [Friend]
    
    init(id: String, name: String, friends: [Friend]) {
        self.id = id
        self.name = name
        self.friends = friends
    }
}
