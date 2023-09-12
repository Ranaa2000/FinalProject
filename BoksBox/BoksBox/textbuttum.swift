//
//  textbuttum.swift
//  FinalProject
//
//  Created by الوليد خشيم on 15/02/1445 AH.
//

import SwiftUI

struct textbuttun: View {
    var body: some View {
        Text("log1").frame(width: 300,height: 50).bold().foregroundColor(.black).background(Color.white).cornerRadius(20)
    }
}

struct textbuttun_Previews: PreviewProvider {
    static var previews: some View {
        textbuttun()
    }
}
