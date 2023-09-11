//
//  HomeView.swift
//  FinalProject
//
//  Created by Rana MHD on 18/02/1445 AH.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
       
            VStack{
                // to view books
                ScrollView{
                    ListOfCards()
                }
                .padding(.top, 150)
            }
            
            // background color
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.06, green: 0.19, blue: 0.34), location: 0.08),
                        Gradient.Stop(color: Color(red: 0.3, green: 0.42, blue: 0.45), location: 0.92),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 1)
                )
            )
            .edgesIgnoringSafeArea(.all)
            .toolbar(){ // <2>
                ToolbarItem() { // <3>
                    HStack{
                        Text("Home")
                            .foregroundColor(.white)
                            .font(.system(size: 35))
                        
                            .bold()
                        
                    }.frame(width: 380)
                    
                    
                }
            }
        
        
    }
}
