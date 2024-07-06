//
//  ReduxTestProjectApp.swift
//  ReduxTestProject
//
//  Created by Nebo on 06.07.2024.
//

import SwiftUI

@main
struct ReduxTestProjectApp: App {
    
    let store = Store()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
