//
//  Cardfev.swift
//  BoksBox
//
//  Created by الوليد خشيم on 22/02/1445 AH.
//

import SwiftUI

struct Cardfev: View {
    @EnvironmentObject var vm: Vm
    var image:String = "a2"
    var titil:String = "Book Tiltle"
    var icon:String = "heart"
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
                                
                                vm.vm(newbook: Bookmodel(titel: titil,image: image,icon: "heart.fill"))
                            }, label: {
                                Image(systemName: icon).resizable().frame(width: 25,height: 23)
                            })
                        }
                    }.frame(width: 140)
                        .padding(10)
                }.background(Color.white).cornerRadius(20)
            
            }.foregroundColor(.black)
            
            
            
            
            
        }
    }}

struct Cardfev_Previews: PreviewProvider {
    static var previews: some View {
        Cardfev()
    }
}
