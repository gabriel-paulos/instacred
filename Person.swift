//
//  Person.swift
//  instacred(SwiftUI)
//
//  Created by Maria Paulo on 2021-09-04.
//

import Foundation
import SwiftUI
import RealmSwift


class Person: Object, Identifiable{
    
    @Persisted var name: String
    @Persisted var id: UUID = UUID()
    @Persisted var posts = RealmSwift.List<Post>()
    
    convenience init(name:String,id:String, posts: [Post]){
        self.init()
        self.name = name
        self.posts.append(objectsIn: posts)
    }
    
    override static func primaryKey() -> String? {
            return "id"
        }
    
    func addPost(newPost: [Post]){
        
        try! realm?.write {
            self.posts.append(objectsIn: newPost)
        }
        
    }
    
//    func deletePost(posts: [Post]){
//
//        ForEach(posts){ post in
//
//            self.posts.removeAll(where: { $0 == post })
//
//        }
//
//
//
//    }
    
    
}

