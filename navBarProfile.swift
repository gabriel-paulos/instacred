//
//  navBarProfile.swift
//  instacred(SwiftUI)
//
//  Created by Maria Paulo on 2021-09-03.
//

import SwiftUI

struct navBarProfile: View {
    @EnvironmentObject var page: Hold
    @State private var leave: Bool = false
    var showDetails: Bool = false
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(minimum:page.colwidth+10)),
            GridItem(.flexible(minimum:page.colwidth)),
            GridItem(.flexible(minimum:page.colwidth))
        ]){

            if showDetails == true{
                Button{
                    if leave == false{
                        leave = true
                    }
                } label: {
                    Image(systemName: "chevron.backward")
                        .frame(width: 8)
                }
                
                Text("Loan Details")
                    .font(.custom("Helvetica Neue Bold",size: 20))
                    .padding([.top,.leading], /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                Spacer()
            }
            else{
                Text("Home")
                    .font(.custom("Helvetica Neue Bold",size: 32))
                    .padding([.top,.leading], /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .padding([.top,.leading], 10)
            }
            
        }
        
    }

}


