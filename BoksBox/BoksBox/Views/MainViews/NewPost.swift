//
//  NewPost.swift
//
//  ContentView.swift
//  addFinalProject
//
//  Created by TAHANI AL ONEAZAN on 31/08/2023.
//

import SwiftUI
import UIKit
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
    
    @State private var textField1 = ""
    @State private var textField2 = ""
    @State private var textField3 = ""
    @State private var textField4 = ""
    @State private var textField5 = ""
    
    let bookClassifications = ["Educational" , "Cultural" ,"Novel" ,"Other"]
    let cities  = ["Riyadh", "Jeddah", "Abha", "Dammam", "Taif", "Meccah","Madinah","self Development","politics And Economics"]
    let bookQuality = ["Good Quality","Meduim Quality" ,"Low Quality"]
    
    var body: some View {
        
        NavigationView{
            VStack{
                ScrollView{
                    
                    VStack {
                        VStack{
                            //                            TextField(text:$textField1){
                            //                                            Text("Book classification").foregroundColor(.white)
                            //                                        }
                            //                                        .padding(20).foregroundColor(.white).frame(width: 380,height: 50)
                            //                                .frame(height: 65)
                            //
                            //                                .background(Color.clear)
                            //                                .overlay(
                            //                                                    RoundedRectangle(cornerRadius: 16)
                            //                                                        .stroke(Color.white, lineWidth: 2)
                            //                                                )
                            
                            //                            Menu {
                            //                                ForEach(bookClassifications, id: \.self) { classification in
                            //                                    Button(action: {
                            //                                        self.textField1 = classification
                            //                                    }) {
                            //                                        Text(classification)
                            //                                            .foregroundColor(.white)
                            //                                    }
                            //                                }
                            //                            } label: {
                            //                                PlaceholderTextField(placeholder: "Book Classification", text: $textField1)
                            //                            }
                            //                            .padding()
                            Menu {
                                ForEach(bookClassifications, id: \.self) { classification in
                                    Button(action: {
                                        self.textField1 = classification
                                    }) {
                                        Text(classification)
                                            .foregroundColor(.white)
                                    }
                                }
                            } label: {
                                HStack {
                                    Text("Select Book Classification")
                                        .foregroundColor(textField1.isEmpty ? .white.opacity(0.5) : .white)
                                        .padding(.horizontal, 16)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.white)
                                }
                            }
                            .padding()
                            .frame(width: 380,height: 50)
                            .frame(height: 65)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            
                            //  .padding()
                            
                            
                            
                            //  .padding()
                            
                            TextField(text:$textField2){
                                Text("Book Name").foregroundColor(.white)
                            }
                            .padding(20).foregroundColor(.white).frame(width: 380,height: 50)
                            .frame(height: 65)
                            
                            .background(Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .padding()
                            
                            //                            TextField(text:$textField3){
                            //                                Text("Book Condition").foregroundColor(.white)
                            //                            }
                            //                            .padding(20).foregroundColor(.white).frame(width: 380,height: 50)
                            //                            .frame(height: 65)
                            //
                            //                            .background(Color.clear)
                            //                            .overlay(
                            //                                RoundedRectangle(cornerRadius: 16)
                            //                                    .stroke(Color.white, lineWidth: 2)
                            //                            )
                            //                            .padding()
                            Menu {
                                ForEach(bookClassifications, id: \.self) { classification in
                                    Button(action: {
                                        self.textField1 = classification
                                    }) {
                                        Text(classification)
                                            .foregroundColor(.white)
                                    }
                                }
                            } label: {
                                HStack {
                                    Text("Select Book Classification")
                                        .foregroundColor(textField1.isEmpty ? .white.opacity(0.5) : .white)
                                        .padding(.horizontal, 16)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.white)
                                }
                            }
                            .padding()
                            .frame(width: 380,height: 50)
                            .frame(height: 65)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            //
                            //                            TextField(text:$textField4){
                            //                                Text("Location").foregroundColor(.white)
                            //                            }
                            //                            .padding(20).foregroundColor(.white).frame(width: 380,height: 50)
                            //                            .frame(height: 65)
                            //
                            //                            .background(Color.clear)
                            //                            .overlay(
                            //                                RoundedRectangle(cornerRadius: 16)
                            //                                    .stroke(Color.white, lineWidth: 2)
                            //                            )
                            //                            .padding()
                            
                            Menu {
                                ForEach(bookQuality, id: \.self) { classification in
                                    Button(action: {
                                        self.textField4 = classification
                                    }) {
                                        Text(classification)
                                            .foregroundColor(.white)
                                    }
                                }
                            } label: {
                                HStack {
                                    Text("Book Quality")
                                        .foregroundColor(textField4.isEmpty ? .white.opacity(0.5) : .white)
                                        .padding(.horizontal, 16)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.white)
                                }
                            }
                            .padding()
                            .frame(width: 380,height: 50)
                            .frame(height: 65)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .padding()
                            
                            TextField(text:$textField5){
                                Text("Your email / Phone number ").foregroundColor(.white)
                            }
                            .padding(20).foregroundColor(.white).frame(width: 380,height: 50)
                            .frame(height: 65)
                            
                            .background(Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .padding()
                            
                            //                            Image("diary-of-a-madman")
                            //                                .resizable()
                            //                                .aspectRatio(contentMode: .fit)
                            //                                .frame(width: 300,height: 300)
                            //
                            //                                .padding()
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
                                    Text("\(te)")
                                    .foregroundColor(.white)}
                                else {
                                    
                                    Text("\( te)")
                                }
                            }
                            .sheet(isPresented: $isShowingImagePicker) {
                                ImagePicker(selectedImage: $selectedImage)
                            }
                            
                            
                        }
                        
                        
                        
                        
                        
                    }.toolbar { // <2>
                        ToolbarItem() { // <3>
                            HStack{
                                
                                Button(action: {
                                    print("waleed")
                                }, label: {
                                    Image(systemName: "arrow.backward")
                                        .resizable()
                                        .frame(width: 35,height: 35)
                                        .foregroundColor(.white)
                                })
                                
                                Spacer()
                                
                                
                                Text("NewPost")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30))
                                    .bold()
                                Spacer()
                                
                                
                                
                                
                                
                            }.frame(width: 400)
                            
                            
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


