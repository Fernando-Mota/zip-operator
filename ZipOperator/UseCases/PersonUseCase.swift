//
//  PessoaUseCase.swift
//  ZipOperator
//
//  Created by Fernando Mota e Silva on 25/04/2018.
//  Copyright © 2018 Fernando Mota e Silva. All rights reserved.
//

import Foundation
import RxSwift

class PersonUseCase {
    
    let friendRepository = FriendRepository()
    
    let personRepository = PersonRepository()
    
    func findPersonsByName(name: String) -> [Person] {
        return personRepository.findByName(name: name)
    }
    
    func findFriendsByPersonId(personId: String) -> [Friend] {
        return friendRepository.findByPersonId(personId: personId)
    }
}
