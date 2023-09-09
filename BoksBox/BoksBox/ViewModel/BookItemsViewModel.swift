//
//  BookItemsViewModel.swift
//  BoksBox
//
//  Created by Rana MHD on 24/02/1445 AH.
//

import Foundation
import FirebaseDatabase

class BookItemsViewModel: ObservableObject{
    @Published var items: Array<BookItem> = []
    @Published var loaded: Bool = false
    
    func addItem(item: BookItem)  {
        items.append(item)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func saveItems() {
        //let ref = Database.database().reference(withPath: "books")
        let itemsArray = NSArray(array: items)
        //ref.setValue(itemsArray)
        print(itemsArray)
    }
}
