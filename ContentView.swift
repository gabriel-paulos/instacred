//
//  ContentView.swift
//  instacred(SwiftUI)
//
//  Created by Maria Paulo on 2021-09-03.
//

import SwiftUI
import RealmSwift

var batman = [
    Options(purchase: "Toy", amount: 10.50, store: "Rob", dueDate: "10/08/2020"),
    Options(purchase: "Boots", amount: 150.20, store: "Gabe", dueDate: "11/08/2020"),
    Options(purchase: "car", amount: 5000, store: "Frank", dueDate: "10/08/2021"),
    Options(purchase: "house", amount: 100000, store: "Raph", dueDate: "10/08/2050"),
    Options(purchase: "monkey", amount: 4500, store: "Maria", dueDate: "10/08/2025"),
    Options(purchase: "stock", amount: 1500, store: "Coco", dueDate: "10/08/2021"),

]

var people = [
Person(name: "Bob", id: "BobKane", posts: [Post(bor: true, amo: 50, interest: 3, dur: 12)]),
Person(name: "Stan", id: "stanlee", posts: [Post(bor: true, amo: 343, interest: 3, dur: 12)]),
Person(name: "Mak", id: "tomHaze", posts: [Post(bor: false, amo: 7645, interest: 3, dur: 12)]),
Person(name: "Baf", id: "FatBoi", posts: [Post(bor: true, amo: 456, interest: 3, dur: 12)]),
Person(name: "laf", id: "Kubrickss", posts: [Post(bor: false, amo: 234, interest: 3, dur: 12)]),
Person(name: "bag", id: "swayzzee", posts: [Post(bor: true, amo: 100, interest: 3, dur: 12)])
]

let local = try! Realm()



struct feedContainer: View {
    @EnvironmentObject var page: Hold
    @State private var cool = 2
    var screenWidth: CGFloat
    var body: some View {
        
       
        TabView(selection: $cool){
            NavigationView{
                VStack{
                        
                    //LoanView(oplist: batman)
                    LoanView()
//                  navBarProfile(colWidth:colwidth)
//                  ScrollView{
//                     VStack{
//
//                        homeScroll(people: people)
//
//                        }
//                  }
                    }
                    .navigationBarHidden(true)
                    .contentShape(Rectangle()).onTapGesture {
                        self.cool = 1
                        page.prevView = 1
                        
                    }
                }
                .tabItem { Image(systemName: "creditcard")
                    Text("Loan")
                }
                .tag(1)
                NavigationView{
                    homeyView(people: people)
                        .contentShape(Rectangle()).onTapGesture {
                            self.cool = 2
                            page.prevView = 2
                        }
                }
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(2)
                NavigationView{
                    VStack{
                            
                    }.contentShape(Rectangle()).onTapGesture {
                        self.cool = 3
                        page.prevView = 3
                    }
                }
                .tabItem{
                    Image(systemName: "banknote")
                    Text("Borrow")
                }
                .tag(3)
        }
        .onAppear{
            self.page.setColwidth(screenWidth:screenWidth)
        }
    }
}
