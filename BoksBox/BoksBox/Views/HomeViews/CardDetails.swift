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
    @EnvironmentObject var bookItems: BookItemsViewModel
    let storageRef = Storage.storage().reference()
    @State var item: BookItem
    @State var icon: String = "heart"
    @State var coloricon: Color = .black
    @State var imageUrl: URL = URL(string: "https://placehold.co/400")!
    @State var isFavorited: Bool = false
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
                             
                            if isFavorited {
                                // remove
                                print("Removing", item.title)
                                vm.arr.removeAll(where: { $0.id == item.id })
                            } else {
                                // add
                                print("Adding", item.title)
                                vm.arr.append(item)
                            }
                            
                            isFavorited.toggle()
//                          if con == 0
//                            {
//
//                                coloricon = .red
//                                icon = "heart.fill"
//                                vm.vm(newbook: item)
//
//                          }
//                            con += 1
                        }, label: {
                            Image(systemName: isFavorited ? "heart.fill" : "heart")
                                .resizable()
                                .frame(width: 25,height: 23)
                                .foregroundColor(isFavorited ? .red : .black)
                        })
                    }
                    .padding(.bottom, 10)
                }
                .frame(width: 160,height: 270)
                .background(Color.white.opacity(0.759))
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
            
            isFavorited = vm.arr.contains(where: { $0.id == item.id })
        }
    }
}
