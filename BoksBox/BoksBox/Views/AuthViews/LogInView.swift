//
//  SwiftUIView.swift
//  FinalProject
//
//  Created by الوليد خشيم on 15/02/1445 AH.
//

import SwiftUI
import FirebaseAuth

struct LogInView: View {
    @State var Password: String = ""
    @State var Email: String = ""
    
    var body: some View {
        NavigationStack{ VStack {
            image()
            CastomTextFild(Controlir: Email, text: "Enter your username/Gmail").padding(.bottom)
            CastomTextFild(Controlir: Password, text: "Password")
            
            Button {
                signIn(username: Email, Password: Password)
                
            }
        label: {textbuttun()}
                .padding(.top,40)
            
            HStack{
                Text("Don’t have an account? ").font(Font.headline).foregroundColor(.white).bold()
                NavigationLink( destination: SignUpView())
                {
                    Text("Sign Up").font(Font.system(size: 18)).bold()
                }
            }.padding(.top,40)
        }.frame(width: 400,height: 900).background(Colors().Backgroundcolor)
                .padding()
        }}
    func signIn(username:String,Password:String){
        Auth.auth().signIn(withEmail: username, password: Password){ok,erorr
            in
            if erorr == nil {
                Gwt().Token = "token"
                
                print(" ok")
            }else
            {
//                texteror = Text("Sorry, the password or email is incorrect")
                print("nit ok")
            }

        }
    }

}
struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView( Password: "", Email: "")
    }
}