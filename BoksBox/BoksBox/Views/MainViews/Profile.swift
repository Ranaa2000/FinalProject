//
//  ContentView.swift
//  addFinalProject
//
//  Created by TAHANI AL ONEAZAN on 31/08/2023.
//

import SwiftUI

struct GridItemData: Identifiable {
    let id = UUID()
    let imageName: String
    let text1: String
    let text2: String
    let text3: String
}
struct TextBox: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(.white)
            
    }
}
struct Profile: View {
    @State private var isMenuVisible = false
    private let items = [
        GridItemData(imageName: "absalom-absalom", text1: "1", text2: "1", text3: "Riyadh"),
        GridItemData(imageName: "anna-karenina", text1: "2", text2: "2", text3: "Riyadh"),
        GridItemData(imageName: "beloved", text1: "3", text2: "3", text3: "Riyadh"),
        GridItemData(imageName: "bostan", text1: "4", text2: "4", text3: "Riyadh"),
        GridItemData(imageName: "ficciones", text1: "5", text2: "5", text3: "Riyadh")
    ]
    
    private let gridLayout = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationView{
            VStack{
            ScrollView{
                
                VStack {
                    VStack{
                        
                        //            Image(systemName: "globe")
                        //                .imageScale(.large)
                        //                .foregroundColor(.accentColor)
                        //  Text("Profile")
                        //                    .foregroundColor(.white)
                        //                    .font(.system(size: 40))
                        //                    .bold()
                        //  Spacer()
                        Image("1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, alignment: .top)
                            .cornerRadius(350)
                        //.padding()
                        // Spacer()
                        Text("User Name")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .bold()
                        
                        Spacer(minLength: 40)
                        Text("My Advertisements")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .bold()
                        Divider()
                            .background(.white)
                        
                    }
                    
                    LazyVGrid(columns: gridLayout, spacing: 16) {
                        ForEach(items) { item in
                            VStack(spacing: 8) {
                                Image(item.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(8)
                                
                                TextBox(text: item.text1)
                                TextBox(text: item.text2)
                                TextBox(text: item.text3)
                            }
                        }
                    }
                    .padding()
                    
                    
                    
                }.toolbar { // <2>
                    ToolbarItem() { // <3>
                        HStack{
                            
                            Button(action: {
                                print("waleed")
                            }, label: {
                                Image(systemName: "pencil")
                                        .resizable()
                                        .frame(width: 35,height: 35)
                                        .foregroundColor(.white)
                            })
                           
                            
                            Spacer()
                            
                            Text("profile")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .bold()
                            Spacer()
                            
                     
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
                            Button(action: {
                               
                            }, label: {
                                NavigationLink(destination: SettingView()) {
                                    Image(systemName: "gearshape.2")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .foregroundColor(.white)
                                }
                            })
                           
                        }.frame(width: 380)
                        
                        
                    }
                }
                
                
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
            }
            }.background((
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.06, green: 0.19, blue: 0.34), location: 0.08),
                        Gradient.Stop(color: Color(red: 0.3, green: 0.42, blue: 0.45), location: 0.92),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 1)
                )
            ))
            
        }
    }
}
struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
