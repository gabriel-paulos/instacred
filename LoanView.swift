//
//  LoanView.swift
//  instacred(SwiftUI)
//
//  Created by Maria Paulo on 2021-09-03.
//

import SwiftUI
import RealmSwift

//
//struct HomeView: View{
//    var body: some View{
//
//        NavigationView{
//            VStack{
//
//            }.navigationTitle("Success")
//            .toolbar{
//            ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading){
//
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                    Image(systemName: "gear")
//                })
//
//                }
//            ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing){
//
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                Image(systemName: "person")
//                })
//
//                }
//            }
//        }
//
//    }
//}
//
//struct BorrowView: View{
//    var body: some View{
//
//           NavigationView{
//               VStack{
//
//               }.navigationTitle("Car")
//               .toolbar{
//               ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading){
//
//                   Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                       Image(systemName: "gear")
//                   })
//
//                   }
//               ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing){
//
//                   Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                   Image(systemName: "person")
//                   })
//
//                   }
//               }
//           }
//    }
//}

//struct LoanView: View {
//    
//    @EnvironmentObject var page: Hold
//    @State private var showDetails = false
//    var oplist : [Options]
//    
//    var body: some View {
//        
//        VStack{
//            paymentSys(seeOptions: oplist).padding(.bottom)
//            Spacer()
//            
//            SwiftUI.List(oplist){option in
//               ListRow(eachOption: option)
//               
//            }
//        }
//    }
//}


struct LoanView: View {
    
    @EnvironmentObject var page: Hold
    @State private var showDetails = false
    @ObservedObject var opts = BindableResults(results: local.objects(Options.self))
    
    var body: some View {
        NavigationView{
        VStack{
                
//            LazyVGrid(columns: [
//                GridItem(.flexible(minimum:page.colwidth+10)),
//                GridItem(.flexible(minimum:page.colwidth)),
//                GridItem(.flexible(minimum:page.colwidth))
//            ]){
//
//                Text("Loans").font(.custom("Helvetica Neue Bold",size: 32))
//                    .padding([.top,.leading], /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//                Spacer()
//                Image(systemName: "plus")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 20)
//                    .padding([.top,.leading], 10)
//    //              .contentShape(Rectangle()).onTapGesture {
//    //                   addOptions()
//    //              }
//            }
            ScrollView{
                paymentSys()
                    .padding(.bottom)
                
                SwiftUI.List{
                   
                    ForEach(opts.results){option in
                            ListRow(eachOption: option)
                    }
                }
            }
        }.navigationTitle("Loans")
        
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(
            trailing:
                Button(action: {print("hi")}, label: {
                    Image(systemName: "plus")
                })
            )
            }
            
        }
}



struct paymentSys: View {
    @State private var showMonth = false
    @State private var showWeek = false
    @State private var showYear = false
    //@ObservedObject var opts = BindableResults(results: local.objects(Options.self))
    var totalMonth = 0.00
    var totalYear = 0.00
    var totalWeek = 0.00
    //var seeOptions: [Options]
    var body: some View{
        HStack{
            VStack{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                               .fill(Color.red)
                               .frame(width: 80, height: 80)
                Button("Monthly bills"){
                    showMonth.toggle()
                }.padding(.top)
                if showMonth{
                    Text("OK")
                }
                Text("Total: $1")
            }.contentShape(Rectangle()).onTapGesture {
                showMonth.toggle()
            }
            
            Divider()
            
            VStack{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                               .fill(Color.red)
                               .frame(width: 80, height: 80)
                Button("Weekly bills"){
                    showWeek.toggle()
                }.padding(.top)
                if showWeek{
                    Text("OK")
                }
                Text("Total: $1")
            }.contentShape(Rectangle()).onTapGesture {
                showWeek.toggle()
            }
           
            Divider()
            
            VStack{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                               .fill(Color.red)
                               .frame(width: 80, height: 80)
                Button("Annual bills"){
                    showYear.toggle()
                }.padding(.top)
                if showYear{
                    Text("OK")
                }
                Text("Total: $1")
            }.contentShape(Rectangle()).onTapGesture {
                showYear.toggle()
            }
           
            
        }
    }
}

struct monthPay: View {
    var totalm: Int
    var body: some View {
     
        Button {
            print(String(totalm))
        } label: {
            Text("Press Me")
                .padding(10)
        }
    }
}


struct ListRow: View {
    @EnvironmentObject var page: Hold
    var eachOption: Options
    var body: some View{
        HStack{
            VStack{
                Text(eachOption.purchase)
                Text(String(eachOption.amount))
            }
            Spacer()
            VStack{
                Text(eachOption.store)
                Text(eachOption.dueDate)
//                let datArr = String(eachOption.dueDate).components(separatedBy: "/")
//
//                let localTimeZoneAbbreviation = TimeZone.current
//
//
//                var dates = eachOption.makeDates(day: Int(datArr[0])!, month: Int(datArr[1])!, year: Int(datArr[2])!, timezone: localTimeZoneAbbreviation)
//
                
                
            }
        }.contentShape(Rectangle()).onTapGesture {
            self.page.setCurrentScreen()
            self.page.setOptions(opt: eachOption)
        }
    }
}

struct details: View{
    var option: Options
    @State private var adjust = false
    var body: some View{
        
        VStack{
            
            Text(String(option.amount))
            Divider()
            Text(option.purchase)
            Divider()
            Text(option.dueDate)
            Divider()
            Text(option.store)
            Divider()
            Button("Adjust options:"){
                adjust.toggle()
                
            }
            if adjust{
                Text("Will do!!")
            }
        }
        
    }
}



    
var Purchases5 = [
        Options(purchase: "Toy", amount: 10.50, store: "Rob", dueDate: "10082020"),
        Options(purchase: "Boots", amount: 150.20, store: "Gabe", dueDate: "11082020"),
        Options(purchase: "car", amount: 5000, store: "Frank", dueDate: "10082021"),
        Options(purchase: "house", amount: 100000, store: "Raph", dueDate: "10082050"),
        Options(purchase: "monkey", amount: 4500, store: "Maria", dueDate: "10082025"),
        Options(purchase: "stock", amount: 1500, store: "Coco", dueDate: "10082021"),

    ]

