//
//  ContentView.swift
//  addFinalProject
//
//  Created by TAHANI AL ONEAZAN on 31/08/2023.
//

import SwiftUI
import FirebaseAuth

struct TextBox: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(.white)
            
    }
}
struct Profile: View {
    @EnvironmentObject var bookItems: BookItemsViewModel
    @State private var isMenuVisible = false
    
    private let gridLayout = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    @State private var uid: String = ""
    @State private var username: String = ""
    @State private var profileImage: URL = URL(fileURLWithPath: "")

    var body: some View {
        
            VStack{
            ScrollView{
                
                VStack {  Button(
                    action: {
                        Gwt().Token = ""
                    }, label: {
                        Image("Image").resizable().foregroundColor(.white).frame(width: 25,height: 35)
                    })
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
                        HStack  {
                            Text("Welcome \(username)")
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                                .bold()
                        }
                        Spacer(minLength: 40)
                        Text("My Books")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .bold()
                        Divider()
                            .background(.white)
                        
                    }
                    
                    LazyVGrid(columns: gridLayout, spacing: 16) {
                        ForEach(bookItems.items.filter({
                            item in return item.uid == uid
                        })) { item in
                            CardDetails(item: item)
                        }
                    }
                    .padding()
                    
                    
                    
                }.toolbar { // <2>
                    ToolbarItem() { // <3>
                        HStack{
                            
                          
                           
                            Button(action: {
                               
                            }, label: {
                                NavigationLink(destination: SettingView()) {
                                    Image(systemName: "gearshape.2")
                                        .resizable()
                                        .frame(width: 45, height: 35)
                                        .foregroundColor(.white)
                                }
                            })

                            Spacer()
//
//                            Text("profile")
//                                .foregroundColor(.white)
//                                .font(.system(size: 40))
//                                .bold()
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
                         
                            Button(
                                action: {
                                    Gwt().Token = ""
                                }, label: {
                                    Image("Image").resizable().foregroundColor(.white).frame(width: 25,height: 35)
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
            .onAppear() {
                let user = Auth.auth().currentUser
                if let user = user {
                    uid = user.uid
                    
                    if let email = user.email {
                        username = email
                    }
                    
                    if let photoURL = user.photoURL {
                        profileImage = photoURL
                    }
                }
            }
        
    }
}
struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
