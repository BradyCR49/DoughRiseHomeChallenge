//
//  ContentView.swift
//  doughriseHome
//
//  Created by Brady Rhodes on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        tabs()
        }
    }

struct tabs: View{
    var body: some View{
        TabView{
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                        .foregroundColor(.blue)
                }
            Text(" ")
                .tabItem {
                    Label("History", systemImage: "book")
                        .foregroundColor(.blue)
                }
            Text(" ")
                .tabItem {
                    Label("Transactions", systemImage: "plus.circle")
                        .foregroundColor(.blue)
                }
            Text(" ")
                .tabItem {
                    Label("Goals", systemImage: "building.columns")
                        .foregroundColor(.blue)
                }
            Text("me")
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                        .foregroundColor(.blue)
                    
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}

