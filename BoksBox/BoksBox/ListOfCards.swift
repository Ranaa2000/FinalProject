//
//  ListOfCards.swift
//  FinalProject
//
//  Created by Rana MHD on 18/02/1445 AH.
//

import SwiftUI
var list  =  arr

var text:Array<String> = ["a1"," a1"]

struct ListOfCards: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    
    var body: some View {
        ScrollView(){
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(list, id: \.self) { item in
                    cardsDetails(image: item.image
                                 ,titil: item.titel
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
