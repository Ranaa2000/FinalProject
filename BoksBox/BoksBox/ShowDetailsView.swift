//
//  ShowDetailsView.swift
//  FinalProject
//
//  Created by Rana MHD on 18/02/1445 AH.
//

import SwiftUI

struct ShowDetailsView: View {
    var description: String 
    var bookType : String
   
   
    var Bookname:String
    var image: URL
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
                
                VStack{
                    AsyncImage(
                        url: image,
                        content: { image in
                            image.resizable().cornerRadius(10)
    //                                    .aspectRatio(contentMode: .fit)
                                .frame( width: 180,height: 250)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                }.frame( width: 180,height: 250).background(Color.gray.opacity(0.3)).cornerRadius(10).padding()
                            
                    
                VStack{
                    Text(Bookname)
                        
                        .font(
                            Font.custom("Crimson Text", size: 20)
                                .weight(.bold)
                                
                        )
                       
                        .foregroundColor(.white)
                        .frame(width: 180, height: 65, alignment: .topLeading)
                    
                    
                    Text(bookType)
                    
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
            
            VStack{
            
                Text("Comunication : ")
                    .foregroundColor(.white)
                    .padding(.top, 2)
                    .font(
                        Font.custom("Crimson Text", size: 20)
                            .weight(.bold)
                    )
                    .frame(width: 300, height: 65, alignment: .bottomLeading)
                
                Text("Phone : 055555555")
                    .foregroundColor(.white)
                    .frame(width: 300, height: 65, alignment: .bottomLeading)
                
                
            }.frame(width: 300, height: 130, alignment: .bottomLeading).padding(.top,100)
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


