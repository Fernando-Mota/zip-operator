//
//  PersonRepository.swift
//  ZipOperator
//
//  Created by Fernando Mota e Silva on 25/04/2018.
//  Copyright © 2018 Fernando Mota e Silva. All rights reserved.
//

import Foundation
import RxSwift

class PersonRepository {
    
    private let db = DB()
    
    func findByName(name: String) -> [Person] {
        if "*" == name {
            return db.persons
        } else {
            if (name.isEmpty) {
                return []
            }
            return db.persons.filter({ (person) -> Bool in
                return person.name.contains(name)
            })
        }
    }
}
