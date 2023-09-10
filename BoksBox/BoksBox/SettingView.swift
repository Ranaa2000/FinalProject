//
//  SettingView.swift
//  addFinalProject
//
//  Created by TAHANI AL ONEAZAN on 03/09/2023.
//

import SwiftUI
//
//struct SettingView: View {
//    var body: some View {
//        NavigationView {
//            ListView()
//                .navigationTitle("Settings")
//        }
//    }
//}
//
//struct ListView: View {
//    let languages = ["Arabic", "English"]
//    let modes = ["Light Mode", "Dark Mode"]
//
//    var body: some View {
//        List {
//            Section(header: Text("Language")) {
//                ForEach(languages, id: \.self) { language in
//                    Text(language)
//                }
//            }
//
//            Section(header: Text("Mode")) {
//                ForEach(modes, id: \.self) { mode in
//                    Text(mode)
//                }
//            }
//        }
//    }
//}
struct SettingView: View {
    var body: some View {
        NavigationView {
            ListView()
                .navigationTitle("Settings")
        }
    }
}

struct CheckmarkRow: View {
    let title: String
    @Binding var isChecked: Bool
    
    var body: some View {
        Toggle(isOn: $isChecked) {
            Text(title)
        }
    }
}

struct ListView: View {
    @State private var selectedLanguages: Set<String> = []
    @State private var selectedModes: Set<String> = []
    
    let languages = ["Arabic", "English"]
    let modes = ["Light Mode", "Dark Mode"]
    
    var body: some View {
        List {
            Section(header: Text("Language")) {
                ForEach(languages, id: \.self) { language in
                    CheckmarkRow(title: language, isChecked: Binding(
                        get: { selectedLanguages.contains(language) },
                        set: { isChecked in
                            if isChecked {
                                selectedLanguages.insert(language)
                            } else {
                                selectedLanguages.remove(language)
                            }
                        }
                    ))
                }
            }
            
            Section(header: Text("Mode")) {
                ForEach(modes, id: \.self) { mode in
                    CheckmarkRow(title: mode, isChecked: Binding(
                        get: { selectedModes.contains(mode) },
                        set: { isChecked in
                            if isChecked {
                                selectedModes.insert(mode)
                            } else {
                                selectedModes.remove(mode)
                            }
                        }
                    ))
                }
            }
            Button(action: {
                Gwt().Token = ""
            }, label: {
                Section(header: Text("sing out")) {
                 
                }
            })
            
        }
    }
}
//
//struct LanguageDetailView: View {
//    var language: String
//
//    var body: some View {
//        Text("Selected language: \(language)")
//            .navigationBarTitle(language)
//    }
//}
//
//struct ModeDetailView: View {
//    var mode: String
//
//    var body: some View {
//        Text("Selected mode: \(mode)")
//            .navigationBarTitle(mode)
//    }
//}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
