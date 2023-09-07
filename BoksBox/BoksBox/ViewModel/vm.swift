//
//  vm.swift
//  BoksBox
//
//  Created by الوليد خشيم on 21/02/1445 AH.
//

import Foundation
class Vm: ObservableObject{
    @Published var arr: Array<Bookmodel> = [
        Bookmodel(titel: "tg4g",image: "a1")
    
    ]
   
    let home: Array<Bookmodel> = [
        Bookmodel(titel: "tgr4g",image: "a1"),
        Bookmodel(titel: "tgf4g",image: "a1"),
        Bookmodel(titel: "tgs4g",image: "a1"),
        Bookmodel(titel: "tgg4g",image: "a1"),
        Bookmodel(titel: "tgu4g",image: "a1"),
    ]


    func vm( newbook:Bookmodel)  {
        arr.append(newbook)
        print("\(arr)")
    }
    func deleteItems(at offsets: IndexSet) {
        arr.remove(atOffsets: offsets)
    }
    
}
