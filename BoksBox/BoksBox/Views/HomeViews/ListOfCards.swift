//
//  ListOfCards.swift
//  FinalProject
//
//  Created by Rana MHD on 18/02/1445 AH.
//

import SwiftUI
import FirebaseDatabase

struct ListOfCards: View {
    @EnvironmentObject var vm: Vm
    @EnvironmentObject var bookItems: BookItemsViewModel
    let ref = Database.database().reference(withPath: "books")
    @State var refObservers: [DatabaseHandle] = []
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(){
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(bookItems.items, id: \.self) { item in
                    CardDetails(item: item)
                }
            }
            .padding(.horizontal)
        }
        .onAppear() {
            if !bookItems.loaded {
                let completed = ref
                    .observe(.value) { snapshot in
                        var newItems: [BookItem] = []
                        for child in snapshot.children {
                            if
                                let snapshot = child as? DataSnapshot,
                                let bookItem = BookItem(snapshot: snapshot) {
                                newItems.append(bookItem)
                            }
                        }
                        bookItems.items = newItems
                        bookItems.loaded = true
                    }
                refObservers.append(completed)
            }
        }
    }
    
}
