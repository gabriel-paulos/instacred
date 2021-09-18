//
//  Post.swift
//  instacred(SwiftUI)
//
//  Created by Maria Paulo on 2021-09-08.
//

import Foundation
import RealmSwift

class Post: Object, Identifiable{
    
    @Persisted var id: UUID = UUID()
    @Persisted var borrow: Bool
    @Persisted var amount: Float
    @Persisted var interest: Float
    @Persisted dynamic var duration: Int

    
    convenience init(bor: Bool,amo:Float,interest:Float, dur: Int){
        self.init()
        self.amount = amo
        self.borrow = bor
        self.duration = dur
        self.interest = interest

    }
    
    override static func primaryKey() -> String? {
            return "id"
        }
    
}
