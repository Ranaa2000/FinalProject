//
//  SwiftUIView.swift
//  FinalProject
//
//  Created by الوليد خشيم on 15/02/1445 AH.
//

import SwiftUI

struct LogInView: View {
    @State var Password: String
    @State var Email: String
    var f : String = "Enter your username/Gmail"
    var body: some View {
        NavigationStack{ VStack {
            image()
            CastomTextFild(Controlir: Email, text: "Enter your username/Gmail").padding(.bottom)
            CastomTextFild(Controlir: Password, text: "Password")
            
            Button {}
        label: {textbuttun()}
                .padding(.top,40)
            
            HStack{
                Text("Don’t have an account? ").font(Font.headline).foregroundColor(.white).bold()
                NavigationLink( destination: Text("hhhhhhhhhhh"))
                {
                    Text("Sign Up").font(Font.system(size: 18)).bold()
                }
            }.padding(.top,40)
        }.frame(width: 400,height: 900).background(Colors().Backgroundcolor)
                .padding()
        }}
}
struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView( Password: "", Email: "")
    }
}
