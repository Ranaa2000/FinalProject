//
//  CardDetails .swift
//  FinalProject
//
//  Created by Rana MHD on 18/02/1445 AH.
//

import SwiftUI
import FirebaseStorage

struct CardDetails: View {
    @EnvironmentObject var vm: Vm
    let storageRef = Storage.storage().reference()
    @State var item: BookItem
    var icon: String = "heart"
    
    @State var imageUrl: URL = URL(string: "https://placehold.co/400")!

    var body: some View {
        VStack{
            NavigationLink {
                ShowDetailsView()
            } label: {
                VStack{
                    VStack {
                        AsyncImage(url: imageUrl)
                        
                            .frame(width: 140, height: 175)
                        HStack{
                            Text(item.title)
                            Spacer()
                        }.frame(width: 135, height: 20)
                        HStack{
                            VStack{
                                HStack{
                                    Text(item.author)
                                    Spacer()
                                    
                                }
                                HStack{
                                    Text(item.country)
                                    Spacer()
                                }
                                
                            }.frame(width: 104)
                            Button(action: {
                                vm.vm(newbook: item)
                            }, label: {
                                Image(systemName: icon).resizable().foregroundColor(.red).frame(width: 25,height: 23)
                            })
                        }
                    }.frame(width: 140)
                        .padding(10)
                }.background(Color.white).cornerRadius(20)
                
            }.foregroundColor(.black)
            
            
            
            
            
        }
        .onAppear() {
            let path = storageRef.child(item.imageName)
            // Fetch the download URL
            path.downloadURL { url, error in
                if let error = error {
                    print("\(item.imageName) not found")
                    print(error)
                }
                if let url = url {
                    imageUrl = url
                }
            }
        }
    }
}
