//
//  homeScroll.swift
//  instacred(SwiftUI)
//
//  Created by Maria Paulo on 2021-09-04.
//

import Foundation
import SwiftUI
import RealmSwift

struct postView: View{
    
    @Binding var postSelected: String
    var name: String
    var post: Post
    var colWidth: CGFloat
    
    var body: some View{
        
        if post.amount > -1 && post.interest > -1 {
            if post.borrow == true{
                
                leftView( name: name,post: post, colWidth: colWidth)
//                   .contentShape(Rectangle())
//                    .onTapGesture {
//                        print("\(name)")
//                        postSelected = name
//
//                           // self.page.setPostAlert(name: name, pos: post)
//
//        //                    local.beginWrite()
//        //                    local.add(Options(purchase: String(post.interest), amount: post.amount, store: name, dueDate: String(post.duration)))
//        //                    try! local.commitWrite()
//                    }
                
            }
            
            else {
                rightView(name: name,post: post, colWidth: colWidth)
//                    .contentShape(Rectangle())
//                    .onTapGesture {
//                        print("\(name)")
//                        postSelected = name
//
//                           // self.page.setPostAlert(name: name, pos: post)
//
//        //                    local.beginWrite()
//        //                    local.add(Options(purchase: String(post.interest), amount: post.amount, store: name, dueDate: String(post.duration)))
//        //                    try! local.commitWrite()
//                    }
            }
        }
    }
}

struct leftView: View{

    var name: String
    var post: Post
    var colWidth: CGFloat
    
    var body: some View{
     
        LazyVGrid(columns: [
            GridItem(.fixed(colWidth)),
            GridItem(.fixed(colWidth))
        ]){
            Spacer()
            
            VStack {
                Text(name).foregroundColor(.white)
                Text("amount: " + String(post.amount) + "\n interest: " + String(post.interest))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 1, x: 1.0, y: 1.0)
                    .padding([.top,.horizontal],6)
                    .opacity(0.8)
                    Text("duration: " + String(post.duration))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 1, x: 1.0, y: 1.0)
                        .padding([.bottom],6)
                        .opacity(0.8)
                }
                .background(Color.black)
                .cornerRadius(10)
                .padding(6)
                    
            }.padding(10)

    }
}

struct rightView: View {
    
    var name: String
    var post: Post
    var colWidth: CGFloat
        
    var body: some View{
    
        LazyVGrid(columns: [
            GridItem(.fixed(colWidth)),
            GridItem(.fixed(colWidth))
        ]){
            VStack {
                Text(name).foregroundColor(.white)
                Text("amount: " + String(post.amount) + "\n interest: " + String(post.interest))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 1, x: 1.0, y: 1.0)
                    .padding([.top,.horizontal],6)
                    .opacity(0.8)
                Text("duration: " + String(post.duration))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 1, x: 1.0, y: 1.0)
                            .padding([.bottom],6)
                            .opacity(0.8)
            }
            .background(Color.black)
            .cornerRadius(10)
            .padding(6)
            
            Spacer()

        }.padding(10)
    }
}


struct homeScroll: View{
    @EnvironmentObject var page: Hold
    @State var isPresented: Bool = false
    @State var postSelected: String = "Hoe"
    //var people: [Person]
    var people = Array(local.objects(Person.self))
    var body: some View {
     
        LazyVStack{
           

            ForEach(people) { person in
                
                Button(action: {isPresented = true; postSelected = person.name}, label: {
                    
                    postView(postSelected: $postSelected, name: person.name, post: person.posts.last ?? Post(bor: false,amo: -1,interest: -1, dur: -1), colWidth: page.colhalf)
                    
                }).buttonStyle(PlainButtonStyle()).alert(isPresented:$isPresented) {
                    Alert(
                        title: Text("Are you sure you want to accept this contract?"),
                        //message: Text("There is no undo"),
                        primaryButton: .destructive(Text("Accept")) {
                            print("Deleting... \(postSelected)")    //                            local.beginWrite()
    //                            local.add(Options(purchase: String(person.posts.last!.interest), amount: person.posts.last!.amount, store: person.name, dueDate: String(person.posts.last!.duration)))
    //                            try! local.commitWrite()
                        },
                        secondaryButton: .cancel(){
                                isPresented = false
                        }
                    )
                }
                
    //                        Image("text Bubbles-2").frame(width: 100, height: 100, alignment: .trailing)
    //                        .overlay(postView(post: person.posts.last ?? Post(bor: false,amo: -1,interest: -1, dur: -1)))
    //
                
            }
        }
                
    }
}
