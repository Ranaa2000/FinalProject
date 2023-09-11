//
//  checRive.swift
//  BooksBox
//
//  Created by الوليد خشيم on 26/02/1445 AH.
//

import SwiftUI
import RiveRuntime
struct checRive: View {
//    init(){
//        UITabBar.appearance().isHidden = true
//
//    }
    var body: some View {
        
            NavigationLink(destination: {
                SheckTheToken()
            }, label: {
                
                    ZStack{
                        RiveViewModel(fileName:"1247-2400-check-icon").view().frame(width: 320 ,height:  350).cornerRadius(380)
                    }.frame(maxWidth: 300,maxHeight: 300).cornerRadius(380).padding(.top , 300)
                
            })
        
    }
}

struct checRive_Previews: PreviewProvider {
    static var previews: some View {
        checRive()
    }
}
