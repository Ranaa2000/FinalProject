//
//  vm.swift
//  BoksBox
//
//  Created by الوليد خشيم on 21/02/1445 AH.
//

import Foundation
class Vm: ObservableObject{
    @Published var arr: Array<BookItem> = [
    ]
   
    let home: Array<BookItem> = [
    ]


    func vm(newbook: BookItem)  {
        arr.append(newbook)
        print("\(arr)")
    }
    
   
    func deleteItem(at offsets: IndexSet) {
        arr.remove(atOffsets: offsets)
        }
    
}
