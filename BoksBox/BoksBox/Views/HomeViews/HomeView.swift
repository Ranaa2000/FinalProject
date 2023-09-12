//
//  HomeView.swift
//  FinalProject
//
//  Created by Rana MHD on 18/02/1445 AH.
//
import SwiftUI
import FirebaseDatabase

struct HomeView: View {
   // @ObservedObject var BookItemsViewModel1 = BookItemsViewModel()
    @EnvironmentObject var  BookItemsViewModel1 : BookItemsViewModel
    @State var Searched : String = ""
    @State var  filtterCard : Array<BookItem> = []
    
    @EnvironmentObject var vm: Vm
    @EnvironmentObject var bookItems: BookItemsViewModel
    let ref = Database.database().reference(withPath: "books")
    @State var refObservers: [DatabaseHandle] = []
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
       
            VStack{
                HStack{
 
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.white)
                    TextField("Search", text: $Searched)
                   // (Searched.isEmpty ? .white.opacity(0.5) : .white)
                        .foregroundColor(Color.white)
                }
                .frame(width: 330 )
                .padding(.vertical,6)
                .padding(.horizontal,16)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 2)
                )

                
//                ScrollView{
//                    ListOfCards()
//                } .padding(.top, 150)
//                // to view books
                if Searched.isEmpty{
                    ScrollView{
                        ListOfCards()
                    } .padding(.top)
                }else{
                    ScrollView(){
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(filtterCard, id: \.self) { item in
                                CardDetails(item: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .onAppear() {
                        if !bookItems.loaded {
                            let completed = ref
                                .observe(.value) { snapshot in
                                    var newItems: [BookItem] = []
                                    for child in snapshot.children {
                                        if
                                            let snapshot = child as? DataSnapshot,
                                            let bookItem = BookItem(snapshot: snapshot) {
                                            newItems.append(bookItem)
                                        }
                                    }
                                    bookItems.items = newItems
                                    bookItems.loaded = true
                                }
                            refObservers.append(completed)
                        }
                    }
                    }
                }
               
                

            
            .onAppear{
                filtterCard = BookItemsViewModel1.items
                
            }
            .onChange(of: Searched) { newVlue in
                
                filtterCardBasedOn(newVlue)
            }
            
            // background color
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.06, green: 0.19, blue: 0.34), location: 0.08),
                        Gradient.Stop(color: Color(red: 0.3, green: 0.42, blue: 0.45), location: 0.92),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 1)
                )
            )
           // .edgesIgnoringSafeArea(.all)
            .toolbar(){ // <2>
                ToolbarItem() { // <3>
                    HStack{
                       
                        
                    }.frame(width: 380)
                    
                    
                }
            }
    }
    func filtterCardBasedOn(_ value: String){
        if value.isEmpty{
            filtterCard = BookItemsViewModel1.items
        }else{
            let lowercase = value.lowercased()
            filtterCard = BookItemsViewModel1.items.filter({
                card in return card.title.lowercased().contains(lowercase)
            })
        }
    }
}
