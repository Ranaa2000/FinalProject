//
//  ShicToken.swift
//  BoksBox
//
//  Created by الوليد خشيم on 22/02/1445 AH.
//


import SwiftUI

struct SheckTheToken: View {
   
    @ObservedObject var token = Gwt()
   
    var body: some View {
        
      
        
        if token.Token == ""  {
            
            LogInView()
        } else   {
            TabdView()
        }
    }
}

struct SheckTheToken_Previews: PreviewProvider {
    static var previews: some View {
        SheckTheToken()
    }
}
