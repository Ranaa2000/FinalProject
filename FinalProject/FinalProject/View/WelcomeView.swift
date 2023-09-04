//
//  WelcomeView.swift
//  FinalProject
//
//  Created by الوليد خشيم on 18/02/1445 AH.
//



import SwiftUI
import RiveRuntime


struct WelcomeView: View {
    var body: some View {
        
        VStack{
           
            
        ZStack{

                Text("Books Box").font(Font.system(size: 50)).foregroundColor(Color(hue: 1.0, saturation: 0.01, brightness: 0.839)).frame(width: 300,height: 120).background(Color(red: 0.06, green: 0.19, blue: 0.34).gradient).cornerRadius( 90).overlay(
                    RoundedRectangle(cornerRadius: 90)
                        .stroke(Color(red: 0.206, green: 0.114, blue: 0.002), lineWidth: 5)
                )
                    .bold().padding(.bottom,259)
            
            VStack{
//                RiveViewModel(fileName:"113-173-loading-book").view().frame(width: 240,height: 650).padding(-158).padding(.leading,65)
                Spacer()
               
                Button {
                    
                } label: {
                    Text("Get Starts").font(Font.system(size: 35)).bold().foregroundColor(Color(red: 0.06, green: 0.19, blue: 0.34)).frame(width: 350,height: 65).background(Color(hue: 1.0, saturation: 0.01, brightness: 0.839).gradient).cornerRadius(20)
                }.padding(.bottom,5)
            }
        }
   
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background( Image("backgrawnd").resizable().edgesIgnoringSafeArea(.all))

    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
           
