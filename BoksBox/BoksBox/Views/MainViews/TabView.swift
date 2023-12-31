//
//  TabView.swift
//  FinalProject
//
//  Created by Rana MHD on 19/02/1445 AH.
//

import SwiftUI

struct TabdView: View {
    var body: some View {
        
        TabView{
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color("blueC") ,for: .tabBar)
            SearchView()
                .tabItem {
                    Label("Ask Me", image:"")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color("blueC") ,for: .tabBar)
            
            // change the name into the the view name
            NewPost()
                .tabItem {
                    Label("Post", systemImage: "plus")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color("blueC") ,for: .tabBar)
            
            FavoriteView()
                .tabItem {
                    Label("Favorite", systemImage: "heart")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color("blueC") ,for: .tabBar)
            
            Profile()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color("blueC") ,for: .tabBar)
        }
        
    }
}

struct TabBarViews_Previews: PreviewProvider {
    static var previews: some View {
        TabdView()
    }
}
