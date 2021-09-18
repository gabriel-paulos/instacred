//
//  options.swift
//  instacred(SwiftUI)
//
//  Created by Maria Paulo on 2021-09-03.
//

import Foundation
import SwiftUI
import RealmSwift

class Options: Object, Identifiable {
    
    @Persisted var id: UUID = UUID()
    @Persisted var purchase: String
    @Persisted var store: String
    @Persisted var amount: Float
    @Persisted var dueDate: String
    
    convenience init(purchase: String, amount: Float, store: String, dueDate: String){
        self.init()
        self.purchase = purchase
        self.amount = amount
        self.store = store
        self.dueDate = dueDate
    }
    
    override static func primaryKey() -> String? {
            return "id"
        }
    
    func makeDates(day: Int, month: Int, year: Int, timezone: TimeZone) -> Date?{
        
        var dateComponents = DateComponents()
        
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        dateComponents.timeZone = timezone
        
        let userCalendar = Calendar(identifier: .gregorian)
        let someDateTime = userCalendar.date(from: dateComponents)
        
        return someDateTime
        
    }
    
}
