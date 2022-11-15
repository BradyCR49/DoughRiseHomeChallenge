//
//  doughriseHomeApp.swift
//  doughriseHome
//
//  Created by Brady Rhodes on 11/11/22.
//

import SwiftUI

@main
struct doughriseHomeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
        }
    }
}
