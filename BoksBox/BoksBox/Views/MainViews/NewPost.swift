//
//  NewPost.swift
//
//  ContentView.swift
//  addFinalProject
//
//  Created by TAHANI AL ONEAZAN on 31/08/2023.


import SwiftUI
import UIKit
import FirebaseAuth

var te:String = "choose an image"

struct PlaceholderTextField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.white.opacity(0.5))
                    .padding(.horizontal, 16)
            }
            
            TextField("", text: $text)
                .foregroundColor(.white)
                .padding(20)
                .frame(height: 65)
                .background(Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white, lineWidth: 2)
                )
        }
    }
}

struct NewPost: View {
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    @State private var pagesText = ""
    @State var pushpage: Bool = false
    @State var rivechec: checRive?
    @State private var yearText = ""
    @State private var uid = ""
    @State private var item: BookItem = BookItem()
    @EnvironmentObject var bookItems: BookItemsViewModel
    
    let bookClassifications = ["Educational" , "Cultural" ,"Novel" ,"Other"]
    let cities  = ["Riyadh", "Jeddah", "Abha", "Dammam", "Taif", "Makkah", "Madinah"]
    let bookQuality = ["Good Quality", "Medium Quality", "Low Quality"]
    
    var body: some View {
        NavigationView{
            VStack{
                rivechec
                ScrollView{
                    VStack {
                        
                        // Book Title
                        TextField(text: $item.title){
                            Text("title").foregroundColor(.white)
                        }
                        .padding(20).foregroundColor(.white).frame(width: 380,height: 50)
                        .frame(height: 65)
                        .background(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .padding()
                        
                        // Author
                        TextField(text:$item.author){
                            Text("author").foregroundColor(.white)
                        }
                        .padding(20).foregroundColor(.white).frame(width: 380,height: 50)
                        .frame(height: 65)
                        .background(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .padding()
                        
                        // Country
                        TextField(text:$item.country){
                            Text("country").foregroundColor(.white)
                        }
                        .padding(20).foregroundColor(.white).frame(width: 380,height: 50)
                        .frame(height: 65)
                        .background(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .padding()
                        
                        // Language
                        TextField(text:$item.language){
                            Text("language").foregroundColor(.white)
                        }
                        .padding(20).foregroundColor(.white).frame(width: 380,height: 50)
                        .frame(height: 65)
                        .background(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .padding()
                        
                        // pages
                        TextField(text: $pagesText){
                            Text("page").foregroundColor(.white)
                        }
                        .padding(20).foregroundColor(.white).frame(width: 380,height: 50)
                        .frame(height: 65)
                        .background(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .padding()
                        
                        TextField(text: $item.mobileNumber){
                            Text("Mobile Number").foregroundColor(.white)
                        }
                        .padding(20).foregroundColor(.white).frame(width: 380,height: 50)
                        .frame(height: 65)
                        .background(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .padding()
                        
                        // year
                        TextField(text: $yearText){
                            Text("year").foregroundColor(.white)
                        }
                        .padding(20).foregroundColor(.white).frame(width: 380,height: 50)
                        .frame(height: 65)
                        .background(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .padding()
                        
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .padding()
                            
                            
                        }
                        
                        Button(action: {
                            isShowingImagePicker = true
                            te = ""
                        }) {
                            if isShowingImagePicker == false{
                                Text("image")
                                .foregroundColor(.white)}
                            else {
                                
                                Text("image")
                            }
                        }
                        .sheet(isPresented: $isShowingImagePicker) {
                            ImagePicker(selectedImage: $selectedImage)
                        }
                        
                        Button(
                            action: {
                                print("New")
                                let pages = Int(pagesText) ?? 1
                                let year = Int(yearText) ?? 2020
                                item.pages = pages
                                item.year = year
                                item.uid = uid
                                
                                let imageFileName = "\(UUID().uuidString).jpg"
                                if let imageData = selectedImage {
                                    bookItems.uploadImage(selectedImage: imageData, imageFileName: imageFileName)
                                    item.imageName = imageFileName
                                    bookItems.saveItem(item: item)
                                    pushpage = true
                                    rivechec = checRive()
                                } else {
                                    print("no image")
                                }
                            },
                            label: {
                                Text("sub")
                                    .foregroundColor(.white)
                            }
                        )
                        .padding()
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    
                }
                .padding(.top, 150)
                .padding(.bottom, 80)
            }
            // background color
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.06, green: 0.19, blue: 0.34), location: 0.08),
                        Gradient.Stop(color: Color(red: 0.3, green: 0.42, blue: 0.45), location: 0.92),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 1)
                )
            )
            .edgesIgnoringSafeArea(.all)
            .toolbar(){ // <2>
                ToolbarItem() { // <3>
                    HStack{
                        Text("New")
                            .foregroundColor(.white)
                        //.font(.system(size: 28))
                            .font(Font.custom("Roboto-Regular", size: 26))
                        
                            .bold()
                    }.frame(width: 380)
                }
            }
            .onAppear() {
                let user = Auth.auth().currentUser
                if let user = user {
                    uid = user.uid
                }
            }
        }
    }
}
struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedImage: UIImage?
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
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
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
}
struct NewPost_Previews: PreviewProvider {
    static var previews: some View {
        NewPost()
    }
}


