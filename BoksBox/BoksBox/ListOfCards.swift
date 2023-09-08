//
//  ListOfCards.swift
//  FinalProject
//
//  Created by Rana MHD on 18/02/1445 AH.
//

import SwiftUI
import FirebaseDatabase

var text:Array<String> = ["a1"," a1"]

struct ListOfCards: View {
    @EnvironmentObject var vm: Vm
    let ref = Database.database().reference(withPath: "books")
    @State var refObservers: [DatabaseHandle] = []
    @State var items: [BookItem] = []
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    
    var body: some View {
        ScrollView(){
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(self.items, id: \.self) { item in
                    CardDetails(item: item)
                }
            }
            .padding(.horizontal)
        }
        .onAppear() {
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
                    self.items = newItems
                }
            refObservers.append(completed)
        }
    }
    
}
