//
//  homeView.swift
//  instacred(SwiftUI)
//
//  Created by Maria Paulo on 2021-09-05.
//

import SwiftUI

struct homeyView: View {

    var people: [Person]
    var body: some View {
        VStack{
            navBarProfile()
            ScrollView{
                VStack{
                
                    homeScroll(people: people)
                
                }
            }
        }.navigationBarHidden(true)
    }
}


