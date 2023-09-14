//
//  SwiftUIView.swift
//  FinalProject
//
//  Created by الوليد خشيم on 15/02/1445 AH.
//

import SwiftUI
import FirebaseAuth

struct LogInView: View {
    @State var texteror: Text = Text("")
    @State var Password: String = ""
    @State var Email: String = ""
    
    var body: some View {
        VStack {
            image()
            VStack {
                TextField(text:$Email){
                    Text("enter").foregroundColor(.white)
                }
                .padding(20).foregroundColor(.white).frame(width: 350,height: 50).background(Color.gray.opacity(0.6)).cornerRadius(10)
            }.padding(.bottom)
            VStack {
                TextField(text:$Password){
                    Text("pass").foregroundColor(.white)
                }
                .padding(20).foregroundColor(.white).frame(width: 350,height: 50).background(Color.gray.opacity(0.6)).cornerRadius(10)
            }.padding(.bottom)
//            CastomTextFild(Controlir: Email, text: "Enter your username/Gmail").padding(.bottom)
//            CastomTextFild(Controlir: Password, text: "Password")
//
            Button {
                signIn(username: Email, Password: Password)
                
            }
        label: {textbuttun()}
                .padding(.top,40)
            
            HStack{
                Text("have").font(Font.headline).foregroundColor(.white).bold()
                NavigationLink( destination: SignUpView() )
                {
                    Text("sign1").font(Font.system(size: 18)).bold()
                }
            }.padding(.top,40)
            HStack{
                texteror.foregroundColor(.red)
            }.padding(.top,10)

        }.frame(width: 400,height: 900).background(Colors().Backgroundcolor)
                .padding()
        }
    func signIn(username:String,Password:String){
        Auth.auth().signIn(withEmail: username, password: Password){ok,erorr
            in
            if erorr == nil {
                Gwt().Token = "token"
                
                print(" ok")
            }else
            {
                texteror = Text("Sorry, the password or email is incorrect")
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
