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
    
   
//    func deleteItem(at index: Int) {
//        print(index)
//        print("BEFORE", arr.map(\.title))
//        arr.remove(at: index)
//        print("AFTER", arr.map(\.title))
//    }
//
//    func deleteItem(_ item: BookItem) {
//        arr.removeAll(where: { $0.id == item.id })
//    }
    func deleteItem(_ i : Int){
    arr.remove(at: i)
        }

}
