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
        
        
        
        
        VStack{
            
            NavigationLink {
                ShowDetailsView()
            } label: {
                VStack{
                    VStack {
                        Image(image).resizable().frame(width: 140,height: 175)
                        HStack{
                            Text(titil)
                                Spacer()
                        }.frame(width: 135,height: 20)
                        HStack{
                            VStack{
                                
                                
                                HStack{
                                    Text("bisnis ")
                                    Spacer()
                                  
                                }
                                HStack{
                                    Text("Riyadh ")
                                    Spacer()
                                }
                                
                            }.frame(width: 104)
                            Button(action: {
                                Vm().vm(newbook: Bookmodel(titel: titil,image: image))
                            }, label: {
                                Image(systemName: "heart").resizable().frame(width: 25,height: 23)
                            })
                        }
                    }.frame(width: 140)
                        .padding(10)
                }.background(Color.white).cornerRadius(20)
            
            }.foregroundColor(.black)
            
            
            
            
            
        }
    }}

struct SwiftUIViewsedrftgyhu_Previews: PreviewProvider {
    static var previews: some View {
        cardsDetails()
    }
}
