//
//  ShowDetailsView.swift
//  FinalProject
//
//  Created by Rana MHD on 18/02/1445 AH.
//

import SwiftUI

struct ShowDetailsView: View {
    var description: String = "Book description blaa blaaa blaaa jhjhjghjghjgvhjghjfgjh"
    var bookType : String = "Book type"
    var city :String = "Jeddah"
    var phoneNum :Int = 0
    
    var body: some View {
        //        VStack{
        //
        //
        //            HStack{
        //                Spacer()
        //
        //
        //            Text("Book Name ")
        //                    .padding(.leading)
        //                        .font(
        //                            Font.custom("Crimson Text", size: 30)
        //                                .weight(.bold)
        //                        )
        //
        //                        .frame(width: 183, height: 65, alignment: .topLeading)
        //
        //                Spacer()
        //            }
        //
        //            HStack{
        
        //            }
        //        }
        //
        VStack(){
            
            HStack{
                
                Image("a2" ).resizable()
                    
                    .frame( width: 180,height: 250).padding()
               
                VStack{
                    Text("Book name")
                        
                        .font(
                            Font.custom("Crimson Text", size: 30)
                                .weight(.bold)
                                
                        )
                       
                        .foregroundColor(.white)
                        .frame(width: 180, height: 65, alignment: .topLeading)
                    
                    
                    Text("Educational")
                    
                        .foregroundColor(.white)
                        .font(
                            Font.custom("Crimson Text", size: 20)
                                .weight(.bold)
                        )
                        .frame(width: 180, height: 65, alignment: .topLeading)
                    
                    Text("Riyadh")
                        .foregroundColor(.white)
                        .font(
                            Font.custom("Crimson Text", size: 20)
                                .weight(.bold)
                        )
                        .frame(width: 180, height: 65, alignment: .topLeading)
                }
            }.frame(width: 390, height: 300)
            
            
            Text("Book Details")
                .bold()
                .foregroundColor(.white)
                .padding(.top, 2)
                .font(
                    Font.custom("Crimson Text", size: 25)
                        .weight(.bold)
                )
                .foregroundColor(.white)
                .frame(width: 300, height: 65, alignment: .topLeading)
            
            
            Text("Here the description Here the descriptionHere the descriptionHere the descriptionHere the descriptionHere the descriptionHere the description ! ")
                .foregroundColor(.white)
                .frame(width: 300, height: 65, alignment: .topLeading)
            
            
            Text("Comunication : ")
                .foregroundColor(.white)
                .padding(.top, 2)
                .font(
                    Font.custom("Crimson Text", size: 25)
                        .weight(.bold)
                )
                .frame(width: 300, height: 65, alignment: .topLeading)
            
            Text("Phone : 055555555")
                .foregroundColor(.white)
                .frame(width: 300, height: 65, alignment: .topLeading)
            
            
        }
        .frame(maxWidth: .infinity , maxHeight: .infinity)
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
    }
}

struct ShowDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowDetailsView()
    }
}
