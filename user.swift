//
//  user.swift
//  instacred(SwiftUI)
//
//  Created by Maria Paulo on 2021-09-09.
//

import Foundation
import SwiftUI
import RealmSwift

class User: Object, Identifiable{
    
    @Persisted(primaryKey: true) var _id: String = UUID().uuidString
    @Persisted var _partition: String = ""
    @Persisted var name: String = ""
    //@Persisted let memberOf = RealmSwift.List<Project>()
    
    override static func primaryKey() -> String? {
            return "_id"
        }
    
}
