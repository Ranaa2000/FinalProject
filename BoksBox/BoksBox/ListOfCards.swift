//
//  ListOfCards.swift
//  FinalProject
//
//  Created by Rana MHD on 18/02/1445 AH.
//

import SwiftUI
var items:Array<Dictionary> = [
    [
        "image":"a2",
        "name":"Book1"
    ],
    [
        "image":"a3",
        "name":"Book2"
    ],
    [
        "image":"a1",
        "name":"Book 3"
    ],
    [
        "image":"a1",
        "name":"Book 4"
    ],
    [
        "image":"a1",
        "name":"Book 5"
    ],
    [
        "image":"a1",
        "name":"Book 6"
    ]
]

var text:Array<String> = ["a1"," a1"]

struct ListOfCards: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    
    var body: some View {
        ScrollView(){
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(items, id: \.self) { item in
                    cardsDetails(image: item["image"] ?? "a1"
                                 ,titil: item["name"] ?? "a1"
                    )
                }
            }
            .padding(.horizontal)
        }
        
    }
    
}

struct ListOfCards_Previews: PreviewProvider {
    static var previews: some View {
        ListOfCards()
    }
}
