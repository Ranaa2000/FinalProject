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

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    var body: some View {
        NavigationStack{
            VStack {
              
                HStack{
                    Text("")
                }
                
                ScrollView(){
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(vm.arr, id: \.self) { item in
                            CardDetails(item: item,
                                         icon:"heart.fill")
                        }.onDelete { (indexSet) in
                            self.vm.arr.remove(atOffsets: indexSet)
                            }
                        }
                    }
                    .padding(.horizontal).padding(.top,110)
                }
                            
                
            }.frame(maxWidth: .infinity,maxHeight: .infinity).background(LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.06, green: 0.19, blue: 0.34), location: 0.08),
                    Gradient.Stop(color: Color(red: 0.3, green: 0.42, blue: 0.45), location: 0.92),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )).edgesIgnoringSafeArea(.all)
                .toolbar { // <2>
                    ToolbarItem() { // <3>
                        HStack{
                        
                            Text("Favorite")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .bold()
                           
                            
                     
        //                            Button(action: {
        //                                //print("waleed")
        //                               // SettingView()
        //                            }, label: {
        //                                Image(systemName: "gearshape.2").resizable()
        //
        //                                        .frame(width: 35,height: 35)
        //                                        .foregroundColor(.white)
        //
        //                            })
                          
                           
                        }.frame(width: 380)
                        
                        
                    }
                }

        }    }


struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}

