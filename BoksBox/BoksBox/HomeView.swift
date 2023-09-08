//
//  HomeView.swift
//  FinalProject
//
//  Created by Rana MHD on 18/02/1445 AH.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        NavigationView {
            VStack{
                Text("")
                    .padding(.bottom, 66)
                ScrollView(.horizontal){
                    HStack(spacing:10){
                        ZStack{
                            Image("Rectangle 100")
                                .frame(width: 120, height: 33)
                                .background(.white)
                            Text("All")
                                .font(
                                    Font.custom("Crimson Text", size: 15)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.black)
                                .frame(width: 80, height: 30)
                            
                        }.cornerRadius(9)
                        ZStack{
                            Image("Rectangle 100")
                                .frame(width: 120,height: 33)
                                .background(.white)
                            
                            Text("Educational")
                                .font(
                                    Font.custom("Crimson Text", size: 15)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.black)
                                .frame(width: 80, height: 30, alignment: .trailing)
                        }
                        .cornerRadius(9)
                        ZStack{
                            Image("Rectangle 100")
                                .frame(width: 120, height: 33)
                                .background(.white)
                            Text("strries")
                                .font(
                                    Font.custom("Crimson Text", size: 15)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.black)
                                .frame(width: 80, height: 30)
                        }
                        .cornerRadius(9)
                        
                        ZStack{
                            Image("Rectangle 100")
                                .frame(width: 120, height: 33)
                                .background(.white)
                            Text("caltuar")
                                .font(
                                    Font.custom("Crimson Text", size: 15)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.black)
                                .frame(width: 80, height: 30)
                        }
                        .cornerRadius(9)
                        
                    }.padding()
                        .padding()
                    
                }
                //ScrollView(showsIndicators: false)
                
                Spacer()
                // to view books
                ScrollView{
                    ListOfCards()
                }
                
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
                            .font(.system(size: 40))
                        
                            .bold()
                        
                        
                        
                    }.frame(width: 380)
                    
                    
                }
            }
        }
        
    }
}
