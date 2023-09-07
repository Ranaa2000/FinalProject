//
//  BoksBoxApp.swift
//  BoksBox
//
//  Created by الوليد خشيم on 21/02/1445 AH.
//

import SwiftUI

@main
struct BoksBoxApp: App {
//    init() {
//        FirebaseApp.configure()
//    }
    @ObservedObject var vm = Vm()
    
    var body: some Scene {
        WindowGroup {
         
                WelcomeView()
                    .environmentObject(vm)
            
        }
    }
}
