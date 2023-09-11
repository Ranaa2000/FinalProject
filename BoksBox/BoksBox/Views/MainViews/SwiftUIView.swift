//
//  SwiftUIView.swift
//  BooksBox
//
//  Created by الوليد خشيم on 26/02/1445 AH.
//

import SwiftUI


struct SwiftUIView: View {
    @State private var items = ["Item 1", "Item 2", "Item 3", "Item 4"]
    @EnvironmentObject var vm: Vm

    var body: some View {
        NavigationView {
            List {
                ForEach(vm.arr,id: \.self) { index in
//                            Cardfev(item: index,
//                                    icon:"heart.fill"
//                                    )
                    Text(index.title)
                    
                    
                    // Can't get index, so this won't work
                    
                }  .onDelete(perform: deleteItem)
            }
            .navigationTitle("Swipe to Delete")
        }
    }
     func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
