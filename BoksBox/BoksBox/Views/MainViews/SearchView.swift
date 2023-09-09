//
//  SearchView.swift
//  BoksBox
//
//  Created by Rana MHD on 24/02/1445 AH.
//

import SwiftUI

struct SearchView: View {
    @State var Searched:String = ""
    var body: some View {
        VStack{
           
            HStack{
               
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.white)
                TextField("Search", text: $Searched)
              //  (Searched.isEmpty ? .white.opacity(0.5) : .white)
                    .foregroundColor(Color.white)
            }
            .frame(width: 350 )
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white, lineWidth: 2)
            )

            Spacer()
        }            // background color
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.06, green: 0.19, blue: 0.34), location: 0.08),
                    Gradient.Stop(color: Color(red: 0.3, green: 0.42, blue: 0.45), location: 0.92),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
        )
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
