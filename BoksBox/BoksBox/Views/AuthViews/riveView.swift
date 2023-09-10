//
//  riveView.swift
//  BooksBox
//
//  Created by الوليد خشيم on 25/02/1445 AH.
//

import SwiftUI
import RiveRuntime
struct riveView: View {
    var body: some View {
        RiveViewModel(fileName:"327-628-checkmark-simple").view().frame(width: 100).padding(.top,-400).padding(.bottom,-400)
    }
}

struct riveView_Previews: PreviewProvider {
    static var previews: some View {
        riveView()
    }
}
