//
//  loanDetails.swift
//  instacred(SwiftUI)
//
//  Created by Maria Paulo on 2021-09-07.
//

import SwiftUI

struct listPost: View{
    var eachPost: Post
    var body: some View{
        
        VStack{
            Text(String(eachPost.amount))

            Text(String(eachPost.duration))

            Text(String(eachPost.interest))
        }
    }
}

struct DetailsContainer: View {
    @EnvironmentObject var page: Hold
    var screenWidth: CGFloat
    //var eachOP: Options
    var body: some View{

        VStack{
            //navBarProfile(showDetails: true)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]){

                Image(systemName: "chevron.backward")
                    .aspectRatio(contentMode: .fit)
                    .padding(.trailing, 10)
                    .contentShape(Rectangle()).onTapGesture {
                        page.setCurrentScreen()
                    }
                
                    Text("Loan Details")
                        .font(.custom("Helvetica Neue Bold",size: 15))
                        .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(.top, 8)
                    
                    Spacer()
            }.padding(.bottom,20)
            
            Text(String(page.opt.amount))
            Divider()
            Text(page.opt.dueDate)
            Divider()
            Text(page.opt.store)
            Divider()
            Text(String(page.opt.purchase))
            Divider()
            

            HStack{
                Spacer()
                Button("Adjust layer"){
               
                }
                 Spacer()
            }
            
            
        }
        .onAppear{
            self.page.setColwidth(screenWidth: screenWidth)
        }
        
        
    }
}



