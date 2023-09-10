//
//  BoksBoxApp.swift
//  BoksBox
//
//  Created by الوليد خشيم on 21/02/1445 AH.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct BoksBoxApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    init() {
//        FirebaseApp.configure()
//    }
    @ObservedObject var vm = Vm()
    @ObservedObject var bookItems = BookItemsViewModel()
    
    var body: some Scene {
        WindowGroup {
         
                WelcomeView()
                    .environmentObject(vm)
                    .environmentObject(bookItems)
            
        }
    }
}
