//
//  SwiftUIView.swift
//  FinalProject
//
//  Created by الوليد خشيم on 15/02/1445 AH.
//

import SwiftUI


struct CastomTextFild: View {
    @State var Controlir: String
   var text: String
    var body: some View {
        VStack {
            TextField(text:$Controlir){
                Text(text).foregroundColor(.white)
            }
            .padding(20).foregroundColor(.white).frame(width: 350,height: 50).background(Color.gray.opacity(0.6)).cornerRadius(10)
        }
    }
    
}

struct CastomTextFild_Previews: PreviewProvider {
    static var previews: some View {
        CastomTextFild(Controlir: "", text: "")
    }
}
