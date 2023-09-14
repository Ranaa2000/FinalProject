//
//  SignUp.swift
//  FinalProject
//
//  Created by الوليد خشيم on 17/02/1445 AH.
//

import SwiftUI
import FirebaseAuth
import RiveRuntime

struct SignUpView: View {
    @State var Rive : riveView?
    @State var coloreror: Color = Color.red
    @State var texteror: Text = Text("")
    @State var Enteryourname: String = ""
    @State var Email: String = ""
    @State var Password: String = ""
    @State var PasswordCorint: String = ""
    
    var f : String = "Enter your username/Gmail"
    var body: some View {
      
            VStack {
//                TextField("aa", text: $Email)
//                    .background(Color.red)
                VStack {
                    TextField(text:$Enteryourname){
                        Text("name").foregroundColor(.white)
                    }
                    .padding(20).foregroundColor(.white).frame(width: 350,height: 50).background(Color.gray.opacity(0.6)).cornerRadius(10)
                }.padding(.bottom)
                VStack {
                    TextField(text:Gwt().$Username){
                        Text("user").foregroundColor(.white)
                    }
                    .padding(20).foregroundColor(.white).frame(width: 350,height: 50).background(Color.gray.opacity(0.6)).cornerRadius(10)
                }.padding(.bottom)
                VStack {
                    TextField(text:$Email){
                        Text("email").foregroundColor(.white)
                    }
                    .padding(20).foregroundColor(.white).frame(width: 350,height: 50).background(Color.gray.opacity(0.6)).cornerRadius(10)
                }.padding(.bottom)
                VStack {
                    SecureField(text:$Password){
                        Text("password").foregroundColor(.white)
                    }
                    .padding(20).foregroundColor(.white).frame(width: 350,height: 50).background(Color.gray.opacity(0.6)).cornerRadius(10)
                }.padding(.bottom)
                VStack {
                    SecureField(text:$PasswordCorint){
                        Text("passwod1").foregroundColor(.white)
                    }
                    .padding(20).foregroundColor(.white).frame(width: 350,height: 50).background(Color.gray.opacity(0.6)).cornerRadius(10)
                }.padding(.bottom)
              
                
//                TextField("aa", text: $Password)
//                    .background(Color.red)
//           CastomTextFild(Controlir: Enteryourname, text: "Enter your name").padding(.bottom)
//            CastomTextFild(Controlir: Email, text: "Email").padding(.bottom)
//            CastomTextFild(Controlir: Password, text: "Password").padding(.bottom)
//            CastomTextFild(Controlir: PasswordCorint, text: "Password Corint").padding(.bottom)
//            CastomTextFild(Controlir: Username, text: "Username").padding(.bottom)
            
//            Button {
//                createUser(username: Email, Password: Password)
//                print("a")
//            }
//        label: {
//            textbuttunSignUp()
//
//        }
            Button {
                print("ok")
                createUser(username: Email, Password: Password,PasswordCorint:PasswordCorint)
            } label: {
                textbuttunSignUp()
            }

            
            
              //  .padding(.top,20)
            
//            HStack{
//                Text("Already have an account? ").font(Font.headline).foregroundColor(.white).bold()
//                NavigationLink( destination: LogInView())
//                {
//                    Text("Log in").font(Font.system(size: 18)).bold()
//                }
//            }.padding(.top,40)
                VStack{
                    texteror.foregroundColor(coloreror)
                  
                    Rive
                       
                  
                    
                }.frame(maxWidth: 300,maxHeight:100)

        }.frame(width: 400,height: 900).background(LinearGradient(
            stops: [
                Gradient.Stop(color: Color(red: 0.06, green: 0.19, blue: 0.34), location: 0.08),
                Gradient.Stop(color: Color(red: 0.3, green: 0.42, blue: 0.45), location: 0.92),
            ],
            startPoint: UnitPoint(x: 0.5, y: 0),
            endPoint: UnitPoint(x: 0.5, y: 1)
        ))
        .padding()
    }
    func createUser(username:String,Password:String,PasswordCorint:String){
        Auth.auth().createUser(withEmail: username, password: Password){ok,error in
            if error == nil && Password == PasswordCorint{
                coloreror = Color.green
                Rive = riveView()
                texteror = Text("Wellcom To \(Enteryourname)")
                               print(" ok")
            } else{
                texteror = Text("Sorry, the password or email  is incorrect")
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(Enteryourname: "", Email: "",Password: "",PasswordCorint: "")
    }
}

    //            if erorr == nil {
    //
    ////                boolpage = true
    //                print(" ok")
    //            }else
    //            {
    ////                texteror = Text("Sorry, the password or email is incorrect")
    //                print("nit ok")
    //            }}
