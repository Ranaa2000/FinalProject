//
//  SearchView.swift
//  BoksBox
//
//  Created by Rana MHD on 24/02/1445 AH.
//

import SwiftUI

struct SearchView: View {
    
  

   
        @State private var bookName = ""
        @State private var chatResponse = ""

        func sendBookNameToChatGPT() {
            // Replace 'YOUR_API_KEY' with your actual OpenAI API key
            let apiKey = "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"

            guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else {
                return
            }

            let headers = [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(apiKey)"
            ]

            let body = [
                "model": "gpt-3.5-turbo",
                "messages": [
                    ["role": "system", "content": "You are a helpful assistant, and if anyone sends you the name of a book, provide the author's name and some details about the book."],
                    ["role": "user", "content": "Book: \(bookName)"]
                ]
            ] as [String : Any]

            let jsonData = try? JSONSerialization.data(withJSONObject: body)

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.allHTTPHeaderFields = headers

            URLSession.shared.dataTask(with: request) { data, _, error in
                if let data = data {
                    if let response = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let choices = response["choices"] as? [[String: Any]], let message = choices[0]["message"] as? [String: Any], let content = message["content"] as? String {
                            DispatchQueue.main.async {
                                self.chatResponse = content
                            }
                        }
                    }
                } else {
                    print("Error: \(error?.localizedDescription ?? "Unknown error")")
                }
            }.resume()
        }
    @State var backgrawndcalar: Color = .clear
    @State var backgrawndcalar1: Color = .clear
        var body: some View {
            
                VStack{
                    Text("").frame(width: 350,height: 50).background(Color.clear)
                 
                        
                        
                        
                        HStack{
                            Image("Sentmasseg").resizable().frame(width: 50, height:50 )
                                .cornerRadius(80).padding(8)
                            
                            Text("Books Box AI").font(Font.title).bold()
                            
                        }.frame(width: 390,height: 60,alignment: .leading).background(Color.white)
                        
                        Spacer()
                    
                        ScrollView{
                                   
                            Text(chatResponse).padding().background(chatResponse == "" ? .clear : .white).frame(width: 370,alignment: .trailing).cornerRadius(20)
                            Spacer()
                           
                            HStack{
                                Text(bookName).padding().foregroundColor(backgrawndcalar1).background(backgrawndcalar).cornerRadius(16)
                            }.frame(width: 370,alignment: .trailing)
                        }
                       
                       HStack{
                       
                           TextField("Enter the name of the book", text: $bookName) .padding(20).foregroundColor(.black).frame(width: 310,height: 30)
                               .frame(height: 40)
                               .background(Color.clear)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 16)
                                       .stroke(Color.white, lineWidth: 2)
                               )
                               
                           
                           Button(action: {
                               sendBookNameToChatGPT()
                               
                               backgrawndcalar = .white
                               backgrawndcalar1 = .black
                           }) {
                               Image("Sentmasseg").resizable().frame(width: 35, height:35 )
                                   .cornerRadius(80).padding(2)
                           }
                       }.background(Color.white).cornerRadius(16).padding(.bottom,25)
                    Text("").frame(width: 350,height: 60).background(Color.clear)
                    } .frame(maxWidth: .infinity,maxHeight: .infinity).background(LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 0.06, green: 0.19, blue: 0.34), location: 0.08),
                            Gradient.Stop(color: Color(red: 0.3, green: 0.42, blue: 0.45), location: 0.92),
                        ],
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 1)
                    )).edgesIgnoringSafeArea(.all)
                    .navigationBarTitle("Book Details Chat", displayMode: .inline)
                
            }
        
               }

    


