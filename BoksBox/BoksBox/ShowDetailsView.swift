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
    var items :BookItem
   
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
       
        VStack{
            ScrollView{
                
            
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
                        .frame(width: 180, height: 45, alignment: .topLeading)
                    
                    
                    
//                    Text("Year : ")   .foregroundColor(.white)
//                        .font(
//                            Font.custom("Crimson Text", size: 20)
//                                .weight(.bold)
//                        )
//                        .frame(width: 180, height: 25, alignment: .topLeading)
//
//
//                    Text("\(items.year)")
//
//                        .foregroundColor(.white)
//                        .font(
//                            Font.custom("Crimson Text", size: 20)
//
//                        )
//                        .frame(width: 180, height: 35, alignment: .topLeading)
//
//
                    
                    Text("Author : ")   .foregroundColor(.white)
                        .font(
                            Font.custom("Crimson Text", size: 20)
                                .weight(.bold)
                        )
                        .frame(width: 180, height: 25, alignment: .topLeading)
                    
                    
                    Text(items.author)
                    
                        .foregroundColor(.white)
                        .font(
                            Font.custom("Crimson Text", size: 20)
                               
                        )
                        .frame(width: 180, height: 35, alignment: .topLeading)
                    
                    
                    
                    
                    
                   
                   
                    
                    Text("Language : ")
                        .foregroundColor(.white)
                        .font(
                            Font.system(size: 20)
                                .bold()
                        )
                        .frame(width: 180, height: 25, alignment: .topLeading)
                    Text(items.language)
                        .foregroundColor(.white)
                        .font(
                            Font.system(size: 19)
                                
                        )
                        .frame(width: 180, height: 35, alignment: .topLeading)
                 
                    
                }
                
            }.frame(width: 390)
              
                
                
                
                
                
                
                ExtractedView(items: items)
        }.padding(.top,90).padding(.bottom,40)
        
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
    }}
}



struct ExtractedView: View {
    var items:BookItem
    var body: some View {
        VStack{
            
            VStack{
                
                Text("Book Details")
                    .bold()
                    .foregroundColor(.white)
                 
                    .font(
                        Font.custom("Crimson Text", size: 25)
                            .weight(.bold)
                    )
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,maxHeight:  .infinity,alignment: .leading)
                
                
                
                Text("Here the description Here the descriptionHere the descriptionHere the descriptionHere the descriptionHere the descriptionHere the description ! ")
                    .foregroundColor(.white)
                 
                
            }.frame(maxWidth: .infinity,maxHeight:  .infinity,alignment: .leading).padding(.bottom , 20)
            
            HStack{
                Text("Country : ")
                    .foregroundColor(.white)
                    .font(
                        Font.system(size: 20)
                        
                    ).bold()
                    
                Text(items.country)
                
                    .foregroundColor(.white)
                    .font(
                        Font.system(size: 19)
                        
                    )
                    
            }.frame(maxWidth: .infinity,maxHeight:  .infinity,alignment: .leading).padding(.bottom , 20)
            
            HStack{
                HStack{
                    Text("Year : ")
                        .foregroundColor(.white)
                        .font(
                            Font.system(size: 20)
                            
                        ).bold()
                        
                    Text("\(items.year)")
                    
                        .foregroundColor(.white)
                        .font(
                            Font.system(size: 19)
                            
                        )
                } .frame(maxWidth: .infinity,maxHeight:  .infinity,alignment: .leading).padding(.trailing)
                
                HStack{
                    Text("Pages : ")
                        .foregroundColor(.white)
                        .font(
                            Font.system(size: 20)
                            
                        ).bold()
                        
                    Text("\(items.pages)")
                    
                        .foregroundColor(.white)
                        .font(
                            Font.system(size: 19)
                            
                        )
                      
                }.frame(maxWidth: .infinity,maxHeight:  .infinity,alignment: .leading).padding(.leading )
            }.frame(maxWidth: .infinity,maxHeight:  .infinity,alignment: .leading).padding(.bottom , 20)
            
 
            
            VStack{
                Text("Link : ").frame(maxWidth: .infinity,maxHeight:  .infinity,alignment: .leading)   .foregroundColor(.white)
                    .font(
                        Font.system(size: 20)
                        
                    ).bold()
                    
                
                Text(items.link)
                
                    .foregroundColor(.white)
                    .font(
                        Font.custom("Crimson Text", size: 19)
                            .weight(.bold))
            }.frame(maxWidth: .infinity,maxHeight:  .infinity,alignment: .leading).padding(.bottom ,20)
            VStack{
                
                Text("Comunication : ")
                    .foregroundColor(.white)
                    .font(
                        Font.system(size: 20)
                            .bold()
                    ).padding(.bottom )
                    
                Text("Phone : 055555555")
                    .foregroundColor(.white)
                   
            }.frame(maxWidth: .infinity,maxHeight:  .infinity,alignment: .leading).padding(.bottom , 20)
            
        }.padding(.horizontal,20)
    }
}
