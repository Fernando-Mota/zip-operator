//
//  FriendRepository.swift
//  ZipOperator
//
//  Created by Fernando Mota e Silva on 25/04/2018.
//  Copyright © 2018 Fernando Mota e Silva. All rights reserved.
//

import Foundation
import RxSwift

class FriendRepository {
    
    private let db = DB()
    
    func findByPersonId(personId: String) -> [Friend] {
        return db.friends.filter({ (friend) -> Bool in
            return friend.personId == personId
        })
    }
}
