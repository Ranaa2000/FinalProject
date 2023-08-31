//
//  Image.swift
//  FinalProject
//
//  Created by الوليد خشيم on 15/02/1445 AH.
//

import SwiftUI

struct image: View {
    var body: some View {
        VStack{
            Image("Loginimage").resizable().frame(width: 300,height: 300).padding(.bottom, 80)
        }
    }
}

struct Image_Previews: PreviewProvider {
    static var previews: some View {
        image()
    }
}
