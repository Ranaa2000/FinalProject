//
//  SignUp.swift
//  FinalProject
//
//  Created by الوليد خشيم on 17/02/1445 AH.
//

import SwiftUI
//import FirebaseAuth

struct SignUpView: View {
    @State var Enteryourname: String = "ger"
    @State var Email: String = ""
    @State var Password: String = ""
    @State var PasswordCorint: String = ""
    @State var Username: String = ""
    var f : String = "Enter your username/Gmail"
    var body: some View {
        NavigationStack{ VStack {
            CastomTextFild(Controlir: Enteryourname, text: "Enter your name").padding(.bottom)
            CastomTextFild(Controlir: Email, text: "Email").padding(.bottom)
            CastomTextFild(Controlir: Password, text: "Password").padding(.bottom)
            CastomTextFild(Controlir: PasswordCorint, text: "Password Corint").padding(.bottom)
            CastomTextFild(Controlir: Username, text: "Username").padding(.bottom)
                
            Button {}
        label: {textbuttunSignUp()}
                .padding(.top,20)
            
            HStack{
                Text("Already have an account? ").font(Font.headline).foregroundColor(.white).bold()
                NavigationLink( destination: LogInView())
                {
                    Text("Log in").font(Font.system(size: 18)).bold()
                }
            }.padding(.top,40)
       

        }.frame(width: 400,height: 900).background(LinearGradient(
            stops: [
                Gradient.Stop(color: Color(red: 0.06, green: 0.19, blue: 0.34), location: 0.08),
                Gradient.Stop(color: Color(red: 0.3, green: 0.42, blue: 0.45), location: 0.92),
            ],
            startPoint: UnitPoint(x: 0.5, y: 0),
            endPoint: UnitPoint(x: 0.5, y: 1)
        ))
        .padding()
    }}
//    func createUser(username:String,Password:String){
//        Auth.auth().createUser(withEmail: username, password: Password){ok,erorr
//            in
//            if erorr == nil {
//                
//                boolpage = true
//                print(" ok")
//            }else
//            {
//                texteror = Text("Sorry, the password or email is incorrect")
//                print("nit ok")
//            }}}
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(Enteryourname: "", Email: "",Password: "",PasswordCorint: "",Username: "")
    }
}
