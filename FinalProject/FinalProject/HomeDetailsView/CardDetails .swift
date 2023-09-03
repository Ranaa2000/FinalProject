//
//  CardDetails .swift
//  FinalProject
//
//  Created by Rana MHD on 18/02/1445 AH.
//

import SwiftUI

struct cardsDetails: View {
    var image:String = "a2"
    var titil:String = "Book Tiltle"
    var body: some View {
       
            
                            
                       
                        NavigationLink {
                           ShowDetailsView()
                        } label: {
                            ZStack{
                                Rectangle()
                                    .frame(width: 170, height: 340)
                                    .foregroundColor(Color.gray.opacity(0.6))
                                VStack{
                                    Image(image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 150)
                                        .cornerRadius(2)
                                        .padding()
                                    VStack(){
                                        
                                        Text(titil)
                                            .font(
                                                Font.custom("Crimson Text", size: 20)
                                                    .weight(.bold)
                                            )
                                        
                                            .foregroundColor(.black)
                                            .frame(width: 174, height: 26)
                                        
                                    }
                                    
                                }
                                
                            }
                            
                            
                            
                    }
                
           
       
        
        
    }
}

struct SwiftUIViewsedrftgyhu_Previews: PreviewProvider {
    static var previews: some View {
        cardsDetails()
    }
}
