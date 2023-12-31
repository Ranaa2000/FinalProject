//
//  Fivoret.swift
//  FinalProject
//
//  Created by الوليد خشيم on 19/02/1445 AH.
//


import SwiftUI


var texwt:Array<String> = ["a1"," a1"]

struct FavoriteView: View {
    @EnvironmentObject var vm: Vm
    @EnvironmentObject var bookItems: BookItemsViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    var body: some View {
       
            VStack {
                Text("")
                HStack{
                    Text("")
                    
                    
                }
                
                ScrollView(){
                    LazyVGrid(columns: columns, spacing: 10) {
                        
                        ForEach(vm.arr,id: \.self) { index in
                            Cardfev(item: index,
                                    icon:"heart.fill"
                                    )
                           
                            
                            
                            // Can't get index, so this won't work
                            
                        }
                    }
                    
                }
                .padding(.horizontal).padding(.top,110)
            }
            
            
            .frame(maxWidth: .infinity,maxHeight: .infinity).background(LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.06, green: 0.19, blue: 0.34), location: 0.08),
                    Gradient.Stop(color: Color(red: 0.3, green: 0.42, blue: 0.45), location: 0.92),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )).edgesIgnoringSafeArea(.all)
//                .toolbar { // <2>
//                    ToolbarItem() { // <3>
//                        HStack{
//
//                            Text("Favorite")
//                                .foregroundColor(.white)
//                                .font(.system(size: 40))
//                                .bold()
//
//
//
//
//                        }.frame(width: 380)
//
//                    }
//                }
            .navigationTitle("Favorite")
//            .navigationBarTitleDisplayMode(.)
        
    }
    
}


