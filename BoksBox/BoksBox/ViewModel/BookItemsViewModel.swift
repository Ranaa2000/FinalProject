//
//  BookItemsViewModel.swift
//  BoksBox
//
//  Created by Rana MHD on 24/02/1445 AH.
//

import Foundation

class BookItemsViewModel: ObservableObject{
    @Published var list: Array<BookItem> = []
   
    func addItem(item: BookItem)  {
        list.append(item)
    }
    
    func deleteItems(at offsets: IndexSet) {
        list.remove(atOffsets: offsets)
    }
}
