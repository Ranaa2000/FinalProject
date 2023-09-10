//
//  BookItemsViewModel.swift
//  BoksBox
//
//  Created by Rana MHD on 24/02/1445 AH.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage
import SwiftUI

class BookItemsViewModel: ObservableObject{
    @Published var items: Array<BookItem> = []
    @Published var loaded: Bool = false
    
    func addItem(item: BookItem)  {
        items.append(item)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func saveItem(item: BookItem) {
        let child = Database.database().reference(withPath: "books").childByAutoId()
        child.setValue(item.toAnyObject())
    }
    
    func uploadImage(selectedImage: UIImage, imageFileName: String) {
        let storage = Storage.storage().reference()
        let ImageData = selectedImage.jpegData(compressionQuality: 0.9)
        let islandRef = storage.child("\(imageFileName)")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"

        islandRef.putData(ImageData!, metadata: metadata) { _, error in
            if let error = error {
                print("Error uploading image: \(error)")
            } else {
                islandRef.downloadURL { url, error in
                    if let error = error {
                        print("Error getting download URL: \(error)")
                    } else {
                        print(url!)
                    }
                }
            }

        }
        
    }
}
