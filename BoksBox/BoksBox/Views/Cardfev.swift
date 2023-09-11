//
//  Cardfev.swift
//  BoksBox
//
//  Created by الوليد خشيم on 22/02/1445 AH.
//



import SwiftUI
import FirebaseStorage


    struct Cardfev: View {
        @EnvironmentObject var vm: Vm
        @EnvironmentObject var bookItems: BookItemsViewModel
        let storageRef = Storage.storage().reference()
        @State var item: BookItem
        var icon: String = "heart.fill"
      
        
        @State var imageUrl: URL = URL(string: "https://placehold.co/400")!
        
        var body: some View {
            VStack{
                NavigationLink {
                    ShowDetailsView(description: item.author, bookType: item.country, Bookname: item.title, image: imageUrl)
                } label: {
                    VStack {
                        VStack{
                            AsyncImage(
                                url: imageUrl,
                                content: { image in
                                    image.resizable().cornerRadius(10)
    //                                    .aspectRatio(contentMode: .fit)
                                        .frame(width: 145, height: 185 )
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                            
                        }.frame(width: 145,height: 185).background(Color.gray.opacity(0.3)).cornerRadius(10).padding(.top,4)
                        HStack{
                            Text(item.title)
                            Spacer()
                        }
                        .frame(width: 135, height: 20)
                        HStack {
                            VStack{
                                HStack{
                                    Text(item.country)
                                        .font(.system(size: 13))
                                }
                            }
                            .frame(width: 104)
                         
                            Button(action: {
                                print("deleting item at")
                               
//                                vm.deleteItem(item)
                            }, label: {
                                    Image(systemName: icon).resizable().foregroundColor(.red).frame(width: 25,height: 23)
                                })
                           
                        }
                        .padding(.bottom, 10)
                    }
                    .frame(width: 160,height: 270)
                    .background(Color.white.opacity(0.859))
                    .cornerRadius(20).padding(.top,16)
                }
                .foregroundColor(.black)
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
