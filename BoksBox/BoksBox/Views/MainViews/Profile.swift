//
//  ContentView.swift
//  addFinalProject
//
//  Created by TAHANI AL ONEAZAN on 31/08/2023.
//

import SwiftUI
import FirebaseAuth



///////////////////////////////////

struct ImagePicker1: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedImage: UIImage?
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker1
        
        init(_ parent: ImagePicker1) {
            self.parent = parent
        }
        
        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
        ) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.selectedImage = selectedImage
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker1>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker1>) {
        
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
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
       @State private var selectedImage1: UIImage?
       @State private var isShowingImagePicker1 = false
       @ObservedObject var vm = BookItemsViewModel()
       
       @State private var item1: BookItem = BookItem()
       @EnvironmentObject var bookItems1: BookItemsViewModel
       @State private var pagesText1 = ""
       @State private var yearText1 = ""
       @State private var imageData: Data? = nil
    @EnvironmentObject var bookItems: BookItemsViewModel

    
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
                        VStack {
                            if let image = selectedImage1 {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 210, height: 210)
                            }else{
                                Image("1").resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 150, height: 150)
                            }
                            
                            Button(action: {
                                isShowingImagePicker1 = true
                            }) {
                                if isShowingImagePicker1 == false {
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .frame(width: 22, height: 25)
                                        .foregroundColor(.white)
                                } else {
                                    Text("image")
                                }
                            }
                            .sheet(isPresented: $isShowingImagePicker1) {
                                ImagePicker1(selectedImage: $selectedImage1)
                            }
                            
                            Button(action: {
                                print("New")
                                let pages = Int(pagesText1) ?? 1
                                let year = Int(yearText1) ?? 2020
                                item1.pages = pages
                                item1.year = year
                                let imageFileName = "\(UUID().uuidString).jpg"
                                if let imageData = selectedImage1 {
                                    bookItems1.uploadImage(selectedImage: imageData, imageFileName: imageFileName)
                                    item1.imageName = imageFileName
                                    bookItems1.saveItem(item: item1)
                                    
                                    
                                    self.imageData = imageData.pngData()
                                    UserDefaults.standard.set(self.imageData, forKey: "selectedImage")
                                } else {
                                    print("no image")
                                }
                            }) {
                                Text("")
                                    .foregroundColor(.white)
                            }
                        }
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

